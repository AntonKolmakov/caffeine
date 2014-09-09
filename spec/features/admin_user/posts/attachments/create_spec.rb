require 'spec_helper'

feature 'admin creates attachment', js: true do
  let!(:post) { create :post, description: 'description goes here...' }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.layouts.tab_navigation.posts')
    click_on post.name
    attach_file('post_attachment[attachment]', File.expand_path('spec/fixtures/posts/attachments/документ.pdf'))

    expect(page).to have_content('dokument.pdf')
  end
end
