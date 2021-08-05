class Course < ApplicationRecord
       validates :title, presence: true, uniqueness: true
       validates :description, presence: true, length: {minimum: 10}
       belongs_to :user, optional: true
end
