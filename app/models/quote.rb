class Quote < ApplicationRecord
	validates :name, presence: true
	has_and_belongs_to_many :categories

	scope :ordered, -> { order(id: :desc) }
end
