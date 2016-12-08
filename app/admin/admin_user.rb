ActiveAdmin.register AdminUser do
  menu false
  permit_params :username

  index do
    selectable_column
    id_column
    column :username
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :username
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show title: :username do
    attributes_table do
      row :id
      row :username
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :description
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :username
    end
    f.actions
  end

end
