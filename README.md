# Mflowgen for Compiler Flow
This project contains an mflowgen design for the AHA compiler flow. The steps in this flowgraph are:
- setup
- hal_to_hw
- PE_gen
- metamapper
- clockwork
- constraints
- dc 


# Step Descriptions
## Setup 
Specify all the paths that will be accessed throughout the flow. The user edits the `setup/inputs/flow_setup.sh` file to specify the correct paths and set the `app_name`. The setup step copies this file into the build directory for other steps to access.  

## hal_to_hw

## PE_gen

## Metamapper

## Clockwork

## DC

# Installing Requirements


# Notes
- Before clockwork is called, the environment variables mentioned here need to be specified. The clockwork step 
```bash
export BUILD_DIR=`pwd`
export TRAVIS_BUILD_DIR=$BUILD_DIR
export BARVINOK_PATH=$TRAVIS_BUILD_DIR/clockwork/barvinok-0.41/isl
export ISL_PATH=$TRAVIS_BUILD_DIR/clockwork/barvinok-0.41/isl
export OPT_PATH=$TRAVIS_BUILD_DIR/clockwork/include
export OPT_LIB_PATH=$TRAVIS_BUILD_DIR/clockwork/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRAVIS_BUILD_DIR/clockwork/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRAVIS_BUILD_DIR/coreir/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$TRAVIS_BUILD_DIR/Halide-to-Hardware/coreir/lib
export LLVM_VERSION=6.0.0
export BUILD_SYSTEM=MAKE
export CXX_=g++-7
export CC_=gcc-7
export CXX=g++-7
export CC=gcc-7
export LLVM_CONFIG="/usr/bin/llvm-config-6.0"
export LLVM_DIR="/usr/lib/llvm-6.0/cmake"
export CLANG="/usr/bin/clang-6.0"
alias clang='clang-6.0'
alias clang++='clang++-6.0'
alias llvm-config='llvm-config-6.0'
export COREIR_PATH=$TRAVIS_BUILD_DIR/coreir
export COREIR_DIR=$TRAVIS_BUILD_DIR/coreir
export COREIR=1
```
- Editing map_dse script
- dse_merge_param 
- modifications to default DC
- 




