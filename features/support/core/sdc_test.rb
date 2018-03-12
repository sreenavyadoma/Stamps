module Stamps

  module SdcEnv
    class << self
      attr_accessor :web_app, :env, :health_check, :usr, :pw, :url, :verbose,
                    :firefox_profile, :printer, :browser_str, :hostname, :scenario
    end
  end

  class SdcTest
    class << self
      attr_accessor :log

      def setup(browser, firefox_profile = nil)
        begin
          Watir.always_locate = true
          Selenium::WebDriver.logger.level = :warn
          case(browser)
            when :edge # Launch Microsoft Edge
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im MicrosoftEdge.exe /f")
              rescue
                # ignore
              end
              @driver = SdcDelegatedDriver.new(Watir::Browser.new(:edge, accept_insecure_certs: true))
              @driver.window.maximize

            when :firefox # Launch Firefox
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
              rescue
                # ignore
              end
              if firefox_profile.nil?
                @driver = Watir::Browser.new(:firefox, accept_insecure_certs: true)
              else
                profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                profile.assume_untrusted_certificate_issuer = true
                profile['network.http.phishy-userpass-length'] = 255
                @driver = SdcDelegatedDriver.new(Watir::Browser.new(:firefox, :profile => profile))
              end
              @driver.window.resize_to 1560, 1020
              @driver.window.move_to 0, 0

            when :chrome
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              rescue
                # ignore
              end
              @driver = SdcDelegatedDriver.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
              @driver.window.maximize
            #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']

            when :ie # Launch Internet Explorer
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              rescue
                # ignore
              end
              @driver = SdcDelegatedDriver.new(Watir::Browser.new(:ie))
              @driver.window.maximize

            when :safari
              begin
                stdout, status = Open3.capture3("killall 'Safari Technology Preview'")    #todo Alex uncomment once framework upgraded to Watir 6.10.2
              rescue
                # ignore
              end
              @driver = SdcDelegatedDriver.new(Watir::Browser.new(:safari, technology_preview: true))
            else
              raise ArgumentError, "#{driver} is not a valid driver selection"
          end
          @driver
        rescue Exception => e
          log.error e.message
          log.error e.backtrace.join("\n")
          raise "Test setup failed. #{e.message}", e
        end
      end
      
      def driver
        @driver
      end
      
      def print_test_steps
        raise ArgumentError, 'Set scenario object before printing test steps' if scenario.nil?
        self.scenario_name = scenario.name
        log.info "- Feature: #{scenario.feature}"
        log.info "- Scenario: #{scenario.name}"
        log.info "- Tags:"
        scenario.tags.each_with_index { |tag, index| log.info "--Tag #{index + 1}: #{tag.name}" }
        log.info "- Steps:"
        scenario.test_steps.each_with_index { |steps, index| log.info "-- #{steps.source.last.keyword}#{steps.text}" }
        log.info "-"
        log.info "-"
      end

      def os
        @os = begin
          host_os = RbConfig::CONFIG['host_os']
          case host_os
            when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
              return :windows
            when /darwin|mac os/
              return :macosx
            when /linux/
              return :linux
            when /solaris|bsd/
              return :unix
            else
              expect("OS #{host_os.inspect} is not defined").to eql ""
          end
        end
      end

      def teardown
        begin
          driver.quit
        rescue
          # ignore
        end
        log.info "#{@browser_str} closed."
      end

      def clear_cookies
        log.info "Clearing cookies"
        begin
          driver.cookies.clear
        rescue
          # ignore
        end
      end

      private
      def browser_version(str)
        /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(str)
      end

      def os_version(str)
        /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(str)
      end
    end

    def initialize(scenario)
      env_params(scenario)
      logger
    end

    private
    def env_params(scenario)
      raise ArgumentError, "WEB_APP is not defined." if ENV['WEB_APP'].nil?
      raise ArgumentError, "BROWSER is not defined." if ENV['BROWSER'].nil?
      raise ArgumentError, "" unless %w(staging cc sc rating).include?(ENV['URL'].downcase)

      SdcEnv.scenario = scenario
      SdcEnv.verbose = ENV['VERBOSE'].nil? ? false : ENV['VERBOSE'].downcase == 'true'
      SdcEnv.hostname = Socket.gethostname
      SdcEnv.web_app = (ENV['WEB_APP'].downcase).to_sym
      SdcEnv.env = ENV['URL']
      SdcEnv.health_check = ENV['HEALTHCHECK'].nil? ? false : ENV['HEALTHCHECK'].downcase == 'true'
      SdcEnv.usr = ENV['USR']
      SdcEnv.pw = ENV['PW']
      SdcEnv.env = 'stg' if ENV['URL'].downcase == 'staging'
      SdcEnv.env = 'qacc' if ENV['URL'].downcase.include?('cc')
      SdcEnv.env = 'qasc' if ENV['URL'].downcase.include?('sc')
      SdcEnv.env = 'qacc' if ENV['URL'].downcase.include?('rating')
      SdcEnv.browser = case ENV['BROWSER'].downcase
                         when /ff|firefox|mozilla/
                           return :firefox
                         when /chrome|gc|google/
                           return :chrome
                         when /ms|me|microsoft|edge/
                           return :edge
                         # when /ie|explorer|internet explorer/
                         #   return :ie
                         when /apple|osx|safari|mac/
                           return :safari
                         else
                           # do nothing
                       end
    end

    def logger
      logger = Log4r::Logger.new(":")
      logger.outputters = Outputter.stdout
      self.class.log = Stamps::Core::SdcLogger.new(logger)
      self.class.log.verbose = SdcParamHelper.verbose
    end
  end

  def modal_param #todo-Rob refact TestParam
    if @modal_param.nil?
      #@modal_param = WebApps::Param.new
      #@modal_param.hostname = Socket.gethostname
      #expect(ENV['BROWSER']).to_not be(nil), "Browser is not defined, check your cucumber.yml entry for this test or your Jenkins job"
      #@modal_param.browser_str = TestHelper.browser_type(ENV['BROWSER'])

      #@modal_param.scenario_name = SdcEnv.scenario_name

      #@modal_param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?) ? 'selenium' : ENV['FIREFOX_PROFILE']

      #expect(ENV['WEB_APP']).not_to be_nil
      #@SdcEnv.web_app = (ENV['WEB_APP'].downcase).to_sym
      #expect([:orders, :mail, :registration, :pam, :webdev, :rob]).to include(@SdcEnv.web_app), "Invalid modal_paramter WEB_APP=#{@SdcEnv.web_app}. Valid values are mail, registration"

      # @modal_param.env = ENV['URL']
      # @modal_param.env = 'stg' if ENV['URL'].downcase == 'staging'
      # @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('cc')
      # @modal_param.env = 'qasc' if ENV['URL'].downcase.include?('sc')
      # @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('rating')


      @modal_param.printer = (ENV['PRINTER'].nil?) ? 'factory' : ENV['PRINTER']

      @modal_param.debug = (ENV["VERBOSE"].nil?) ? false : ENV["VERBOSE"].downcase == "true"

      if @SdcEnv.web_app == :mail || @SdcEnv.web_app == :orders
        @SdcEnv.health_check = TestHelper.to_bool ENV['HEALTHCHECK']
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
    @modal_param.scenario_name = SdcEnv.scenario_name
    @modal_param
  end


  module SdcParamHelper
    class << self

      attr_accessor :env

      def webapps
        webapps = WebApps::Param.new
        webapps
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

      def browser_type(driver)

        raise ArgumentError, "#{driver} is not a valid selection. Valid browsers are ff|firefox|mozilla|chrome|gc|google|ms|me|microsoft|edge"
      end

      def modal_param #todo-Rob refact TestParam
        if @modal_param.nil?
          @modal_param = WebApps::Param.new
          @modal_param.hostname = Socket.gethostname
          expect(ENV['BROWSER']).to_not be(nil), "Browser is not defined, check your cucumber.yml entry for this test or your Jenkins job"
          @modal_param.browser_str = TestHelper.browser_type(ENV['BROWSER'])

          @modal_param.scenario_name = SdcEnv.scenario_name
          @modal_param.firefox_profile = (ENV['FIREFOX_PROFILE'].nil?) ? 'selenium' : ENV['FIREFOX_PROFILE']
          expect(ENV['WEB_APP']).not_to be_nil
          @SdcEnv.web_app = (ENV['WEB_APP'].downcase).to_sym
          expect([:orders, :mail, :registration, :pam, :webdev, :rob]).to include(@SdcEnv.web_app), "Invalid modal_paramter WEB_APP=#{@SdcEnv.web_app}. Valid values are mail, registration"

          @modal_param.env = ENV['URL']
          @modal_param.env = 'stg' if ENV['URL'].downcase == 'staging'
          @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('cc')
          @modal_param.env = 'qasc' if ENV['URL'].downcase.include?('sc')
          @modal_param.env = 'qacc' if ENV['URL'].downcase.include?('rating')


          @modal_param.printer = (ENV['PRINTER'].nil?) ? 'factory' : ENV['PRINTER']

          @modal_param.debug = (ENV["VERBOSE"].nil?) ? false : ENV["VERBOSE"].downcase == "true"

          if @SdcEnv.web_app == :mail || @SdcEnv.web_app == :orders
            @SdcEnv.health_check = TestHelper.to_bool ENV['HEALTHCHECK']
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
        @modal_param.scenario_name = SdcEnv.scenario_name
        @modal_param
      end
    end

  end
end

=begin


          log.info "Browser Selection: #{driver}"

              #driver = Watir::Browser.new :safari                                         #todo Alex uncomment once framework upgraded to Watir 6.10.2
              #versions(driver.execute_script("return navigator.userAgent;"))
              #driver.window.maximize #todo-Rob move elsewhere


          #log.info "-"
          #log.info "BROWSER: #{self.browser_version.to_s.gsub("/", " ")}"
          #log.info "OS: #{self.os_version.to_s.gsub("/", " ")}" if self.os_version
          #log.info "-"


              #@driver.window.maximize
              #self.browser_version = /Edge\/.+/.match(driver.execute_script("return navigator.userAgent;"))


#stdout, status = Open3.capture3("killall Safari")

              #versions(driver.execute_script("return navigator.userAgent;"))
              #versions(@driver.execute_script("return navigator.userAgent;"))





=end
