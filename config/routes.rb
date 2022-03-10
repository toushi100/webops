Rails.application.routes.draw do
  resources :posts
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations",
             }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get "/user" => "application#user"
  end
  post 'posts/:id/comment' => "comments#create"
  patch 'posts/:id/comment/:id' => "comments#edit"
  delete 'posts/:id/comment/:id' => "comments#destroy"
  post 'tags' => "application#create"
  get "/member-data", to: "members#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
