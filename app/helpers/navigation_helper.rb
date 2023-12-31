module NavigationHelper
	def nav_link(link_text, link_path)
		class_name = "flex-1 px-4 py-3 font-bold text-center "
		class_name += link_path.split("/").include?(controller_name) ? 'border-b-2 border-solid border-b-red-500' : ''

		link_to link_text, link_path, class: class_name
	end
end