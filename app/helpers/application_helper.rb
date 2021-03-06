# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def can_edit?(classified)
    logged_in?
  end
  def logged_in?
    return true if session[:user]
    return false
  end
  def cloud(categories)
    return if categories.blank?
    output = ""
    mid = categories.collect {|i| i.words.count}.max / 1.5
    
    categories.each do |c|
      size = 100 * c.words.count / mid
      size = 75 if size < 75
      output << link_to(c.name, category_path(c), :style => "font-size: #{size}%") << " "
    end
    return output
  end
end
