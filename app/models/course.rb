class Course < ApplicationRecord
       # Association with USER MODEL
       belongs_to :user, optional: true
end
