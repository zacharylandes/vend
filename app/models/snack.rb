class Snack < ApplicationRecord
  has_many :snackmachines
  has_many :machines, through: :snackmachines


  def self.average
    average(:price)
  end
end
