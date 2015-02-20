class Article < ActiveRecord::Base
	validate :title, presence:true, length: {minimum: 5}
end
