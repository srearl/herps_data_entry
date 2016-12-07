class AddDisplayNameToPlotLocations < ActiveRecord::Migration
  def change
    add_column :plot_locations, :display_name, :text
    execute <<-SQL
      UPDATE salt_river_biodiversity.plot_locations
      SET display_name = subquery.display_name
      FROM (SELECT 
            pl.id,
            concat_ws(' ',
            rr.reach,
            pl.transect, 
            pl.location) AS display_name
      FROM salt_river_biodiversity.plot_locations pl
      JOIN salt_river_biodiversity.river_reaches rr ON (pl.river_reaches_id = rr.id)) AS subquery
      WHERE plot_locations.id = subquery.id;
      SQL
  end
end
