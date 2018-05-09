Rails.application.routes.draw do

  resources :advertisements
  resources :questions
  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
  end
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  post 'user/confirm' => 'users#confirm'
  get 'about' => 'welcome#about'
  get 'contact'=>'welcome#contact'
  get 'faq'=>'welcome#faq'

  root 'welcome#index'

end
