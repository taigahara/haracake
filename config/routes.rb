Rails.application.routes.draw do
  devise_for :end_users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
    passwords: 'public/passwords'
  }

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions',
    registrations: 'admin/registrations',
    passwords: 'admin/passwords'
  }

  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update] do
      get 'search', on: :collection
    end
    resources :items, only: [:index, :new, :create, :show, :edit, :update] do
      get 'search', on: :collection
    end
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    
    get 'end_users/mypage' => 'end_users#show'
    patch 'end_users/mypage' => 'end_users#update'
    get 'end_users/confirm' => 'end_users#confirm'
    get 'end_users/mypage/edit' => 'end_users#edit'
    patch 'end_users/withdrow' => 'end_users#withdrow'
    
    resources :items, only: [:index, :show]
    
    resources :cart_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all'
    
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :show, :new, :create]
  
    
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
