# frozen_string_literal: true

class SelectComponent < ViewComponent::Base
	attr_reader :form, :options, :label

	def initialize(form:, label:, options:)
		@form = form
		@label = label
		@options = options
	end

	class Item < Struct.new(:id, :label); end
end
