class RenameHerpTaxonsId < ActiveRecord::Migration
  def change
    rename_column :sampling_events_observations, :herp_taxons_id, :herp_taxon_id
    rename_column :surveys_observations, :herp_taxons_id, :herp_taxon_id
  end
end
