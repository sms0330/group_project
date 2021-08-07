class Course < ApplicationRecord

       validates :name, presence: true, uniqueness: true
       validates :category, presence: true
       validates :course_code, presence: true
       validates :description, presence: true
       validates :seats, presence: true
       validates :time_start, presence: true
       validates :time_end, presence: true
       validates :start_date, presence: true
       validates :end_date, presence: true

       # # Association with USER MODEL

       belongs_to :user, optional: true
       has_many :enrolls, dependent: :destroy
       has_many :enrollers, through: :enrolls, source: :user
end
