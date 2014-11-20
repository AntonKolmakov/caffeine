class PageDecorator < Draper::Decorator
  delegate_all
  decorates_association :children

  BASE_PARTIAL_NAME = 'base'

  def partial_name
    custom_partial_exists? ? object.slug : BASE_PARTIAL_NAME
  end

  def custom_partial_exists?
    File.exist?("app/views/pages/custom_partials/_#{object.slug}.html.slim")
  end

  def column_size
    (object.album && object.album_images.any? && object.page_attachments.any?) ? 8 : 16
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
    offset = page.depth
    width = 12 - object.depth

    "col-md-#{width} col-md-offset-#{offset} col-xs-#{width} col-xs-offset-#{offset}"
  end

  def admin_row_classes
    page.root? ? 'widget' : 'widget no-margin--t no-border--t'
  end

  def class_main
    page.main? ? 'btn btn-skyblue' : 'btn btn-grey'
  end

  def title_main
    page.main? ? I18n.t('views.admin.pages.index.title_main') : I18n.t('views.admin.pages.index.set_title_main')
  end
end
