ActiveAdmin.register RiverReach do

  # remove the capability to edit the river reaches
  actions :index, :show, :update, :view

  # remove the capability to edit the river reaches
  # config.clear_action_items! # this only removed the top level (i.e., new) button but not the index buttons


end
