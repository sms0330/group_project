class User < ApplicationRecord

      has_many :courses, dependent: :destroy
      has_many :facilities, dependent: :nullify

      validates :email, presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX
      validates :first_name, presence: true
      validates :last_name, presence: true

      VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
     
      def full_name
            "#{first_name} #{last_name}".strip.titlecase
      end
end
