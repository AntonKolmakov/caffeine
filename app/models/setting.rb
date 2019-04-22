class Setting < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  # cache_prefix { "v1" }
end
