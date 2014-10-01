class PageDecorator < Draper::Decorator
  delegate_all

  BASE_PARTIAL_NAME = 'base'

  def partial_name
    File.exist?("app/views/pages/custom_partials/_#{object.slug}.html.slim") ? object.slug : BASE_PARTIAL_NAME
  end

  def column_size
    (object.album && object.album.images.any? && object.page_attachments.any?) ? 8 : 16
  end

  def image_column_size
    (column_size == 8) ? 4 : 2
  end
end
