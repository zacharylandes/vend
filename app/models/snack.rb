class Snack < ApplicationRecord
  has_many :snackmachines
  has_many :machines, through: :snackmachines


  def self.average_price
    average(:price)
  end
end
