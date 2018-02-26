Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', sessions: 'sessions', registrations: 'registrations'}
  root 'welcome#index'
end
