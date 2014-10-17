class PageDecorator < Draper::Decorator
  delegate_all
  decorates_association :children

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

  def children_content_size
    (page.children.any?) ? 5 : 0
  end

  def main_content_size
    16 - children_content_size
  end

  def admin_list_classes
    "col-md-#{12 - object.depth} col-md-offset-#{page.depth} col-xs-#{12 - object.depth} col-xs-offset-#{page.depth}"
  end

  def admin_row_classes
    page.root? ? 'widget' : 'widget no-margin--t no-border--t'
  end

  def set_main
    page.main? ? 'btn btn-skyblue' : 'btn btn-grey '
  end
end
