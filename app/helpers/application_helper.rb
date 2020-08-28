module ApplicationHelper
	def full_title(page_title = '')
    base_title = 'Ruby on Rails Active Record Associations Assignment - Microverse Curriculum'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
