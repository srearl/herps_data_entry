ActiveAdmin.register SurveysObservation do

  # remove the option to generate a new survey from scratch as this needs input from sampling events
  config.remove_action_item(:new) # note this approach removes the button but not the new method

  # address strong params
  permit_params :id, :survey_id, :herp_taxon, :herp_taxon_id, :quantity, :surveys_observation_notes

  ########## index
  index do
    id_column
    column :survey
    column :plot_location
    # column :river_reach
    # column :observation_date, :observation_date do |seo| seo.observation_date.strftime("%Y-%m-%d") unless(seo.observation_date.nil?) end
    # the approaches below are how this was addressed prior to adding the observation_date method to the sampling_events_observation model - once that was done, we can simply call observation_date
    # 1 column :observation_date, :sortable => 'sampling_event.observation_date' do |seo| seo.sampling_event.observation_date end
    # 2 column :observation_date, :sortable => 'sampling_events.observation_date'
    column :herp_taxon
    column :quantity
    column :surveys_observation_notes
    actions
  end

  ########## form
  # generate methodology for new sampling event form
  # lookup the sampling_event if its passed for a seo
   form do |f|
   unless(params[:survey_id].nil?) 
     surveys_observation.survey = Survey.find(params[:survey_id])
   end
    f.semantic_errors
    f.inputs "edit survey (i.e., plot level) observation" do
      f.input :survey
      f.input :herp_taxon
      f.input :quantity, :as => :number, :min => 0
      f.input :surveys_observation_notes
    end
    f.actions
  end

  # redirect user back to survey view after adding new survey observation
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_survey_path(@surveys_observation.survey) } if resource.valid?
      end
    end
  end # end create redirect 

  # redirect user back to survey view after deleting a survey observation
  controller do
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_survey_path(@surveys_observation.survey) } if resource.valid?
      end
    end
  end # end destroy redirect 


end
