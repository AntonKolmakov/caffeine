class CompareVersion
  include Interactor

  before { context.result = '' }

  ATTRIBUTES_FOR_COMPARISON = %i(
    name
    description
    short_description
    meta_title
    meta_keywords
    meta_description
    seo_text)

  def call
    find_version
    compare_version
  end

  private

  def find_version
    context.version_page = PaperTrail::Version.find(context.version_page).reify(has_one: true)
  end

  def compare_version
    ATTRIBUTES_FOR_COMPARISON.each do |attribute|
      context.result << Diffy::Diff.new(context.version_page.send(attribute),
                                        context.current_page.send(attribute)).to_s(:html)
    end
  end
end
