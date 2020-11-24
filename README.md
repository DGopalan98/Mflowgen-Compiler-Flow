# Mflowgen for Compiler Flow
This project contains an mflowgen design for the AHA compiler flow. The steps in this flowgraph are:
- setup
- hal_to_hw
- PE_gen
- metamapper
- clockwork
- constraints
- dc 


#Step Descriptions
## Setup 
Specify all the paths that will be accessed throughout the flow. This creates a `flow_setup.sh` file which is accessed by the other steps of the design

## hal_to_hw

