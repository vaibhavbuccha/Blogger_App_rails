class Blog < ApplicationRecord
	mount_uploader :image,AttachmentUploader# Tells rails to use this uploader for this model.   


	belongs_to :user 
	scope :sorted, lambda {order("id DESC")}
end
