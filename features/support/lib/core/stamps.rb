module Stamps

  def init scenario
    begin
      TestHelper.init scenario
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      "#{e.backtrace.join("\n")}").to eql e.message
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

  def health
    begin
      HealthCheck.new(param)
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      "#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def stamps
    begin
      @stamps ||= StampsCom.new(param)
    rescue Exception => e
      logger.message ""
      logger.message "#{e.message}"
      logger.message "#{e.backtrace.join "\n"}"
      logger.message ""
      "#{e.backtrace.join("\n")}").to eql e.message
      #@google_home_page = Object.const_get(page_name.gsub(" ","")).new(@browser)
    end
  end

  def param
    expect(ENV['BROWSER']).to be_truthy
    expect(ENV['URL']).to be_truthy
    expect(ENV['HEALTHCHECK']).to be_truthy
    expect(ENV['DEBUG']).to be_truthy
    expect(ENV['USER_CREDENTIALS']).to be_truthy
    expect(ENV['USR']).to be_truthy
    expect(ENV['PW']).to be_truthy
    expect(ENV['WEB_APP']).to be_truthy
    expect(ENV['WEB_APP'].downcase).to eq('orders').or(eq('mail'))

    ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'

    @param ||= TestParam.new
    @param.browser = browser
    @param.logger = logger
    @param.scenario_name = test_helper.scenario_name
    @param.test_env = ENV['URL']
    @param.web_app = ENV['WEB_APP'].to_sym
    @param.health_check = ParameterHelper.to_bool ENV['HEALTHCHECK']
    @param.usr = ENV['USR']
    @param.pw = ENV['PW']
    @param.url = ENV['URL']
    @param
  end

  def test_helper
    begin
      TestHelper
    rescue Exception => e
      logger.error ""
      logger.error "#{e.message}"
      logger.error "#{e.backtrace.join "\n"}"
      logger.error ""
      "#{e.backtrace.join("\n")}").to eql e.message
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
      "#{e.backtrace.join("\n")}").to eql e.message
    end
  end

  def test_data
    @test_data ||= Hash.new
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
      "MagicData: Problem retrieving data from default.yml. Check your format?").to eql e.message
    end
  end

  def webreg_data_store_filename *args
    begin
      "#{data_for(:webreg, {})['webreg_data_store_dir']}\\#{ENV['URL']}_#{(args.length==0)?"webreg":"#{args[0]}"}.txt"
    rescue Exception => e
      logger.error e.message
      logger.error e.backtrace.join("\n")
      "MagicData: Problem retrieving data. Check your format?").to eql e.message
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
