class DropParentsPeople < ActiveRecord::Migration
  def up
    drop_table :parents_people
  end

  def down
    create_table :parents_people do |t|
      t.belongs_to :parent, index: true
      t.belongs_to :person, index: true
    end
  end
end
