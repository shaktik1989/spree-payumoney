module Spree
  class PayumoneyController < StoreController
    protect_from_forgery except: :confirm
    #include ActiveMerchant::Billing::Integrations::PayuIn
    
    def index
      @productinfo = 'apparel'
      #@service_url
      #byebug
      #manipuate order and create hashed 
      #string to be passsed to payumoney server

      #@pay = Spree::Gateway::Payumoney.new
      @payment_method = Spree::PaymentMethod.find(params[:payment_method_id])
      
      @checksum = @payment_method.checksum(current_order);
      
      @service_url = @payment_method.provider.service_url
      @merchant_key = @payment_method.preferred_merchant_id
      @order = current_order
      @txnid = @payment_method.txnid(current_order)
      @amount = current_order.total.to_s
      @email = current_order.email
      
      if(address = current_order.bill_address || current_order.ship_address)
        @phone = address.phone
        @firstname = address.firstname
      end
      #payment_method.inspect
      #render :plain 
    end
    def confirm
    end
    def cancel
    end
    def notify
    end
  end
end