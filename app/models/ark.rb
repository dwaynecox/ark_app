class Ark < ApplicationRecord
  belongs_to :dollar
  belongs_to :user, optional: true
end
