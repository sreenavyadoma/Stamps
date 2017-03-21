module Stamps

  def init(scenario)
    begin
      TestHelper.init scenario
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def teardown
    begin
      TestHelper.teardown
    rescue
      #ignore
    end
  end

  def webreg
    begin
      @webreg = WebReg::WebRegistration.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def pam
    begin
      @pam = Pam::PaymentAdministratorManager.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

  def google
    begin
      @google ||= Google.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def health
    begin
      HealthCheck.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def stamps
    begin
      @stamps ||= StampsCom.new(param)
    rescue Exception => e
      logger.message ""
      logger.message "#{e.message}"
      logger.message "\n#{e.backtrace.join "\n"}"
      logger.message ""
      logger.message ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def test_parameter
    @test_data ||= Hash.new
    @test_data[:customs_associated_items] ||= Hash.new
    @test_data
  end

  def param
    if @param.nil?
      @param = TestParam.new
      expect(ENV['BROWSER']).to be_truthy
      expect(ENV['URL']).to be_truthy
      expect(ENV['HEALTHCHECK']).to be_truthy
      expect(ENV['DEBUG']).to be_truthy
      expect(ENV['USER_CREDENTIALS']).to be_truthy
      expect(ENV['USR']).to be_truthy
      expect(ENV['PW']).to be_truthy
      expect(ENV['WEB_APP']).to be_truthy
      expect(ENV['WEB_APP'].downcase).to eq('orders').or(eq('mail'))
      begin
        ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'
        @param.browser = browser
        @param.logger = logger
        @param.scenario_name = test_helper.scenario_name
        @param.test_env = ENV['URL']
        @param.web_app = (ENV['WEB_APP'].downcase).to_sym
        expect([:orders, :mail]).to include(@param.web_app)
        @param.health_check = ParameterHelper.to_bool ENV['HEALTHCHECK']
        @param.usr = ENV['USR']
        @param.pw = ENV['PW']
        @param.url = ENV['URL']
      rescue Exception => e
        logger.message e.message
        logger.message e.backtrace.join("\n")
      end
    end
    @param
  end

  def address_helper(zone)
    case zone.downcase
      when /zone 1 (?:through|and) 4/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_1_4)
      when /zone 5 (?:through|and) 8/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_5_8)
      when /zone 1/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_1)
      when /zone 2/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_2)
      when /zone 3/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_3)
      when /zone 4/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_4)
      when /zone 5/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_5)
      when /zone 6/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_6)
      when /zone 7/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_7)
      when /zone 8/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_8)
      when /zone 9/
        address = ParameterHelper.format_address(ParameterHelper.rand_zone_9)
      else
        test_parameter[:ship_to_domestic] = ParameterHelper.format_address(zone)
        return test_parameter[:ship_to_domestic]
    end

    test_parameter[:street_address] = address['street_address']
    test_parameter[:city] = address['city']
    test_parameter[:state] = address['state']
    test_parameter[:zip] = address['zip']
    test_parameter[:name] = address['name']
    test_parameter[:company] = address['company']
    test_parameter[:ship_to_domestic] = ParameterHelper.format_address(address)
    test_parameter[:ship_to_domestic]
  end

  def test_helper
    begin
      TestHelper
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def logger
    test_helper.logger
  end

  def browser
    test_helper.browser
  end

  def param_helper
    begin
      ParameterHelper
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      expect("#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def webreg_user_parameter_file * args
    begin
      if ParameterHelper.to_bool(ENV['JENKINS'])
        filename = "#{data_for(:webreg, {})['webreg_param_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.yml"
      else
        filename = "#{data_for(:webreg, {})['dev_usr_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.yml"
      end
      logger.message "WebReg parameter file: #{filename}"
      filename
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data from default.yml. Check your format?").to eql e.message
    end
  end

  def webreg_data_store_filename *args
    begin
      "#{data_for(:webreg, {})['webreg_data_store_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.txt"
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      expect("MagicData: Problem retrieving data. Check your format?").to eql e.message
    end
  end

  def volusion
    begin
      @volusion = Stores::VolusionLoginPage.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      raise e
    end
  end

end
