module ApplicationHelper
  attr_reader :show_title
  alias_method :show_title?, :show_title

  def title(page_title, show_title = false)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def render_form(form_alias)
    form = UserForm.find_by(alias: form_alias.to_s)

    render form if form
  end

  def active_class?(path, strict = false)
    active = strict ? current_page?(path) : request.url.include?(path)

    active ? 'main-nav--active' : ''
  end

  def author_version(version_page)
    raw("#{User.find(version_page.version_author).full_name} - #{time_tag(version_page.created_at)}")
  end
end
