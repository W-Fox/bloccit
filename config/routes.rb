Rails.application.routes.draw do
  
  get 'advertisements/index'

  get 'advertisements/show'

  resources :advertisements
  
  get 'advertisements/index' => 'advertisements#index'


root to: 'advertisements#index'
end
