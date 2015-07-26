module ApplicationHelper
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end
 
  def action?(*action)
     action.include?(params[:action])
  end

  def full_title(title)
    base_title = t("app_title")
    if title.blank?
      base_title
    else
      "#{base_title} >> #{title}"
    end
  end      
end
