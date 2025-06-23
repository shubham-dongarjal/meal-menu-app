Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Home and root
  get 'home/index'
  root to: 'home#index'

  # Menus routes - ensure export routes come before :id routes
  resources :menus, only: [:new, :create, :edit, :update, :destroy, :index] do
    collection do
      get :export_all
      get :export_by_date
    end

    # Nested menu_responses routes
    resources :menu_responses, only: [:new, :create, :update, :destroy]
  end

  # Separate :show route to avoid conflict with export routes
  resources :menus, only: [:show]

  get "/login_via_token", to: "magic_links#login", as: :login_via_token

  post '/magic_link', to: 'magic_links#create', as: :magic_link
  get '/auth/email', to: 'magic_links#auth_request', as: :auth_email
  get '/auth/email/callback', to: 'magic_links#auth_callback', as: :auth_email_callback
  get '/magic_links/login', to: 'magic_links#login', as: :magic_link_login


end
 