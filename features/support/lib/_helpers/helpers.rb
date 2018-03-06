module Stamps
  module TestHelper

  end

  module EnvVar
    class << self
      @param = {}
      @param[:customs_associated_items] = {}
      @param[:service_mapping_items] = {}
      @param[:details_associated_items] = {}
      @param[:order_id] = {}
      @param[:service_look_up] = {}
      @param[:service_look_up]['FCM'] = 'First-Class Mail'
      @param[:service_look_up]['PM'] = 'Priority Mail'
      @param[:service_look_up]['PME'] = 'Priority Mail Express'
      @param[:service_look_up]['MM'] = 'Media Mail'
      @param[:service_look_up]['PSG'] = 'Parcel Select Ground'
      @param[:service_look_up]['FCMI'] = 'First-Class Mail International'
      @param[:service_look_up]['PMI'] = 'Priority Mail International'
      @param[:service_look_up]['PMEI'] = 'Priority Mail Express International'
      @param[:ord_id_ctr] = 0
      @param[:username] = ENV['USR']
      @param[:password] = ENV['PW']
      @param[:web_app] = ENV['WEB_APP']
      @param[:url] = ENV['URL']
      @param[:test] = ENV['USER_CREDENTIALS']
      attr_accessor :param
    end
  end
end