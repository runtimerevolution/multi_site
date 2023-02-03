Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: 'users#index'
  multi_site_scope do
    resources :users
  end

  namespace :admin do
    resource :admin, controller: 'admin' do
      put :switch_site
    end
  end
end
