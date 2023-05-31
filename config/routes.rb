Rails.application.routes.draw do
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "tasks#index"
  resources :tasks
  resources :projects
  post "tasks/:id/toggle", to: "tasks#toggle"
  post "projects/:id/toggle", to: "projects#toggle"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
