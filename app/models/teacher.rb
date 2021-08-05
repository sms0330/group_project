class Teacher < ApplicationRecord
    # many to many
    belongs_to :student

    has_many :courses, dependent: :destroy
    has_many :students, through: :courses

    # one to many
    has_many :facilities, dependent: :nullify

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    def full_name
        "#{first_name} #{last_name}".strip.titlecase
    end
end
