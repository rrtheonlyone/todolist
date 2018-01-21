class Item < ApplicationRecord

	belongs_to :category
	
	validates :title,  presence: true, length: { maximum: 50 }
	validates :description,  presence: true

	def completed?
		!completed_at.blank?
	end

	def self.tagged_with(name)
		Category.find_by!(name: name).items
	end
end
