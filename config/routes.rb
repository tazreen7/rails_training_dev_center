Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'associates#index'
end
  devise_for :users
  get 'welcome/index'


  get 'accept_request', to: 'associates#accept_request'
  get 'cancel_request', to: 'associates#cancel_request'

  get 'associates/index'
  get 'associates/new'
  get 'associates/edit'
  put 'associates/update/:id', to: 'associates#update'
  put 'associates/delete/:id', to: 'associates#delete'

    get  'sessions/new'

    devise_scope :user do
      get 'users/sign_in', to: 'devise/sessions#new'
      get 'users/sign_up', to: 'devise/registrations#new'
      get 'users/sign_out', to: 'devise/sessions#destroy'
    end
  resource:associates, :users do

  end
end
