ActiveAdmin.register Observer do

  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :sampling_event_id
    column :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
    column :river_reach
    actions
  end

  # customize the ? to include the river reach name
  show :title => :display_name do 
     attributes_table do
       row :id
       row :sampling_event_id
       row :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
       row :river_reach
    end

  panel "personnel" do
    table_for observer.person do |people|
      people.column :last_name
      people.column :initials
    end
  end
  end
  
#  # generate methodology for new person form
#  form do |f|
#    f.semantic_errors
#    f.inputs "Details" do
#      f.input :last_name
#      f.input :first_name
#      f.input :initials
#    end
#    f.actions
#  end
  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
