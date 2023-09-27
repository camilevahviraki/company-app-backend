Rails.application.routes.draw do
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  get 'users', to: 'users_list#index'
  get 'user/:id', to: 'users_list#show'
  get 'user/delete/:id', to: 'users_list#delete'
  post 'user/:id/permission/edit', to: 'users_list#permissions'
  get 'user/search/:query', to: 'users_list#search'
  
  get 'entities', to: 'entity#index'
  get 'entity/:id', to: 'entity#show'
  get 'entity/delete/:id', to: 'entity#delete'
  post 'entity/update', to: 'entity#update'
  post 'entity/new', to: 'entity#create'
  get 'entity/search/:query', to: 'entity#search'

  get 'departments', to: 'department#index'
  get 'department/:id', to: 'department#show'
  get 'department/delete/:id', to: 'department#delete'
  post 'department/update', to: 'department#update'
  post 'department/new', to: 'department#create'
  get 'department/search/:query', to: 'department#search'

  get 'documents/:user_id', to: 'document#index'
  get 'document/:id', to: 'document#show'
  get 'document/delete/:id', to: 'document#delete'
  post 'document/update', to: 'document#update'
  post 'document/new', to: 'document#create'
  get 'user/:user_id/document/search/:query', to: 'document#search'

end
