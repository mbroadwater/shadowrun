Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :users
  resources :characters do
    resources :defenses
    resources :char_attributes
    resources :active_skills
    resources :skill_specialties
    resources :character_details
    resources :reputations
  end
  resources :weapons


  #api
  # namespace :api, defaults: { format: :json } do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :index]
      resources :characters, only: [:show, :index] do
        resources :defenses, only: [:show, :index]
        resources :char_attributes, only: [:show, :index]
        resources :active_skills, only: [:show, :index]
        resources :skill_specialties, only: [:show, :index]
      end
      resources :base_skills, only: [:show, :index]
      resources :base_attributes, only: [:show, :index]

    end
  end
end
