ActiveAdmin.register Person do

  # generate methodology for new person form
  form do |f|
    f.semantic_errors
    f.inputs "Details" do
      f.input :last_name, :as => :string
      f.input :first_name, :as => :string
      f.input :initials, :as => :string
    end
    f.actions
  end

  # address strong params
  permit_params :last_name, :first_name, :initials


end
