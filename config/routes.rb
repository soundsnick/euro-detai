Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#home'

  get 'login', to: 'app#login', as: :login
  get 'register', to: 'app#register', as: :register
  get 'parts', to: 'app#parts', as: :parts
  get 'parts/search', to: 'app#search', as: :search
  get 'parts/advanced_search', to: 'app#advanced_search', as: :advanced_search
  get 'part/:id(.:format)', to: 'app#part', as: :part
  get 'new/:id(.:format)', to: 'app#new', as: :new
  get 'news', to: 'app#news', as: :news
  get 'news/search', to: 'app#news_search', as: :news_search
  post 'commentary/add', to: 'app#commentary_add'
  get 'commentary/delete/:id(.:format)', to: 'app#commentary_delete'
  get 'commentary/publish/:id(.:format)', to: 'admin#commentary_publish'
  get 'reviews/', to: 'app#reviews'
  post 'review/add', to: 'app#review_add'
  get 'warranties/', to: 'app#warranties', as: :warranties
  get 'payment-shipping/', to: 'app#payment_shipping', as: :payment_shipping
  get 'contacts', to: 'app#contacts', as: :contacts
  get 'reviews/search', to: 'app#reviews_search'
  get 'buy/:partId(.:format)', to: 'app#buy', as: :buy
  post 'order/new', to: 'admin#order_new', as: :orders
  post 'category/new', to: 'admin#category_new', as: :categories
  get 'query', to: 'app#query', as: :query
  post 'query/add', to: 'app#query_add', as: :queries

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
  get 'admin/commentaries', to: 'admin#commentaries', as: :acommentaries
  get 'admin/reviews', to: 'admin#reviews', as: :areviews
  get 'api/review/delete/:id(.:format)', to: 'admin#review_delete'
  get 'api/review/publish/:id(.:format)', to: 'admin#review_publish'
  get 'admin/orders', to: 'admin#orders', as: :aorders
  get 'admin/categories', to: 'admin#categories', as: :acategories
  get 'admin/queries', to: 'admin#queries', as: :aqueries
  get 'admin/query/:id(.:format)', to: 'admin#query', as: :aquery
  get '/api/query/delete/:id(.:format)', to: 'admin#query_delete', as: :query_delete
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
  get 'api/category.:method(.:format)', to: 'car#category'
  get 'api/new.:method(.:format)', to: 'car#new'
  get 'api/query.:method(.:format)', to: 'car#query'
  get 'api/commentary/delete/:id(.:format)', to: 'admin#commentary_delete'
  get 'api/commentary/publish/:id(.:format)', to: 'admin#commentary_publish'
  get 'api/review/delete/:id(.:format)', to: 'admin#review_delete'
  get 'api/review/publish/:id(.:format)', to: 'admin#review_publish'
  get 'api/order/delete/:id(.:format)', to: 'admin#order_delete'
end
