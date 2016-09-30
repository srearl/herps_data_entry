ActiveAdmin.register Observer do

  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :sampling_event_id
    column :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
    column :river_reach
    actions
  end

  show :title => :display_name do 
     attributes_table do
       row :id
       row :sampling_event_id
       row :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
       row :river_reach
    end

    # shows only a single person, need to work on this so that is shows all persons
  panel "personnel" do
    table_for observer.person do |people|
      people.column :last_name
      people.column :initials
    end
  end
  end
  

end
