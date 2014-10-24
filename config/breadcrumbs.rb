crumb :page do |page|
  link page.name, page_path(page)

  parent page.parent unless page.parent.nil?
end

crumb :form do |form|
  link form.name, user_form_path(form)

  parent form.page if form.page
end
