# Start step
echo "Starting Halide to Hardware Step"
this_dir=$PWD
cd ..
source ./flow_setup.sh

# Go to correct location        
cd $hal_to_hw_input_path

# Remove Old outputs 
rm $hal_to_hw_output_path/compute.json
rm $hal_to_hw_output_path/${app_name}_compute.h

# Running Halide to Hardware
make compiler
make clockwork
make run-cpu
make run-clockwork


# Collect and send outputs to step
cd $hal_to_hw_output_path
cp compute.json $this_dir/outputs/compute.json
cp ${app_name}_compute.h $this_dir/outputs/compute.h

cd $this_dir
echo "Finished Halide to Hardware"