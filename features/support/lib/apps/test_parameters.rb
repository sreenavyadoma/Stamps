module Stamps
  module TestParameters
    include BrowserType
    def test_param
      if @test_param.nil?
        @test_param = {}
        @test_param[:customs_associated_items] = {}
        @test_param[:service_mapping_items] = {}
        @test_param[:details_associated_items] = {}
        @test_param[:order_id] = {}
        @test_param[:service_look_up] = {}
        @test_param[:service_look_up]['FCM'] = 'First-Class Mail'
        @test_param[:service_look_up]['PM'] = 'Priority Mail'
        @test_param[:service_look_up]['PME'] = 'Priority Mail Express'
        @test_param[:service_look_up]['MM'] = 'Media Mail'
        @test_param[:service_look_up]['PSG'] = 'Parcel Select Ground'
        @test_param[:service_look_up]['FCMI'] = 'First-Class Mail International'
        @test_param[:service_look_up]['PMI'] = 'Priority Mail International'
        @test_param[:service_look_up]['PMEI'] = 'Priority Mail Express International'
        @test_param[:ord_id_ctr] = 0
        @test_param[:username] = ENV['USR']
        @test_param[:password] = ENV['PW']
        @test_param[:web_app] = ENV['WEB_APP']
        @test_param[:url] = ENV['URL']
        @test_param[:test] = ENV['USER_CREDENTIALS']
      end
      @test_param
    end

    def modal_param #todo-Rob refact TestParam
      if @modal_param.nil?
        @modal_param = Browser::Param.new
        @modal_param.hostname = Socket.gethostname
        expect(ENV['BROWSER']).to_not be(nil), "Browser is not defined, check your cucumber.yml entry for this test or your Jenkins job"
        @modal_param.browser_str = browser_type(ENV['BROWSER'])

        @modal_param.scenario_name = StampsTest.scenario_name
        @modal_param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?) ? 'selenium' : ENV['FIREFOX_PROFILE']
        expect(ENV['WEB_APP']).not_to be_nil
        @modal_param.web_app = (ENV['WEB_APP'].downcase).to_sym
        expect([:orders, :mail, :registration, :pam, :webdev, :rob]).to include(@modal_param.web_app), "Invalid modal_paramter WEB_APP=#{@modal_param.web_app}. Valid values are mail, registration"

        @modal_param.test_env = ENV['URL']
        @modal_param.test_env = 'stg' if ENV['URL'].downcase == 'staging'
        @modal_param.test_env = 'qacc' if ENV['URL'].downcase.include?('cc')
        @modal_param.test_env = 'qasc' if ENV['URL'].downcase.include?('sc')
        @modal_param.test_env = 'qacc' if ENV['URL'].downcase.include?('rating')
        TestHelper.test_env = ENV['URL']

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
      @modal_param.browser = StampsTest.driver
      @modal_param.logger = StampsTest.log
      @modal_param.scenario_name = StampsTest.scenario_name
      @modal_param
    end

    def modal
      @modal ||= {}
    end
  end
end