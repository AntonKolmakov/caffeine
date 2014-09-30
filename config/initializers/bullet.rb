Rails.application.config.after_initialize do
  Bullet.enable = true
  Bullet.rails_logger = true
  Bullet.console = true
  Bullet.add_footer = true
end if defined?(Bullet)
