class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates_uniqueness_of :name, case_sensitive: false
	has_and_belongs_to_many :quotes

	scope :ordered, -> { order(id: :desc) }
end
