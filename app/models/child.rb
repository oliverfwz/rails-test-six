class Child < Person
  belongs_to :father
  belongs_to :mother

  def parents
    Person.where(id: [father_id, mother_id])
  end
end
