class Setting < RailsSettings::CachedSettings
  defaults[:site_enabled] = true
  defaults[:site_disabled_text] = ''
  defaults[:site_name] = ''
  defaults[:yandex_metrika_key] = ''
  defaults[:google_analytics_key] = ''
end
