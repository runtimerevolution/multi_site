Dummy::Application.routes.draw do

  root :to => "welcome#index"
  multi_site_scope do
    resources :users
  end

  namespace :admin do
    resource :admin, controller: 'admin' do
      put :switch_site
    end
  end
end
