module ApplicationHelper
	def full_title(page_title)
	    base_title = "Campus Closet"
	    if page_title.empty?
			base_title
		else
	      "#{base_title} | #{page_title}"
	    end
	end

	def nav_list_item(name, url)
		extra = ""

		if request.env['PATH_INFO'] == url
			extra = "class=\"active\""
		end

		raw("<li #{extra}>#{link_to name, url }</li>")
	end

end
