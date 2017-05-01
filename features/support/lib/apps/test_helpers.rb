module TestHelper
  def config
    @config ||= StampsTestConfig.new
  end

  def helper
    @helper ||= StampsTestHelper.new(config.logger)
  end

  def test_param
    if @test_data.nil?
      @test_data ||= Hash.new
      @test_data[:customs_associated_items] ||= Hash.new
      @test_data[:details_associated_items] ||= Hash.new
      @test_data[:order_id] ||= Hash.new
    end
    @test_data
  end

  def modal_param
    if @param.nil?
      @param ||= ModalParam.new
      @param.browser_sym = config.browser_sym
      @param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?)?'selenium':ENV['FIREFOX_PROFILE']
      expect(ENV['WEB_APP']).not_to be_nil
      @param.web_app = (ENV['WEB_APP'].downcase).to_sym
      expect([:orders, :mail, :registration]).to include(@param.web_app), "Invalid paramter WEB_APP=#{@param.web_app}. Valid values are mail, registration"

      ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'
      @param.test_env = ENV['URL']
      @param.debug = (ENV["DEBUG"].nil?)?false:ENV["DEBUG"].downcase == "true"

      if @param.web_app == :mail || @param.web_app == :orders
        @param.health_check = helper.to_bool ENV['HEALTHCHECK']
        @param.usr = ENV['USR']
        @param.pw = ENV['PW']
        @param.url = ENV['URL']
        @param.developer = (ENV['DEVELOPER'].nil?)?false:ENV['DEVELOPER']

        expect(ENV['BROWSER']).to be_truthy
        expect(ENV['URL']).to be_truthy
        expect(ENV['HEALTHCHECK']).to be_truthy
        expect(ENV['DEBUG']).to be_truthy
        expect(ENV['USR']).to be_truthy
        expect(ENV['PW']).to be_truthy
        expect(ENV['WEB_APP']).to be_truthy
        expect(['orders', 'mail', 'Registration']).to include(ENV['WEB_APP'].downcase), "Expected WEB_APP value to be either orders, mail or Registration. Got #{ENV['WEB_APP']}"
      end
    end
    @param.browser = config.browser
    @param.logger = config.logger
    @param.scenario_name = config.scenario_name
    @param
  end
end