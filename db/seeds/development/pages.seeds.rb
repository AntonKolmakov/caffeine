home_page = Page.create(name: "main", description: "Description", short_description: "Short description", main: true)

3.times do |i|
  Page.create(name: "Product ##{i}", description: "Description", short_description: "Short description")
  Page.create(name: "Product child ##{i}", description: "Description", short_description: "Short description", parent_id: home_page.id)
end