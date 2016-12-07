ActiveAdmin.register Observer do
  
  # address strong params
  permit_params :id, :sampling_event_id, :last_name, :first_name, :initials, :person_id

  # customize the index 
  index do
    id_column
    column :sampling_event_id
    column :observation_date, :sortable => :observation_date do |sampling_event| sampling_event.observation_date.strftime("%Y-%m-%d") unless(sampling_event.observation_date.nil?) end
    column :river_reach
    actions
  end

  # form
  form do |f|
  unless(params[:sampling_event_id].nil?) 
    observer.sampling_event = SamplingEvent.find(params[:sampling_event_id])
  end
   f.semantic_errors
   f.inputs "edit observers" do
   f.input :sampling_event
   f.input :person
   end
   f.actions
  end

  # show
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
  end # end personnel

  end # end show
  
#  # redirect user back to view of sampling event from observer
#  # this works but it always goes back to samp event, even if you start from the observers page
#  controller do
#    def show
#      @observer = Observer.find(params['id'])
#      redirect_to admin_sampling_event_path(@observer.sampling_event)
#    end
#  end

  # redirect user back to sampling event view after adding new observer
  controller do
    def create
      create! do |format|
        format.html { redirect_to admin_sampling_event_path(@observer.sampling_event) } if resource.valid?
      end
    end
  end # end create redirect 

  # redirect user back to sampling event view after deleting an observer
  controller do
    def destroy
      destroy! do |format|
        format.html { redirect_to admin_sampling_event_path(@observer.sampling_event) } if resource.valid?
      end
    end
  end # end destroy redirect 

end # end observer.rb
