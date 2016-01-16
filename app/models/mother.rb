class Mother < Person
  extend Enumerize

  has_many :children, class_name: Child
  enumerize :gender, in: [:female]

  MIN_AGE = 18

  def say_something
    "Hello, I am your mother."
  end
end
