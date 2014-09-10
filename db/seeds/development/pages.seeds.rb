Page.create(name: "Home", description: "Description", short_description: "Short description")

3.times do |i|
  Page.create(name: "Product ##{i}", description: "Description", short_description: "Short description")
  Page.create(name: "Product child ##{i}", description: "Description", short_description: "Short description", parent_id: i+1)
end