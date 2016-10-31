ActiveAdmin.register Survey do
  
#  # remove the option to generate a new survey from scratch as this needs input from sampling events
config.remove_action_item(:new) # note this approach removes the button but not the new method
#  # actions :index, :show, :new, :create, :update, :edit, :sampEvents, :view, :destroy
#  actions :all, :except => [:new] # note this approach removes the button but and the ability to call thenew method
#
#  # for convenience add a button to return to sampling events
#  action_item :sampEvents do
#    link_to 'go to sampling events', admin_sampling_events_path
#  end
  
  # address strong params
  permit_params :survey, :herp_taxon, :quantity, :surveys_observation_notes, :survey_id, :herp_taxon_id, :sampling_event, :sampling_event_id, :time_start, :time_end, :surveys_notes, :plot_location_id, :river_reach, :observation_date, :river_reach_id
  

  ########## index
  index do
    id_column
    column :observation_date, :observation_date do |survey| survey.observation_date.strftime("%Y-%m-%d") unless(survey.observation_date.nil?) end
    column :river_reach
    column :plot_location
    column :time_start do |survey| survey.time_start.strftime("%H:%M") unless(survey.time_start.nil?) end
    column :time_end do |survey| survey.time_end.strftime("%H:%M") unless(survey.time_end.nil?) end
    column :surveys_notes
    actions
  end

  ########## form
  # generate methodology for new survey event form
   form do |f|
   
#   if(!params[:sampling_event_id].nil?) 
#     survey.sampling_event = SamplingEvent.find(params[:sampling_event_id])
#   else

   if params[:sampling_event_id].present?
     survey.sampling_event = SamplingEvent.find(params[:sampling_event_id])

   # else is no longer required since we removed the capacity to generate a new sampling
   # event from scratch by removing the "new" action

#   else
#     para "new surveys must be generated from the sampling events page"
#     cancel_link(admin_sampling_events_path)

   end
    f.semantic_errors
    f.inputs "edit survey (i.e., plot level) event:  #{survey.sampling_event.river_reach.reach} #{survey.sampling_event.observation_date.to_date}" do
      # the idea was to make sampling event uneditable here since if that changes, the corresponding
      # plot locations would be wrong...but rendering it disabled is preventing it from being
      # passed when creating surveys, and rendering it readonly does not prevent it from being changed;
      # rendering it hiding was going to be the answer but that also is not passing the sampling_event_id;
      # it is possible to pass a value with hidden but I cannot get the proper value or syntax, not sure where
      # the problem lies
      # f.input :sampling_event, :input_html => { :disabled => true }
      # f.input :sampling_event, :input_html => { :readonly => true }
      # f.input :sampling_event, :as => :hidden, :value => survey.sampling_event_id
      f.input :sampling_event, :hint => "DO NOT EDIT THIS !!!"
      f.input :plot_location, :as => :select, :collection => PlotLocation.where({river_reaches_id: survey.try(:sampling_event).try(:river_reaches_id)})
      f.input :time_start
      f.input :time_end
      f.input :surveys_notes
    end
    f.actions
  end

  ########## show
  show :title => :display_name do 
     attributes_table do
       row :id
       row :river_reach
       row :plot_location
       row :observation_date, :observation_date do |survey| survey.observation_date.strftime("%Y-%m-%d") unless(survey.observation_date.nil?) end
       row :time_start do |survey| survey.time_start.strftime("%H:%M") unless(survey.time_start.nil?) end
       row :time_end do |survey| survey.time_end.strftime("%H:%M") unless(survey.time_end.nil?) end
       row :surveys_notes
     end # main show end

  # survey id not carrying forward, need to come back to this     
  panel "survey observations (#{survey.surveys_observations.count})" do
    div do
      link_to("add a new survey observation", new_admin_surveys_observation_path(:survey_id => survey.id))
    end
    table_for survey.surveys_observations do |sobs|
     sobs.column :survey
     sobs.column :herp_taxon
     sobs.column :quantity
     sobs.column :surveys_observation_notes
     sobs.column(" ") { |srvobs| link_to "edit", edit_admin_surveys_observation_path(srvobs) }
     sobs.column(" ") { |srvobs| link_to "delete", admin_surveys_observation_path(srvobs), :method => :delete, :data => { :confirm => "are you sure?" }}
    end # table end
  end # panel end

  end # show end

  # redirect user back to sampling event view after adding new observer
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_sampling_event_path(@survey.sampling_event) } if resource.valid?
      end
    end
  end # end create redirect 

  # redirect user back to sampling event view after deleting an observer
  controller do
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_sampling_event_path(@survey.sampling_event) } if resource.valid?
      end
    end
  end # end destroy redirect 

end
