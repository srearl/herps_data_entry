ActiveAdmin.register SamplingEvent do

#  scope :all, :default => true do |sampling_events|
#    sampling_events.joins :river_reaches
#  end

#  index do
#    :observation_date
#    #id_column
#    #column :site, :sortable => 'sites.site_code'
#    #column :survey_date, :sortable => :survey_date do |survey| survey.survey_date.strftime("%Y-%m-%d") unless(survey.survey_date.nil?) end
#    #column :time_start, :sortable => :time_start do  |survey| survey.time_start.strftime("%I:%M%p") unless(survey.time_start.nil?) end
#    #column :time_end,   :sortable => :time_end   do  |survey| survey.time_end.strftime("%I:%M%p")   unless(survey.time_end.nil?)   end
#    #column :observer
#    ## column :noise_obs do |survey| survey.noise_observations.count end
#    actions
#  end
  

  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :river_reach
      f.input :observation_date, as: :date_select
      f.input :sampling_events_notes
    end
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :id, :river_reaches_id, :observation_date, :sampling_events_notes
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  show :title => :display_name do 
     attributes_table do
       row :id
       row :river_reach
       row :observation_date
       row :sampling_events_notes
    end
  end


end
