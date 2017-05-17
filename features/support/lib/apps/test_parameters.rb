module TestParameters
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
    if @modal_param.nil?
      @modal_param ||= ModalParam.new
      @modal_param.browser_sym = config.browser_sym
      @modal_param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?)?'selenium':ENV['FIREFOX_PROFILE']
      expect(ENV['WEB_APP']).not_to be_nil
      @modal_param.web_app = (ENV['WEB_APP'].downcase).to_sym
      expect([:orders, :mail, :registration]).to include(@modal_param.web_app), "Invalid modal_paramter WEB_APP=#{@modal_param.web_app}. Valid values are mail, registration"

      ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'
      @modal_param.test_env = ENV['URL']
      @modal_param.debug = (ENV["DEBUG"].nil?)?false:ENV["DEBUG"].downcase == "true"

      if @modal_param.web_app == :mail || @modal_param.web_app == :orders
        @modal_param.health_check = helper.to_bool ENV['HEALTHCHECK']
        @modal_param.usr = ENV['USR']
        @modal_param.pw = ENV['PW']
        @modal_param.url = ENV['URL']
        @modal_param.developer = (ENV['DEVELOPER'].nil?)?false:ENV['DEVELOPER']

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
    @modal_param.browser = config.browser
    @modal_param.logger = config.logger
    @modal_param.scenario_name = config.scenario_name
    @modal_param
  end
end