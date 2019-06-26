Rails.application.routes.draw do
  resources :batches, except: [:destroy, :edit, :update]
end
