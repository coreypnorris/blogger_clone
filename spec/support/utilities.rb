def sign_in(user)
  visit root_url
  click_link "Login"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Sign in"
end

def create_new_post
  post = FactoryGirl.build(:post)
  click_link "New Post"
  fill_in :header, with: post.header
  fill_in :content, with: post.content
  click_button "Create Post"
end
