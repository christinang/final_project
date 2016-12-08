class Event < ActiveRecord::Base
  validates :event_name, :presence => true, :uniqueness => true

  has_many :charges
end
