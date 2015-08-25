module ApplicationHelper
	require 'barby/barcode/code_39';

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

	def generate_barcode_html(code)
      barcode = Barby::Code39.new(code)
      barcode_for_html = Barby::HtmlOutputter.new(barcode)
    end

    def time_format(time)
      time.strftime("%-m/%-d/%y at %H:%M")
  	end
end
