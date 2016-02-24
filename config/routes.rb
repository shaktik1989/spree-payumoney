Spree::Core::Engine.add_routes do
  post '/payumoney', :to => "payumoney#index", :as => :payumoney_proceed
  get '/payumoney/confirm', :to => "payumoney#confirm", :as => :payumoney_confirm
  get '/payumoney/cancel', :to => "payumoney#cancel", :as => :payumoney_cancel
  get '/payumoney/notify', :to => "payumoney#notify", :as => :payumoney_notify
end