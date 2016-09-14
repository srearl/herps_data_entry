ActiveAdmin.register SamplingEvent do

  form do |f|
    f.inputs "Details" do
      f.input :river_reaches_id
      f.input :observation_date, as: :date_select
      f.input :sampling_events_notes
    end
    f.actions
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
