# Start step
echo "Starting Clockwork"
this_dir=$PWD
cd ..
source ./flow_setup.sh
source $variable_setup_path

# Remove old inputs
rm $clockwork_path/${app_name}_compute.h
rm $clockwork_input_path/${app_name}_mapped.json 

# Take inputs and go to correct location
cp $this_dir/inputs/compute.h $clockwork_path/${app_name}_compute.h
cp $this_dir/inputs/compute_mapped.json $clockwork_input_path/${app_name}_mapped.json 
cd $clockwork_path

# Remove Old outputs 
rm $clockwork_output_path/${app_name}.v
rm $clockwork_output_path/${app_name}_verilog_collateral.sv

# Running clockwork
./rebuild_and_run.sh dse-flow

# Bring the outputs
cd $clockwork_output_path
cp ${app_name}.v $this_dir/outputs/design.v
cp ${app_name}_verilog_collateral.sv $this_dir/outputs/design_verilog_collateral.sv

cd $this_dir
echo "Finished Clockwork"
