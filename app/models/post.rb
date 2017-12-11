class Post < ActiveRecord::Base

	belongs_to :user
	validates :user, presence: true
    validates :title, presence: true, length: { minimum: 3 }
    validates :body, presence: true, length: { minimum: 5 }
end
 

 

