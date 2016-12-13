Rails.application.routes.draw do
  #SESSIONS
  root 'sessions#index'
  post 'sessions/create' => 'sessions#create'
  delete 'sessions' => 'sessions#logout'
  #USERS
  post 'users/create' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'

  # EVENTS
  get 'events' => 'events#index'
  get 'events/:id' => 'events#show'
  get 'events/:id/edit' => 'events#edit'
  post 'events/create' => 'events#create'
  patch 'events/:id' => 'events#update'
  delete 'events/:id' => 'events#destroy'

  #ATTEND
  post 'attends/create/:id' => 'attends#create'
  delete 'attends/:id' => 'attends#destroy'

  #COMMENTS
  post 'comments/create' => 'comments#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

end
