module ApplicationHelper
	def login_helper style = ''
    if current_user.is_a?(GuestUser) 
    	(link_to "Login",  new_user_session_path, class: style) + 
      " ".html_safe +
      (link_to "Register",  new_user_registration_path, class: style)         
    else 
   	 	link_to "Logout",  destroy_user_session_path, method: :delete, class: style
   	end
	end

	def source_helper(layout_name)
		if session[:source]
      		greeting = "Thanks for visiting me from #{session[:source]} you are using the #{layout_name} layout"
      		content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    AndersonViewTool::Renderer.copyright 'Aaron Anderson', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },

      {
        url: contact_path,
        title: 'Contact'
      },

      {
        url: blogs_path,
        title: 'Blog'
      },

      {
        url: portfolios_path,
        title: 'Portfolio'
      },

      {
        url: tech_news_path,
        title: 'Tech News'
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
    nav_links.html_safe     
  end

  def active? path
    "active" if current_page? path
  end

  def name_items 
    [ 
      {
        url: about_me_path,
        title: 'Aaron R Anderson'
      }
    ]
  end

  def page_name_link style = 'name-nav'
    name_link = ''
    name_items.each do |nam|
      name_link << "<a href='#{nam[:url]}' class='#{style} #{active? nam[:url]}'>#{nam[:title]}</a>"
    end
    name_link.html_safe     
  end



  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
    
  end


  def alert_generator msg
      js add_gritter(msg, title: "Aaron Anderson Portfolio", sticky: false)
  end



end















