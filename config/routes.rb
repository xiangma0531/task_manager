Rails.application.routes.draw do

  root 'task_headers#index'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :task_headers do
    resources :task_details
  end

end
