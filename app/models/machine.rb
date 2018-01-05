class Machine < ApplicationRecord
  belongs_to :owner
  has_many :snackmachines
  has_many :snacks, through: :snackmachines
end
