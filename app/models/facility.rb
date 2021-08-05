class Facility < ApplicationRecord
  belongs_to :teachers, optional: true
  validates :name, presence: true
end
