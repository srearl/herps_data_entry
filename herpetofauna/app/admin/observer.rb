ActiveAdmin.register Observer do

  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :sampling_events_id
    column :last_name
    column :first_name
    column :initials
    actions
  end

  # customize the ? to include the river reach name
  show :title => :display_name do 
     attributes_table do
       row :id
       row :sampling_events_id
       row :persons_id
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
