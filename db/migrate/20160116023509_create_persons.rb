class CreatePersons < ActiveRecord::Migration
  def change
    create_table :persons do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.date    :dob
      t.integer :father_id
      t.integer :mother_id
    end
  end
end
