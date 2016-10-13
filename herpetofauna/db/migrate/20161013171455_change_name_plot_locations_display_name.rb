class ChangeNamePlotLocationsDisplayName < ActiveRecord::Migration
  def change
    rename_column :plot_locations, :display_name, :rchtscloc_display
  end
end
