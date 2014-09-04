class Student < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope ->{ order("last_called_at ASC NULLS FIRST") }
  scope :eligible_to_be_called, ->{ where("last_called_at <= ? or last_called_at IS NULL", 24.hours.ago) }

  def self.pick!
    student = Student.eligible_to_be_called.to_a.sample
    student.last_called_at = Time.now
    student.save!
    student
  end
end
