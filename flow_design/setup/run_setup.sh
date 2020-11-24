echo "Starting Setup Script"
this_dir=$PWD
echo $this_dir

cd inputs 
cp flow_setup.sh ../../flow_setup.sh
cp flow_setup.sh ../outputs/flow_setup.sh
cd ../../

cd $this_dir
echo "Finished Setup Script"