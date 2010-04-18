ActionController::Routing::Routes.draw do |map|
 map.resources :words, :collection => [:search]
 map.resources :email_subscriptions
 map.resources :categories
 
 map.unsubscribe 'unsubscribe/:id', :controller => 'email_subscriptions', :action => 'destroy'

 map.connect 'profile/:login', :controller => 'user', :action => 'show'
 
 map.root :controller => 'words'
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

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
