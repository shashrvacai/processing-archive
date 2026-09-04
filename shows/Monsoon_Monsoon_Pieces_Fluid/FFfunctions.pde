public void fluid_resizeUp(){
    fluid.resize(width, height, fluidgrid_scale = max(1, --fluidgrid_scale));        // resize grid value  
  }
  public void fluid_resizeDown(){                                                     // choose and finalize grid size
    fluid.resize(width, height, ++fluidgrid_scale);
  }
  public void fluid_reset(){
    fluid.reset();
  }

  public void fluid_displayMode(int val){
    DISPLAY_fluid_texture_mode = val;
    DISPLAY_FLUID_TEXTURES = DISPLAY_fluid_texture_mode != -1;
  }

  public void opticalFlow_setDisplayMode(int val){
    opticalflow.param.display_mode = val;
  }
  
  public void setAddDensityMode(int val){
    ADD_DENSITY_MODE = val;
  }
