crumb :page do |page|
  link page.name, page_path(page)

  parent page.parent unless page.parent.nil?
end
