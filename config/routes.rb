Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'colleges#index'
  resources :colleges do
  end
  resources :departments do
  end
  namespace :pages do
  
    resources :students do
    end
    resources :scores do
    end
    resources :reports do
    end
  end

end
