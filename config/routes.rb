Rails.application.routes.draw do
  get	'/',		to: 'static_contents#top'
  get	'/about',	to: 'static_contents#about'
  get	'/contact',	to: 'static_contents#contact'
  get	'/access',	to: 'static_contents#access'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
