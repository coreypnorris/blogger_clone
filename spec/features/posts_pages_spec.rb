require 'spec_helper'

describe Post  do
  context 'creating' do
    it 'allows the author to create a new post' do
      visit new_post_path
      post = FactoryGirl.build(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      page.should have_content post.header
    end
  end

  context 'editing' do
    it 'allows the author of a post to edit it' do
      visit new_post_path
      post = FactoryGirl.create(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      visit edit_post_path(post)
      fill_in :post_header, with: Faker::Lorem.sentence
      fill_in :post_content, with: Faker::Lorem.paragraph
      click_button "Update Post"
      page.should have_content "Your post has been changed."
    end

    it 'allows the author of a post to delete it' do
      visit new_post_path
      post = FactoryGirl.create(:post)
      fill_in :post_header, with: post.header
      fill_in :post_content, with: post.content
      click_button "Create Post"
      visit post_path(post)
      click_link "Delete"
      page.should have_content "Your post has been removed."
    end
  end
end
