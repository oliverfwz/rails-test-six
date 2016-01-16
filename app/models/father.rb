class Father < Person
  extend Enumerize

  has_many :children, class_name: Child
  enumerize :gender, in: [:male]

  MIN_AGE = 20
end
