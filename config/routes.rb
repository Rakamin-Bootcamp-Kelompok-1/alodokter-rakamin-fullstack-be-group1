Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create, :show, :index]
  post "/login", to: "users#login"
  get "/token_authenticate", to: "users#token_authenticate"
  post '/logout', to: 'users#destroy'
  get "/user/:id_user", to: "users#getUserData"
  patch "/user/update/:id_user", to: "users#updateUserData"
  post "/user/add", to: "users#create"
  get "/users", to: "users#show"
  delete 'users/:id_user', to: "users#deleteUser"

    #forgot password
  resource :passwords, only: [:create]
  post 'password/forgot', to: 'passwords#forgot'
  get 'password/edit/:reset_password_token', to: 'passwords#edit'
  post 'password/edit/:reset_password_token', to: 'passwords#reset' 
  
  resources :articles
  post "/articles", to: "articles#create"
  get "/articles", to: "articles#index"
  get "/article/:id", to: "articles#show"
  post "/article/category", to: "articles#findby_category"
  patch "articles/:id", to: "articles#update"
  delete "articles/:id", to: "articles#destroy"
  post "article/search", to: "articles#search"

  resource :doctors, only: [:create]
  get "/doctors", to: "doctors#index"
  get "doctor/:id", to: "doctors#show"
  post "/doctors/new", to: "doctors#create"
  patch "/doctor/:id", to: "doctors#update"
  delete "doctor/:id", to: "doctors#destroy"
  post "doctors/search", to: "doctors#search"
  post "doctors/category", to: "doctors#findby_category"

  resource :patients, only: [:create]
  get "/patients", to: "patients#index"
  get "/patient/:id", to: "patients#show"
  post "/patients/list", to: "patients#list_patient"
  post "/patients", to: "patients#create"
  patch "/patient/:id", to: "patients#update"
  delete "patient/:id", to: "patients#destroy"

  resources :bookings
  post "/bookings", to: "bookings#create"
  get "/bookings", to: "bookings#index"
  get "/bookings/:id", to: "bookings#show"
  post "/booking/history", to:"bookings#history"
  patch "bookings/:id", to: "bookings#update"
  delete "bookings/:id", to: "bookings#destroy"

  resource :schedules, only: [:create]
  get "/schedules", to: "schedules#index"
  post "/schedule/doctor", to: "schedules#find_schedule"
  post "/schedule/add", to: "schedules#create"
  patch "/schedule/:id", to: "schedules#update"
  delete "/schedule/:id", to: "schedules#destroy"

end
