class Ark < ApplicationRecord
  belongs_to :user
  validates :description, :location, presence: true
  # validates :serial_num, length: {is: 10}, allow_blank: true
end
