# Start step
echo "Starting PE Gen Step"
this_dir=$PWD
cd ..
source ./flow_setup.sh

echo "Done1"

# Remove old inputs
rm $PEgen_input_path/${app_name}_compute.json 

echo "Done2"

# Place the input
cp $this_dir/inputs/compute.json $PEgen_input_path/${app_name}_compute.json 

echo "Done3"

# Go to correct location     
cd $PEgen_path

echo "Done4"

# Remove Old outputs 
rm -rf ./$PEgen_output_path

echo "Done5"
echo $PWD

# Running PE Generation
new_dse_merge_param=`echo $dse_merge_param | tr '-' ' '`
python dse_graph_analysis.py -f $PEgen_input_path/${app_name}_compute.json $new_dse_merge_param

echo "Done6"

# Collect and send outputs to step
cd $PEgen_output_path
cp -r rewrite_rules/. $this_dir/outputs/rewrite_rules
cp -r peak_eqs/. $this_dir/outputs/peak_eqs
cp PE.json $this_dir/outputs/PE.json

echo "Done7"

cd $this_dir
echo "Finished PE Gen"