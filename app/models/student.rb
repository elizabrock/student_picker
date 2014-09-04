class Student < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  default_scope ->{ order("last_called_at ASC NULLS FIRST") }
end
