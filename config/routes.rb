Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#home'

  get 'login', to: 'app#login', as: :login
  get 'parts', to: 'app#parts', as: :parts
  get 'parts/search', to: 'app#search', as: :search
  get 'parts/advanced_search', to: 'app#advanced_search', as: :advanced_search
  get 'part/:id(.:format)', to: 'app#part', as: :part
  get 'new/:id(.:format)', to: 'app#new', as: :new
  get 'news', to: 'app#news', as: :news
  get 'news/search', to: 'app#news_search', as: :news_search

  # User Routing
  get 'api/user.auth', to: 'user#authorisation'
  get 'logout', to: 'user#logout'

  # Admin Routing
  get 'admin/', to: 'admin#main'
  get 'admin/parts', to: 'admin#parts', as: :aparts
  get 'parts/add', to: 'admin#part_add', as: :partadd
  get 'news/add', to: 'admin#new_add', as: :newadd
  put 'parts', to: 'admin#part_update'
  get 'admin/parts/:part_id(.:format)', to: 'admin#part_edit', as: :aparts_edit
  get 'admin/news', to: 'admin#news', as: :anews
  get 'admin/manufacturers', to: 'admin#manufacturers', as: :amanufacturers
  get 'admin/models', to: 'admin#models', as: :amodels
  get 'admin/carcasses', to: 'admin#carcasses', as: :acarcasses
  get 'admin/fiels', to: 'admin#fuels', as: :afuels
  get 'admin/volumes', to: 'admin#volumes', as: :avolumes
  get 'admin/colors', to: 'admin#colors', as: :acolors
  get 'admin/users', to: 'admin#users', as: :ausers
  get 'admin/countries', to: 'admin#countries', as: :acountries
  get 'admin/roles', to: 'admin#roles', as: :aroles
  post 'parts', to: 'admin#part_new'
  post 'manufacturers', to: 'admin#manufacturer_add', as: :manufacturers
  post 'models', to: 'admin#model_add', as: :models
  post 'carcasses', to: 'admin#carcass_add', as: :carcasses
  post 'fuels', to: 'admin#fuel_add', as: :fuels
  post 'volumes', to: 'admin#volumes_add', as: :volumes
  post 'colors', to: 'admin#colors_add', as: :colors
  post 'countries', to: 'admin#countries_add', as: :countries
  post 'roles', to: 'admin#roles_add', as: :roles
  post 'news', to: 'admin#news_new'


  # Api Routing
  get 'api/user.:method(.:format)', to: 'user#user'
  get 'api/country.:method(.:format)', to: 'user#country'
  get 'api/role.:method(.:format)', to: 'user#role'
  get 'api/fuel.:method(.:format)', to: 'car#fuel'
  get 'api/part.:method(.:format)', to: 'car#part'
  get 'api/carcass.:method(.:format)', to: 'car#carcass'
  get 'api/volume.:method(.:format)', to: 'car#volume'
  get 'api/model.:method(.:format)', to: 'car#model'
  get 'api/manufacturer.:method(.:format)', to: 'car#manufacturer'
  get 'api/color.:method(.:format)', to: 'car#color'
  get 'api/new.:method(.:format)', to: 'car#new'
end
