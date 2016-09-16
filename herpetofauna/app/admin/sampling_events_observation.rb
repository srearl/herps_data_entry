ActiveAdmin.register SamplingEventsObservation do

  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :river_reach
    column :observation_date
    column :quantity
    column :sampling_events_observation_notes
    actions
  end

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
