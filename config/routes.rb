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
  end

  # resources :base_attributes
  # resources :base_skills

  #api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:show]
      resources :characters, only: [:show] do
        resources :defenses, only: [:show]
        resources :char_attributes, only: [:show]
        resources :active_skills, only: [:show]
        resources :skill_specialties, only: [:show]
      end

    end
  end
end
