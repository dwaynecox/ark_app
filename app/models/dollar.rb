class Dollar < ApplicationRecord
  has_many :arks
  validates :serial_num, length: {is: 10}, presence: true
end
