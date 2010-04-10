# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def can_edit?(classified)
    if classified.user == session[:user]
      return true
    else
      return false
    end
  end
  def logged_in?
    return true if session[:user]
    return false
  end
  def cloud(categories)
    return if categories.blank?
    output = ""
    mid = categories.collect {|i| i.classifieds.count}.max / 1.5
    
    categories.each do |c|
      size = 100 * c.classifieds.count / mid
      size = 75 if size < 75
      output << link_to(c.name, {:controller => "category", :action => "show", :id => c}, :style => "font-size: #{size}%") << " "
    end
    return output
  end
end
