require 'spec_helper'

feature 'admin destroys attachment', js: true do
  let!(:post) { create :post }

  scenario do
    admin_session_sign_in

    click_on I18n.t('views.casein.layouts.tab_navigation.posts')
    click_on post.name
    attach_file('post_attachment[attachment]', File.expand_path('spec/fixtures/posts/attachments/документ.pdf'))
    click_on I18n.t('views.casein.posts.show.link.remove_attachment')

    expect(page).to have_content(I18n.t('flash.actions.destroy.notice'))
  end
end
