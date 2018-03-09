module Stamps
  
  module WebAppsParam
    class << self
      
    end
  end
  
  module SdcParam
    class << self
      attr_accessor :log, :scenario_name, :web_app, :env, :health_check, :usr, :pw, :url, :print_media,
                    :developer, :debug, :firefox_profile, :printer, :browser_str, :hostname
      
      def webapps
        raise "Not Implemented."
      end
      
      def webdev
        raise "Not Implemented."        
      end
      
      def ios
        raise "Not Implemented."        
      end
      
      def android
        raise "Not Implemented."        
      end
    end

    def modal_param #todo-Rob refact TestParam
      if @modal_param.nil?
        @modal_param = WebApps::Param.new
        @modal_param.hostname = Socket.gethostname
        expect(ENV['BROWSER']).to_not be(nil), "Browser is not defined, check your cucumber.yml entry for this test or your Jenkins job"
        @modal_param.browser_str = TestHelper.browser_type(ENV['BROWSER'])

        @modal_param.scenario_name = SdcTest.scenario_name
        @modal_param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?) ? 'selenium' : ENV['FIREFOX_PROFILE']
        expect(ENV['WEB_APP']).not_to be_nil
        @modal_param.web_app = (ENV['WEB_APP'].downcase).to_sym
        expect([:orders, :mail, :registration, :pam, :webdev, :rob]).to include(@modal_param.web_app), "Invalid modal_paramter WEB_APP=#{@modal_param.web_app}. Valid values are mail, registration"

        @modal_param.env = ENV['URL']
        @modal_param.env = 'stg' if ENV['URL'].downcase == 'staging'
        @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('cc')
        @modal_param.env = 'qasc' if ENV['URL'].downcase.include?('sc')
        @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('rating')


        @modal_param.printer = (ENV['PRINTER'].nil?) ? 'factory' : ENV['PRINTER']

        @modal_param.debug = (ENV["VERBOSE"].nil?) ? false : ENV["VERBOSE"].downcase == "true"

        if @modal_param.web_app == :mail || @modal_param.web_app == :orders
          @modal_param.health_check = TestHelper.to_bool ENV['HEALTHCHECK']
          @modal_param.url = ENV['URL']
          @modal_param.developer = ENV['DEVELOPER']

          expect(ENV['BROWSER']).to be_truthy
          expect(ENV['URL']).to be_truthy
          expect(ENV['HEALTHCHECK']).to be_truthy
          expect(ENV['VERBOSE']).to be_truthy
          expect(ENV['WEB_APP']).to be_truthy
          expect(['orders', 'mail', 'Registration']).to include(ENV['WEB_APP'].downcase), "Expected WEB_APP value to be either orders, mail or Registration. Got #{ENV['WEB_APP']}"
        end
      end
      @modal_param.driver = SdcTest.driver
      @modal_param.log = SdcTest.log
      @modal_param.scenario_name = SdcTest.scenario_name
      @modal_param
    end
    
  end











  #----------------------------------------------------------
  # 

  def user_credentials
    @user_credentials ||= StampsUserCredentials.new(db_connection)
    @user_credentials.scenario_name = SdcTest.scenario_name
    @user_credentials
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