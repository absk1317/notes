Rails.application.routes.draw do
  root to: 'application#redirect_to_notes'

  devise_for :users
  resources :notes, except: :destroy do
    delete :destroy, on: :member
  end
  get 'tags/:tag', to: 'notes#index', as: :tag
end
