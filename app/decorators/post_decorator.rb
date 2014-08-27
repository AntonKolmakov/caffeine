class PostDecorator < Draper::Decorator
  delegate_all

  BASE_PARTIAL_NAME = 'base'

  def partial_name
    File.exists?("app/views/posts/custom_partials/_#{post.slug}.html.slim") ? post.slug : BASE_PARTIAL_NAME
  end
end
