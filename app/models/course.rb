class Course < ApplicationRecord
       # Association with USER MODEL
       belongs_to :teachers, optional: true
       belongs_to :students, optional: true
end
