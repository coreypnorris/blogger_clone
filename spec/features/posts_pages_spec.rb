require 'spec_helper'

describe Post  do
  context 'creating' do
    it 'allows the author to create a new post' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_post_path
      post = FactoryGirl.build(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      click_link post.header
      page.should have_content "by: #{user.name}"
    end
  end

  context 'editing' do
    it 'allows the author of a post to edit it' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_post_path
      post = FactoryGirl.build(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      click_link post.header
      click_link "Edit"
      fill_in :post_header, with: Faker::Lorem.sentence
      fill_in :post_content, with: Faker::Lorem.paragraph
      click_button "Update Post"
      page.should have_content "Your post has been changed."
    end

    it 'allows the author of a post to delete it' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_post_path
      post = FactoryGirl.build(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      click_link post.header
      click_link "Delete"
      page.should have_content "Your post has been removed."
    end
  end
end
