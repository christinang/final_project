class Charge < ActiveRecord::Base
  validates :payer_id, :presence => true
  validates :ower_id, :presence => true
  validates :event_id, :presence => true
  validates :amount, :presence => true

  belongs_to :event
  belongs_to :payer, :class_name => "User", :foreign_key => "payer_id"
  belongs_to :ower, :class_name => "User", :foreign_key => "ower_id"
end
