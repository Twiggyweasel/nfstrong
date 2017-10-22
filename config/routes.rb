Rails.application.routes.draw do
  root to: 'pages#index'
  # Single Routes
  get 'about', to: 'pages#about'
  get 'privacy', to: 'pages#privacy'
  get 'nf', to: 'pages#nf'

  # admin routes
  namespace :admin do
    resources :events do
      get 'settings', on: :member
      get 'event_refresh', to: 'ajax_actions#event_refresh', on: :member
      get 'transactions', on: :member
      resources :registrations
      resources :resources
    end
    resources :users

    # admin single routes
    get 'dashboard', to: 'pages#dashboard'
    get 'donations', to: 'pages#donations'
    get 'emails', to: 'pages#emails'
    get 'payments', to: 'pages#payments'
    get 'reports', to: 'pages#reports'

  end

  # Public routes
  resources :donations

  resources :events, only: %i[index show] do
    get 'donations', on: :member
    resources :donations, shallow: true
    resources :fundraisers, shallow: true
    resources :registrations, shallow: true
    resources :sponsors, shallow: true
  end

  resources :fundraiser do
    resources :donations, shallow: true
  end
  resources :registrations do
    resources :donations, shallow: true
  end

  resources :sponsors do
    resources :donations, shallow: true
  end

  resources :runners, only: %i[index]

  resources :users do
    resources :notifications, only: %i[index]
    resources :runners, only: %i[show new create edit update destroy]
  end
  # redirects
  get '/admin', to: redirect { 'admin/dashboard' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
