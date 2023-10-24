module ButtonHelper
	TYPES = {
		"primary" => "bg-green-500 hover:bg-green-600",
		"secondary" => "bg-red-500 hover:bg-red-600",
		"helper" => "bg-violet-200 hover:bg-violet-300",
	}


	# Usage:
	# <%= button_link "Sign Up", new_user_registration_path, "secondary" , "data-turbolinks": false, "data-turbo": false, "data-method": "get", "data-action": "click->modal#open", "data-modal-target": "modal" %>
	def button_link(link_text, link_path, button_type = "primary", **data)
		button_class = "px-3 py-2 font-bold text-center rounded-md text-white hover:text-white "

		link_to link_text, link_path, class: button_class + TYPES[button_type], data: data
	end

end