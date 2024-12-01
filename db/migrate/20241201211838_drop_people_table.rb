class DropPeopleTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :people
  end
end
