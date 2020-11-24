export mflowgen_build_dir=$PWD
export my_root="/nobackup/dgopalan"
export app_name="gaussian"

# Halide to Hardware Paths needed
export hal_to_hw_path="${my_root}/Halide-to-Hardware"
export hal_to_hw_input_path="${hal_to_hw_path}/apps/hardware_benchmarks/apps/${app_name}" 
export hal_to_hw_output_path="${hal_to_hw_input_path}/bin"

# PE Generator Paths needed
export PEgen_path="${my_root}/DSEGraphAnalysis"
export PEgen_input_path="${PEgen_path}/examples" 
export PEgen_output_path="${PEgen_path}/outputs"

# MetaMapper Paths
export metamapper_path="${my_root}/MetaMapper"
export metamapper_input_path="${metamapper_path}/examples/clockwork"
export metamapper_output_path=$metamapper_input_path
export metamapper_input_path2="${metamapper_path}/DSE_outputs"

# Clockwork Paths
export variable_setup_path="${my_root}/setup1.sh" ## set of exported variables list
export clockwork_path="${my_root}/clockwork"
export clockwork_input_path="${clockwork_path}/dse_compute"
export clockwork_output_path="${clockwork_path}/coreir_apps/platonic_buffer/${app_name}"

