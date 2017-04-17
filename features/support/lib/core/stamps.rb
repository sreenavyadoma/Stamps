module Stamps
  
  def config
    @config ||= StampsTestConfig.new
  end

  def parameter
    @test_data ||= Hash.new
    @test_data[:customs_associated_items] ||= Hash.new
    @test_data[:details_associated_items] ||= Hash.new
    @test_data[:order_id] ||= Hash.new
    @test_data
  end
  
  def helper
    @helper ||= StampsTestHelper.new(config.logger)
  end

  def registration
    begin
      @registration = WebReg::WebRegistration.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "#{e.backtrace.join "\n"}"
      p ""
      raise e
    end
  end

  def pam
    begin
      @pam = Pam::PaymentAdministratorManager.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "#{e.backtrace.join "\n"}"
      p ""
      raise e
    end
  end

  def google
    begin
      @google ||= Google.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "#{e.backtrace.join "\n"}"
      p ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def health
    begin
      HealthCheck.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "#{e.backtrace.join "\n"}"
      p ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def stamps
    begin
      @stamps ||= StampsCom.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "\n#{e.backtrace.join "\n"}"
      p ""
      p ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end
  
  
  
  def param
    if @param.nil?
      @param = ModalParam.new
      @param.browser_sym = config.browser_sym
      @param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?)?'selenium':ENV['FIREFOX_PROFILE']
      expect(ENV['WEB_APP']).not_to be_nil
      @param.web_app = (ENV['WEB_APP'].downcase).to_sym
      expect([:orders, :mail, :registration]).to include(@param.web_app)

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
        expect(['orders', 'mail', 'webreg']).to include(ENV['WEB_APP'].downcase), "Expected WEB_APP value to be either orders, mail or webreg. Got #{ENV['WEB_APP']}"
      end
    end
    @param.browser = config.browser
    @param.logger = config.logger
    @param.scenario_name = config.scenario_name
    @param
  end

  def address_helper_zone(zone)
    case zone.downcase
      when /zone 1 (?:through|and) 4/
        helper.rand_zone_1_4
      when /zone 5 (?:through|and) 8/
        helper.rand_zone_5_8
      when /zone 1/
        helper.rand_zone_1
      when /zone 2/
        helper.rand_zone_2
      when /zone 3/
        helper.rand_zone_3
      when /zone 4/
        helper.rand_zone_4
      when /zone 5/
        helper.rand_zone_5
      when /zone 6/
        helper.rand_zone_6
      when /zone 7/
        helper.rand_zone_7
      when /zone 8/
        helper.rand_zone_8
      when /zone 9/
        helper.rand_zone_9
      else
        return zone
    end
  end

  def address_helper(zone)
    return helper.format_address(address_helper_zone(zone)) if zone.downcase.include?('zone')
    return helper.format_address(zone)
  end

  def webreg_user_parameter_file * args
    begin
      if helper.to_bool(ENV['JENKINS'])
        filename = "#{data_for(:registration, {})['webreg_param_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.yml"
      else
        filename = "#{data_for(:registration, {})['dev_usr_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.yml"
      end
      config.logger.message "WebReg parameter file: #{filename}"
      filename
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data from default.yml. Check your format?").to eql e.message
    end
  end

  def webreg_data_store_filename(*args)
    begin
      "#{data_for(:registration, {})['webreg_data_store_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.txt"
    rescue Exception => e
      p e.message
      p e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data. Check your format?").to eql e.message
    end
  end

  def volusion
    begin
      @volusion = Stores::VolusionLoginPage.new(param)
    rescue Exception => e
      p ""
      p "#{e.message}"
      p "#{e.backtrace.join "\n"}"
      p ""
      raise e
    end
  end

end
