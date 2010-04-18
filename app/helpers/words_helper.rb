module WordsHelper
  def admin_tools_for(word)
    content_tag("span",
      link_to("Edit", edit_word_path(word), :class => "admintools") <<
      link_to("Delete", word_path(word.id),
        :method => :delete,
        :confirm => "Are you sure you want to delete #{word.term}",
        :class => "admintools"
      )
    )
  end
end
