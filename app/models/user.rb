class User < ApplicationRecord
    validates_uniqueness_of :email
    has_secure_password
    has_many :bookings
    has_many :patients

#     include ImageUploader::Attachment(:image)

#     validates :full_name, presence: true


    def generate_password_token!
          self.reset_password_token = generate_token
          self.reset_password_sent_at = Time.now.utc
          save!
     end

     def password_token_valid?
          (self.reset_password_sent_at + 2.hours) > Time.now.utc
     end

     def reset_password!(password)
          self.reset_password_token = nil
          self.password = password
          save!
     end

     private
     def generate_token
          SecureRandom.hex(10)
     end
end
