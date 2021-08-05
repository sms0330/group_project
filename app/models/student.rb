class Student < ApplicationRecord
    has_many :courses, dependent: :nullify
    has_many :teachers, dependent: :nullify

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    def full_name
        "#{first_name} #{last_name}".strip.titlecase
    end
end
