class Category < ApplicationRecord
	validates :name, presence: true
	belongs_to :quote

	scope :ordered, -> { order(id: :desc) }
end
