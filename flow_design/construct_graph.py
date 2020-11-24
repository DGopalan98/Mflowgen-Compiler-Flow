#=========================================================================
# construct.py
#=========================================================================
# Demo with 16-bit GcdUnit
#
# Author : Christopher Torng
# Date   : June 2, 2019
#

import os

from mflowgen.components import Graph, Step

def construct():

  g = Graph()

  #-----------------------------------------------------------------------
  # Parameters
  #-----------------------------------------------------------------------

  adk_name = 'freepdk-45nm'
  adk_view = 'view-standard'

  parameters = {
    'construct_path' : __file__,
    'clock_period'   : 2.0,
    'adk'            : adk_name,
    'adk_view'       : adk_view,
    'topographical'  : True,
  }

  #-----------------------------------------------------------------------
  # Create nodes
  #-----------------------------------------------------------------------

  this_dir = os.path.dirname( os.path.abspath( __file__ ) )

  # ADK step

  g.set_adk( adk_name )
  adk = g.get_adk_step()

  # Custom steps
  setup = Step( this_dir + '/setup' )
  hal_to_hw = Step( this_dir + '/hal_to_hw' )
  PE_gen = Step( this_dir + '/PE_gen' )
  metamapper = Step( this_dir + '/metamapper' )
  clockwork = Step( this_dir + '/clockwork' )
  constraints = Step( this_dir + '/constraints' )
  dc = Step( this_dir + '/dc' )
  #vcs_sim = Step( this_dir + '/vcs_sim' )
  #ptpx = Step( this_dir + '/ptpx' )
  

  # Default steps

  #info         = Step( 'info',                          default=True )
  #constraints  = Step( 'constraints',                   default=True )
  #dc           = Step( 'synopsys-dc-synthesis',         default=True )
  #iflow        = Step( 'cadence-innovus-flowsetup',     default=True )
  #placeroute   = Step( 'cadence-innovus-place-route',   default=True )
  #genlibdb     = Step( 'synopsys-ptpx-genlibdb',        default=True )
  #gdsmerge     = Step( 'mentor-calibre-gdsmerge',       default=True )
  #drc          = Step( 'mentor-calibre-drc',            default=True )
  #lvs          = Step( 'mentor-calibre-lvs',            default=True )
  #debugcalibre = Step( 'cadence-innovus-debug-calibre', default=True )

  #-----------------------------------------------------------------------
  # Graph -- Add nodes
  #-----------------------------------------------------------------------

  #g.add_step( info         )
  g.add_step( setup          )
  g.add_step( hal_to_hw          )
  g.add_step( PE_gen          )
  g.add_step( metamapper          )
  g.add_step( clockwork          )
  g.add_step( constraints  )
  g.add_step( dc          )
  #g.add_step( vcs_sim          )
  #g.add_step( ptpx          )
  #g.add_step( dc           )
  #g.add_step( iflow        )
  #g.add_step( placeroute   )
  #g.add_step( genlibdb     )
  #g.add_step( gdsmerge     )
  #g.add_step( drc          )
  #g.add_step( lvs          )
  #g.add_step( debugcalibre )

  #-----------------------------------------------------------------------
  # Graph -- Add edges
  #-----------------------------------------------------------------------

  # Connect by name
  g.connect_by_name( setup,         hal_to_hw           )
  g.connect_by_name( hal_to_hw,         metamapper           )
  g.connect_by_name( hal_to_hw,        PE_gen           )
  g.connect_by_name( PE_gen,         metamapper           )
  g.connect_by_name( hal_to_hw,         clockwork           )
  g.connect_by_name( metamapper,         clockwork           )
  g.connect_by_name( clockwork,         dc           )
  g.connect_by_name( adk,         dc           )
  g.connect_by_name( constraints, dc           )
  #g.connect_by_name( clockwork,         vcs_sim           )
  #g.connect_by_name( vcs_sim,         dc           )
  #g.connect_by_name( dc,         ptpx           )

  #g.connect_by_name( adk,         iflow        )
  #g.connect_by_name( dc,          iflow        )

  #g.connect_by_name( adk,         placeroute   )
  #g.connect_by_name( dc,          placeroute   )
  #g.connect_by_name( iflow,       placeroute   )

  #g.connect_by_name( placeroute,  genlibdb     )
  #g.connect_by_name( adk,         genlibdb     )

  #g.connect_by_name( adk,         drc          )
  #g.connect_by_name( placeroute,  drc          )

  #g.connect_by_name( adk,         lvs          )
  #g.connect_by_name( placeroute,  lvs          )

  #g.connect_by_name( adk,         gdsmerge     )
  #g.connect_by_name( placeroute,  gdsmerge     )

  #g.connect_by_name( gdsmerge,    drc          )
  #g.connect_by_name( gdsmerge,    lvs          )

  #g.connect_by_name( adk,         debugcalibre )
  #g.connect_by_name( dc,          debugcalibre )
  #g.connect_by_name( iflow,       debugcalibre )
  #g.connect_by_name( placeroute,  debugcalibre )
  #g.connect_by_name( drc,         debugcalibre )
  #g.connect_by_name( lvs,         debugcalibre )

  #-----------------------------------------------------------------------
  # Parameterize
  #-----------------------------------------------------------------------
  g.param_space( 'PE_gen', 'dse_merge_param', ["0", "1"] )

  g.update_params( parameters )

  return g

if __name__ == '__main__':
  g = construct()
#  g.plot()

