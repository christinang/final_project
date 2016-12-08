class Event < ActiveRecord::Base
  validates :event_name, :presence => true, :uniqueness => true

  has_many :charges, :dependent => :restrict_with_error
end
