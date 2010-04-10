module ClassifiedHelper
  def admin_tools_for(classified)
    tag = [ ]
    tag << content_tag("span",
    link_to("Edit", {
      :action => "edit", :id => classified
    }, :class => "admintools") <<
    link_to("Delete", {
      :action => "delete",
      :id => classified.id,
    },
    :post => true,
    :confirm => "Are you sure you want to delete #{classified.title}",
    :class => "admintools"),
    :id => "classified_#{classified.id}")
  end
end
