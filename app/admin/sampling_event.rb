ActiveAdmin.register SamplingEvent do

  # address strong params
  permit_params :id, :river_reaches_id, :observation_date, :sampling_events_notes


  ########## index
  # customize the index to include the river reach name and format the date
  index do
    id_column
    column :river_reach
    column :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
    column :sampling_events_notes
    actions
  end


  ########## form
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

  
  ########## show
  # show panel
  show :title => :display_name do 
     attributes_table do
       row :id
       row :river_reach
       row :observation_date, :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
       row :sampling_events_notes
      end

  panel "sampling event observations (#{sampling_event.sampling_events_observations.count})" do
    # my link below is not going to the proper sampling event; what Ryan is doing to get this to work
    # is relying on functionality in the birds form - look at lines 40:41 in app/admin/birds.rb
    div do
      link_to("add a new sampling event observation", new_admin_sampling_events_observation_path(:sampling_event_id => sampling_event.id))
    end
    table_for sampling_event.sampling_events_observations do |seo|
      seo.column :herp_taxon
      seo.column :quantity
      seo.column :sampling_events_observation_notes
      seo.column(" ") { |seobs| link_to "edit", edit_admin_sampling_events_observation_path(seobs) }
      seo.column(" ") { |seobs| link_to "delete", admin_sampling_events_observation_path(seobs), :method => :delete, :data => { :confirm => "are you sure?" }}
    end
  end

  panel "observers (#{sampling_event.observers.count})" do
    div do
      link_to("add a new observer", new_admin_observer_path(:sampling_event_id => sampling_event.id))
    end
    table_for sampling_event.observers do |obs|
      obs.column :id
      obs.column :person_id
      obs.column :last_name
      obs.column :first_name
      obs.column(" ") { |obsrvr| link_to "edit", edit_admin_observer_path(obsrvr) }
      obs.column(" ") { |obsrvr| link_to "delete", admin_observer_path(obsrvr), :method => :delete, :data => { :confirm => "are you sure?" }}
    end
  end

  panel "surveys (#{sampling_event.surveys.count})" do
    div do
      link_to("add a new survey", new_admin_survey_path(:sampling_event_id => sampling_event.id))
    end
    table_for sampling_event.surveys do |surveys|
      surveys.column :id
      surveys.column :river_reach
      surveys.column :plot_location
      surveys.column :surveys_notes
      surveys.column(" ") { |srv| link_to "go here", admin_survey_path(srv) }
      surveys.column(" ") { |srv| link_to "edit", edit_admin_survey_path(srv) }
      surveys.column(" ") { |srv| link_to "delete", admin_survey_path(srv), :method => :delete, :data => { :confirm => "are you sure?" }}
    end
  end
  end # show end

end
