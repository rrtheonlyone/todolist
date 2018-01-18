class Item < ApplicationRecord

	belongs_to :category
	
	validates :title,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true

	def completed?
		!completed_at.blank?
	end
end
