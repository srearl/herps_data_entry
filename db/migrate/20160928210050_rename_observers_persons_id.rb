class RenameObserversPersonsId < ActiveRecord::Migration
  def change
    rename_column :observers, :persons_id, :person_id
  end
end
