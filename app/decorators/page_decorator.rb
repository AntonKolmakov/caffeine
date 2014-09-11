class PageDecorator < Draper::Decorator
  delegate_all

  BASE_PARTIAL_NAME = 'base'

  def partial_name
    File.exist?("app/views/pages/custom_partials/_#{object.slug}.html.slim") ? object.slug : BASE_PARTIAL_NAME
  end
end
