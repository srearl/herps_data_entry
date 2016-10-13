class RenamePlotLocationsId < ActiveRecord::Migration
  def change
    rename_column :surveys, :plot_locations_id, :plot_location_id
    rename_column :location_histories, :plot_locations_id, :plot_location_id
  end
end
