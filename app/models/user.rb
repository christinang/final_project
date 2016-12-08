class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :charges_paid, :class_name => "Charge", :foreign_key => "payer_id"
  has_many :charges_owed, :class_name => "Charge", :foreign_key => "ower_id"
end
