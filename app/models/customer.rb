class Customer < ActiveRecord::Base

  has_many :booking, dependent: :destroy

  attr_accessor :city_id, :date

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number,presence: true
  validates :city_id, presence: true
  validates :date, presence: true
end
