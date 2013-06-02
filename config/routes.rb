Telecom::Application.routes.draw do

  namespace :admin do
    resources :plans
    resources :services
  end


  root :to => 'home#index'


end
