BloggerClone::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :posts

  resources :users do
    resources :posts
  end

  root to: "posts#index"
end
