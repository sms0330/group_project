class Course < ApplicationRecord

       validates :title, presence: true, uniqueness: true

       # # Association with USER MODEL

       belongs_to :user, optional: true
end
