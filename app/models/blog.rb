class Blog < ApplicationRecord
	belongs_to :user 
	scope :sorted, lambda {order("id DESC")}
end
