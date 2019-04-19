module ApplicationHelper
  attr_reader :show_title
  alias_method :show_title?, :show_title

  def render_form(form_alias)
    form = UserForm.find_by(alias: form_alias.to_s)

    render form if form
  end

  def active_if_current_page_equals(path)
    'main-nav--active' if current_page?(path)
  end

  def active_if_request_url_includes(path)
    'main-nav--active' if request.url.include?(path)
  end

  def author_version(version_page)
    raw("#{User.find_by(full_name: (version_page.version_author)).full_name} - #{time_tag(version_page.created_at)}")
  end
end
