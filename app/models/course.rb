class Course < ApplicationRecord

       validates :name, presence: true, uniqueness: true

       # # Association with USER MODEL

       belongs_to :user, optional: true
       has_many :enrolls, dependent: :destroy
       has_many :enrollers, through: :enrolls, source: :user
end
