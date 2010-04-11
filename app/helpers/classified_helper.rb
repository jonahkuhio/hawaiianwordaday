module ClassifiedHelper
  def admin_tools_for(classified)
    content_tag("span",
      link_to("Edit", edit_classified_path(classified), :class => "admintools") <<
      link_to("Delete", classified_path(classified.id),
        :method => :delete,
        :confirm => "Are you sure you want to delete #{classified.title}",
        :class => "admintools"
      )
    )
  end
end
