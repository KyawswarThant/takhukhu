Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get "user/login", to: "user/sessions#new", as: :new_user_session
    post "user/login", to: "user/sessions#create", as: :user_session
    delete "user/logout", to: "user/sessions#destroy", as: :destroy_user_session
    get "user/signup", to: "user/registrations#new", as: :new_user_registration
    post "user/signup", to: "user/registrations#create", as: :user_registration
  end
  get "user", to: "user/top#index"

  devise_scope :admin do
    get "admin/login", to: "admin/sessions#new", as: :new_admin_session
    post "admin/login", to: "admin/sessions#create", as: :admin_session
    delete "admin/logout", to: "admin/session#destroy", as: :destroy_admin_session
    get "admin/signup", to: "admin/registrations#new", as: :new_admin_registration
    post "admin/signup", to: "admin/registrations#create", as: :admin_registration
  end
  get "admin", to: "admin/top#index"
end
