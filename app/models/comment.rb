class Comment < ActiveRecord::Base
	has_many :products
end
