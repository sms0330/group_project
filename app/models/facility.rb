class Facility < ApplicationRecord
  belongs_to :teacher, optional: true
  validates :name, presence: true
end
