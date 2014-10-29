require 'kramdown'

module Admin
  class ChangelogsController < Admin::ApplicationController
    expose(:changelog_file) { Rails.root.join('CHANGELOG.md') }
    expose(:content) { Kramdown::Document.new(File.read(changelog_file)).to_html}
  end
end