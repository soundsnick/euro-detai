Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'app#home'



  get 'sitemap', to: 'app#sitemap'
  get 'robots', to: 'app#robots', format: :text
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
  get 'subcategories', to: 'app#subcategories', as: :subcategory_search
  get 'catalog/:category', to: 'app#subcategories', as: :catalog
  get 'catalog/:category/:manufacturer', to: 'app#subcategories', as: :catalog_manufacturer
  get 'manufacturer/:manufacturer', to: 'app#manufacturer_parts', as: :manufacturer_parts


  # User Routing
  get 'api/user.auth', to: 'user#authorisation'
  get 'logout', to: 'user#logout'

  # Admin Routing
  get 'admin/', to: 'admin#main'
  get 'admin/parts', to: 'admin#parts', as: :aparts
  get 'admin/parts_search', to: 'admin#parts_search', as: :aparts_search
  get 'admin/news_search', to: 'admin#news_search', as: :anews_search
  get 'admin/models_search', to: 'admin#models_search', as: :amodels_search
  get 'parts/add', to: 'admin#part_add', as: :partadd
  get 'news/add', to: 'admin#new_add', as: :newadd
  put 'parts', to: 'admin#part_update'
  put 'news', to: 'admin#new_update'
  get 'admin/parts/:part_id(.:format)', to: 'admin#part_edit', as: :aparts_edit
  get 'admin/news/:new_id(.:format)', to: 'admin#new_edit', as: :anews_edit
  get 'admin/news', to: 'admin#news', as: :anews
  get 'admin/manufacturers', to: 'admin#manufacturers', as: :amanufacturers
  get 'admin/models', to: 'admin#models', as: :amodels
  get 'admin/announcement', to: 'admin#announcement', as: :aannouncements
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
  get 'admin/subcategories', to: 'admin#subcategories', as: :asubcategories
  get 'admin/queries', to: 'admin#queries', as: :aqueries
  get 'admin/query/:id(.:format)', to: 'admin#query', as: :aquery
  get '/api/query/delete/:id(.:format)', to: 'admin#query_delete', as: :query_delete
  get 'admin/seo', to: 'admin#seo', as: :aseo
  post 'parts', to: 'admin#part_new'
  post 'manufacturers', to: 'admin#manufacturer_add', as: :manufacturers
  post 'models', to: 'admin#model_add', as: :models
  post 'subcategories', to: 'admin#subcategory_add', as: :subcategories
  post 'carcasses', to: 'admin#carcass_add', as: :carcasses
  post 'fuels', to: 'admin#fuel_add', as: :fuels
  post 'volumes', to: 'admin#volumes_add', as: :volumes
  post 'colors', to: 'admin#colors_add', as: :colors
  post 'countries', to: 'admin#countries_add', as: :countries
  post 'roles', to: 'admin#roles_add', as: :roles
  post 'news', to: 'admin#news_new'
  post 'announcement', to: 'admin#announcement_change'
  post 'seo', to: 'admin#seo_new', as: :seos

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
  get 'api/subcategory.:method(.:format)', to: 'car#subcategory'
  get 'api/new.:method(.:format)', to: 'car#new'
  get 'api/query.:method(.:format)', to: 'car#query'
  get 'api/commentary/delete/:id(.:format)', to: 'admin#commentary_delete'
  get 'api/commentary/publish/:id(.:format)', to: 'admin#commentary_publish'
  get 'api/review/delete/:id(.:format)', to: 'admin#review_delete'
  get 'api/review/publish/:id(.:format)', to: 'admin#review_publish'
  get 'api/order/delete/:id(.:format)', to: 'admin#order_delete'
  get 'api/seo.:method(.:format)', to: 'car#seo'

  get '/texts', to: 'app#texts', as: :texts
  post '/texts', to: 'app#texts_new'
  get '/texts/change', to: 'app#texts_change'

  get 'magazin/:name(.:format)', to: 'app#manufacturer'
  # get 'parser', to: 'app#newsparser'
  # get 'parserimg', to: 'app#parseimg'
  # get 'parsernews', to: 'app#parsernews'
  # get 'parser', to: 'app#model/parser'
  # get 'parser', to: 'admin#parser'
end
