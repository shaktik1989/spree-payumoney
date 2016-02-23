Spree::Core::Engine.add_routes do
  post '/payumoney', :to => "payumoney#index", :as => :payumoney_proceed
  get '/payumoney/confirm', :to => "payumoney#confirm", :as => :confirm_payumoney
  get '/payumoney/cancel', :to => "payumoney#cancel", :as => :cancel_payumoney
  get '/payumoney/notify', :to => "payumoney#notify", :as => :notify_payumoney
end