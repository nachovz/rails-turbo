class Quote < ApplicationRecord
	validates :name, presence: true
	has_many :categories

	scope :ordered, -> { order(id: :desc) }
end
