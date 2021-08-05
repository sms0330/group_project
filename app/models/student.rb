class Student < ApplicationRecord
<<<<<<< HEAD

    validates :name, presence:true
    validates :email, presence:true
    validates :passphrase, presence:true 
#
=======
    has_many :courses, dependent: :nullify
    has_many :teachers, dependent: :nullify

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :first_name, presence: true
    validates :last_name, presence: true
    
    def full_name
        "#{first_name} #{last_name}".strip.titlecase
    end
>>>>>>> 192b75719404047e9f5fce7ca5471176b2307a7a
end
