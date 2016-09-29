ActiveAdmin.register SamplingEvent do

  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :river_reach
    column :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
    column :sampling_events_notes
    actions
  end

  # generate methodology for new sampling event form
  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :river_reach
      f.input :observation_date, as: :date_select
      f.input :sampling_events_notes
    end
    f.actions
  end

  # address strong params
  permit_params :id, :river_reaches_id, :observation_date, :sampling_events_notes

  # show panel
  show :title => :display_name do 
     attributes_table do
       row :id
       row :river_reach
       row :observation_date, :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
       row :sampling_events_notes
      end

  panel "survey observations" do
    table_for sampling_event.sampling_events_observations do |seo|
      seo.column :quantity
      seo.column :sampling_events_observation_notes
    end
  end

  panel "observers" do
    table_for sampling_event.observers do |obs|
      obs.column :id
    end
  end
  end

end
