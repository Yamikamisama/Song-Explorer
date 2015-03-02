class User < ActiveRecord::Base
   has_secure_password
   has_many :entries
   validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true
   validates :password, length: { minimum: 3 }

end