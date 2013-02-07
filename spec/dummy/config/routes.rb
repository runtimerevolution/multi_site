Dummy::Application.routes.draw do

  root :to => "welcome#index"
  multi_site_scope do
    resources :users
  end
end
