module Spree
  class PayumoneyController < StoreController
    protect_from_forgery only: :index
    
    def index
      @productinfo = 'apparel'
      @surl = payumoney_confirm_url
      @furl = payumoney_cancel_url
      
      payment_method = Spree::PaymentMethod.find(params[:payment_method_id])

      @service_url = payment_method.provider.service_url
      @merchant_key = payment_method.preferred_merchant_id

      @txnid = payment_method.txnid(current_order)
      @amount = current_order.total.to_s
      @email = current_order.email
      
      if(address = current_order.bill_address || current_order.ship_address)
        @phone = address.phone #udf2
        @firstname = address.firstname
        @lastname = address.lastname #udf1
        @address1 = address.address1 #udf3
        @city = address.city #udf4
        @zipcode = address.zipcode #udf5
        @country_id = address.country_id #udf6
      end
      #filling up all udfs
      #not sure if necessary by offsite payments
      @currency = current_order.currency #udf7
      @payment_method_id = params[:payment_method_id] #udf8
      @item_total = current_order.item_total.to_s #udf9
      @udf10 = current_order.adjustment_total #udf10
      
      @checksum = payment_method.checksum([@txnid, @amount, @productinfo, @firstname, @email, @lastname, @phone, @address1, @city,
                            @zipcode, @country_id, @currency, @payment_method_id, @item_total, @udf10]);
      

    end
    def confirm
      logger.debug "Payumoney Response: #{params.inspect}"
      @all = params
    end
    def cancel
      @all = params
    end
    def notify
    end
  end
end