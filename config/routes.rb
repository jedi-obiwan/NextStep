Rails.application.routes.draw do
  resources :users

  get	'/',		to: 'static_contents#top'
  get	'/about',	to: 'static_contents#about'
  get	'/contact',	to: 'static_contents#contact'
  get	'/access',	to: 'static_contents#access'

  # Auth
  get	'/users/show',	to: 'users#show'
  get	'/login',	to: 'users#login_form'
  post	'/login',	to: 'users#login'
  post	'/logout',	to: 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
