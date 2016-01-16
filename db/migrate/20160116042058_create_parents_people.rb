class CreateParentsPeople < ActiveRecord::Migration
  def change
    create_table :parents_people do |t|
      t.belongs_to :parent, index: true
      t.belongs_to :person, index: true
    end
  end
end
