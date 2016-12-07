ActiveAdmin.register SamplingEventsObservation do

  # address strong params
  permit_params :id, :sampling_event_id, :quantity, :sampling_events_observation_notes, :herp_taxon_id

  ########## index
  index do
    id_column
    column :sampling_event
    column :river_reach
    column :observation_date, :observation_date do |seo| seo.observation_date.strftime("%Y-%m-%d") unless(seo.observation_date.nil?) end
    # the approaches below are how this was addressed prior to adding the observation_date method to the sampling_events_observation model - once that was done, we can simply call observation_date
    # 1 column :observation_date, :sortable => 'sampling_event.observation_date' do |seo| seo.sampling_event.observation_date end
    # 2 column :observation_date, :sortable => 'sampling_events.observation_date'
    column :herp_taxon
    column :quantity
    column :sampling_events_observation_notes
    actions
  end

  ########## form
 # form do |f|
 #    # lookup the survey if its passed for a new bird
 #    unless(params[:survey_id].nil?) 
 #      bird.survey = Survey.find(params[:survey_id])
 #    end
 #    f.inputs "Edit Bird" do
 #      f.input :survey_id, :as => :hidden   #ideally this would be read only for editing, but eh..
 #      f.input :bird_taxon #_id, :as => :select, :collection => BirdTaxon.uniq.pluck(:common_name)
 #      # f.input :distance,   :as => :select, :collection => Bird.uniq.pluck(:distance)
 #      f.input :distance,   :as => :select,  :collection => {'0-5'=>'0-5', '5-10'=>'5-10', '10-20'=>'10-20', '20-40'=>'20-40', '40+'=>'>40', 'FT'=>'FT'}
 #      f.input :bird_count, :as => :number, :min => 0
 #      f.input :seen
 #      f.input :heard
 #      # the values from direction have trailing spaces, which might break the current php data entry 
 #      f.input :direction, :as => :select, :collection => Bird.uniq.pluck(:direction).collect {|dir| dir.strip unless dir.nil? } 
 #      # f.input :flying
 #      f.input :notes
 #   end
 #   f.buttons
 # end
  
  # generate methodology for new sampling event form
  # lookup the sampling_event if its passed for a seo
   form do |f|
   unless(params[:sampling_event_id].nil?) 
     sampling_events_observation.sampling_event = SamplingEvent.find(params[:sampling_event_id])
   end
    f.semantic_errors
    f.inputs "edit sampling event (i.e., reach level) observation" do
      f.input :sampling_event
      f.input :herp_taxon
      f.input :quantity, :as => :number, :min => 0
      f.input :sampling_events_observation_notes
    end
    f.actions
  end

  # redirect user back to sampling event view after adding new sampling event observation
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_sampling_event_path(@sampling_events_observation.sampling_event) } if resource.valid?
      end
    end
  end # end create redirect 

  # redirect user back to sampling event view after deleting a sampling event observation
  controller do
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_sampling_event_path(@sampling_events_observation.sampling_event) } if resource.valid?
      end
    end
  end # end destroy redirect 


end
