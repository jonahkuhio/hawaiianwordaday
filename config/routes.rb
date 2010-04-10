ActionController::Routing::Routes.draw do |map|
 map.with_options(:controller => 'classified') do |classified|
   classified.connect 'classifieds/new', :action => 'new'
   classified.connect 'classifieds/create', :action => 'create'
   classified.connect 'classifieds/edit/:id', :action => 'edit'
   classified.connect 'classifieds/update/:id', :action => 'update'
   classified.connect 'classifieds/delete/:id', :action => 'delete'
   classified.connect 'classifieds/categories/:id', :action => 'show_category'
   classified.connect 'classifieds/:id', :action => 'show'
   classified.connect '', :action => 'list'
 end
 map.with_options(:controller => 'category') do |category|
   category.connect 'categories', :action => 'list'
   category.connect 'categories/show/:id', :action => 'show'
 end
 
 map.connect 'profile/:login', :controller => 'user', :action => 'show'
 map.show 'classifieds/:id', :controller => 'classified', :action => 'list' 
 map.home '', :controller => 'classified', :action => 'list'
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
