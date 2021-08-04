class Student < ApplicationRecord
    
    validates :name, presence:true
    validates :email, presence:true
    validates :passphrase, presence:true 

end
