Rails.application.routes.draw do
  resources :batches, except: [:new, :destroy, :edit, :update], param: :slug do
    resources :registrations, only: [:new, :create]
  end

  resources :registrations, only: [:update] do
    get 'edit', to: 'registrations#edit', on: :collection
  end

  resources :students, only: [:edit, :update]

  root to: 'batches#new'
end
