# Start step
echo "Starting MetaMapper"
this_dir=$PWD
cd ..
source ./flow_setup.sh

# Remove old inputs
rm $metamapper_input_path/${app_name}_compute.json 
rm -r $metamapper_input_path2
mkdir -p $metamapper_input_path2

echo $metamapper_input_path2

# Take inputs and go to correct location
cp $this_dir/inputs/compute.json $metamapper_input_path/${app_name}_compute.json 
cp $this_dir/inputs/PE.json $metamapper_input_path2/PE.json 
cp -r $this_dir/inputs/rewrite_rules/. $metamapper_input_path2/rewrite_rules
cp -r $this_dir/inputs/peak_eqs/. $metamapper_input_path2/peak_eqs
cd $metamapper_path

# Remove Old outputs 
rm $metamapper_output_path/${app_name}_compute_mapped.json

# Running metamapper
python scripts/map_dse_new.py ${app_name}_compute

# Bring the output 
cd $metamapper_output_path
cp ${app_name}_compute_mapped.json $this_dir/outputs/compute_mapped.json


cd $this_dir
echo "Finished MetaMapper"
