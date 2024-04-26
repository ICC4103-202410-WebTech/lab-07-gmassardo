class Tag < ApplicationRecord
    has_and_belongs_to_many :posts

    validates :name, presence: { message: "The tag must have a name." }, 
                     uniqueness: { message: "Whoops! That tag already exists!" }

end        