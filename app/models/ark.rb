class Ark < ApplicationRecord
  belongs_to :dollar
  belongs_to :user
  validates :description, :location, presence: true
end
