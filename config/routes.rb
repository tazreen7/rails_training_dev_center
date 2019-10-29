Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'associates#index'
end
 # post 'show', :to => 'associate#show'
  patch 'update', :to => 'associates#edit'

  devise_for :users
  get 'welcome/index'
   # patch  'associates/update'

get 'associates/index'
  get 'associates/new'
  get 'associates/edit'
  get 'associates/update'

    get  'sessions/new'
    # get 'associates/show'
    devise_scope :user do
      get 'users/sign_in', to: 'devise/sessions#new'
      get 'users/sign_up', to: 'devise/registrations#new'
      get 'users/sign_out', to: 'devise/sessions#destroy'
    end
resource:associates, :users do
end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
