class RenameSamplingEventsId < ActiveRecord::Migration
  def change
    rename_column :sampling_events_observations, :sampling_events_id, :sampling_event_id
    rename_column :observers, :sampling_events_id, :sampling_event_id
    rename_column :surveys, :sampling_events_id, :sampling_event_id
  end
end
