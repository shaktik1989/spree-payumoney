require "offsite_payments"
module Spree
  class Gateway::Payumoney < Gateway
    preference :merchant_id, :string
    preference :secret_key, :string

    #attr_accessible :merchant_id, :secret_key
      
    def provider_class
      ::OffsitePayments.integration('Payu_In')
    end
    
    def provider
      #assign payment mode
      OffsitePayments.mode = preferred_test_mode == true ? :test : :production
      provider_class
    end

    def checksum(items)
      provider_class.checksum(preferred_merchant_id, preferred_secret_key, items)
    end    
    
    def auto_capture?
      true
    end
    
    def method_type
      "payumoney"
    end
    
    def support?(source)
      true
    end
    
    def authorization
      self
    end
    
    def txnid(order)
      order.id.to_s + order.number.to_s
    end
  end
end