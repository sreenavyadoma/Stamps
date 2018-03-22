module Stamps
  module TestData
    class << self
      def store
        if @store.nil?
          @store = {}
          @store[:customs_associated_items] = {}
          @store[:service_mapping_items] = {}
          @store[:details_associated_items] = {}
          @store[:order_id] = {}
          @store[:service_look_up] = {}
          @store[:service_look_up]['FCM'] = 'First-Class Mail'
          @store[:service_look_up]['PM'] = 'Priority Mail'
          @store[:service_look_up]['PME'] = 'Priority Mail Express'
          @store[:service_look_up]['MM'] = 'Media Mail'
          @store[:service_look_up]['PSG'] = 'Parcel Select Ground'
          @store[:service_look_up]['FCMI'] = 'First-Class Mail International'
          @store[:service_look_up]['PMI'] = 'Priority Mail International'
          @store[:service_look_up]['PMEI'] = 'Priority Mail Express International'
          @store[:ord_id_ctr] = 0
          @store[:username] = ENV['USR']
          @store[:password] = ENV['PW']
          @store[:web_app] = ENV['WEB_APP']
          @store[:url] = ENV['URL']
          @store[:test] = ENV['USER_CREDENTIALS']
        end
        @store
      end
    end
  end
end