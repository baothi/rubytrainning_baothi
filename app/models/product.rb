class Product < ActiveRecord::Base
	belong_to :category
	has_many :comments
end
