class Item < ApplicationRecord
	validates :title,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true

	def completed?
		!completed_at.blank?
	end
end
