class Person < ActiveRecord::Base
  extend Enumerize

  belongs_to :father
  belongs_to :mother

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob,  presence: true
  validates :gender,  presence: true
  validate :ensure_valid_age

  enumerize :gender, in: [:male, :female]

  MIN_AGE = 0

  def age
    ((Date.today - dob) / 365).floor
  end

  def name
    first_name + ' ' + last_name
  end

  def parents
    Person.where(id: [father_id, mother_id])
  end

  def children
    Person.where("father_id = ? OR mother_id = ?", id, id)
  end

  def say_something
    "Hello, my name " + name + '.'
  end

  protected

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < self.class::MIN_AGE
  end
end
