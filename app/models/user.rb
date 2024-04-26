class User < ApplicationRecord
    has_many :posts
    validates :name, presence: {message: "Don't be shy, tell us your name!"}
    validates :email, presence: {message: "Hold on right there! You need to input an email!"}, 
                      uniqueness: {message: "Whoops! That email is already in use"}, 
                      format: { with: URI::MailTo::EMAIL_REGEXP, message: "Oh no... wrong email format :(" }
    validates :password, presence: {message: "HaHaHa, what about your password?"}, length: { minimum: 6, message: "NoNoNo... passwords must be at least 6 characters long" }

    
    before_validation :normalize_name
    before_validation :remove_whitespaces
    before_save :downcase_email

    private
    def normalize_name 
        self.name = name.downcase.titleize
    end

    def remove_whitespaces
        self.name = name.strip
    end

    def downcase_email
        self.email = email.downcase 
    end

end