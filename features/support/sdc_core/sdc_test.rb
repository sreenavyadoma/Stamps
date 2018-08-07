class SdcTest
  class << self

    def configure
      SdcLogger.debug "Initializing test driver...\n"

      if TestSession.env.mobile_device
        SdcPage.browser = TestSession.selenium_device
        print TestSession.env.session_info(SdcPage.browser.session_id)

      elsif TestSession.env.sauce_browser
        SdcPage.browser = TestSession.selenium_browser
        print TestSession.env.session_info(SdcPage.browser.driver.session_id)
        SdcEnv.width = SdcPage.browser.window.size.width
        SdcEnv.height = SdcPage.browser.window.size.height

      elsif TestSession.env.local_browser
        SdcPage.browser = TestSession.local_browser
        SdcEnv.width = SdcPage.browser.window.size.width
        SdcEnv.height = SdcPage.browser.window.size.height
      else
        error_msg = 'Cannot determine if this is a browser, iOS or Android test'
        raise ArgumentError, error_msg
      end

    end

    def start
      require_gems

      ::SdcEnv.log_level ||= ENV['LOG_LEVEL']
      ::SdcEnv.driver_log_level ||= ENV['DRIVER_LOG_LEVEL']

      begin
        SdcLogger.level = if SdcEnv.log_level
                            SdcEnv.log_level
                          else
                            :error
                          end

        Selenium::WebDriver.logger.level = if SdcEnv.driver_log_level
                                             SdcEnv.driver_log_level
                                           else
                                             :error
                                           end
        SdcLogger.progname = SdcEnv.scenario.tags[0].name[1.. -1]

      rescue StandardError => e
        SdcLogger.error e.message
        SdcLogger.error e.backtrace.join("\n")
        raise e
      end
      SdcLogger.debug "\n"
      SdcLogger.debug "Begin test...\n"
      SdcLogger.debug "Feature: #{SdcEnv.scenario.feature}"
      SdcLogger.debug "Scenario: #{SdcEnv.scenario.name}"
      SdcLogger.debug '  Tags:'
      SdcEnv.scenario.tags.each_with_index { |tag, index| SdcLogger.debug "  Tag #{index + 1}: #{tag.name}" }
      SdcLogger.debug '  Steps:'
      SdcEnv.scenario.test_steps.each { |steps| SdcLogger.debug "  #{steps.source.last.keyword}#{steps.text}" }
      SdcLogger.debug "\n"
    end

    def require_gems
      require 'appium_lib'
      require 'appium_lib_core'
      #require 'mysql2' if TestSession.env.usr.nil? || TestSession.env.usr.casecmp('default').zero?

      if /rates/.match(SdcEnv.scenario.tags[0].name)
        require 'spreadsheet'
        require "csv"
        include Spreadsheet
      end
    end

    def legacy_web_apps_param
      @web_apps_param
      @web_apps_param.driver = SdcPage.browser
      @web_apps_param
    end

    def teardown
      # if SdcEnv.sauce_device
      #   sessionid = SdcPage.browser.send(:bridge).session_id
      #   jobname = "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      #   if SdcEnv.scenario.passed?
      #     SauceWhisk::Jobs.pass_job sessionid
      #   else
      #     SauceWhisk::Jobs.fail_job sessionid
      #   end
      #
      #   SdcLog.info "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"
      # else
      #
      #   SdcUserCredentials.close
      #
      #   SdcLog.info "#{SdcPage.browser} closed."
      # end

      SdcLogger.debug "Tear down...\n"
      SdcPage.browser.quit
      SdcLogger.debug "Done.\n"
    rescue StandardError => e
      SdcLogger.error e.message
      SdcLogger.error e.backtrace.join("\n")
    end

    private

    def browser_emulator_options(browser, device_name)
      prefs = {
          prompt_for_download: false,
          default_directory: "#{Dir.getwd}/download"
      }

      case browser_selection(browser)
      when :chrome
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_emulation(device_name: device_name)
        options.add_preference(:download, prefs)
        return Selenium::WebDriver.for(:chrome, options: options)
      when :firefox
        return Selenium::WebDriver::Remote::Capabilities.firefox #firefox config goes here
      else
        raise ArgumentError, "Unsupported browser. #{browser}"
      end
    end


    def mobile(str)
      str.nil? ? str : str.downcase.delete(' ').to_sym
    end

    def is_ios?(str)
      str.nil? ? str : SdcEnv::IOS.include?(str.to_sym)
    end

    def is_android?(str)
      str.nil? ? str : SdcEnv::ANDROID.include?(str.to_sym)
    end

    def browser_selection(str)
      if str
        case str.downcase
        when /ff|firefox|mozilla/
          return :firefox
        when /chromeb|gcb|googleb/
          return :chromeb
        when /chrome|gc|google/
          return :chrome
        when /ms|me|microsoft|edge/
          return :edge
        when /apple|osx|safari|mac/
          return :safari
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def test_env(str)
      if str
        case(str.downcase)
        when /stg/
          return :stg
        when /cc/
          return :qacc
        when /sc/
          return :qasc
        when /rat/
          return :rating
        when /prod/
          return :prod
        else
          return str.downcase.to_sym
        end
      end
      str
    end

    def browser_version(str)
      /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(str)
    end

    def os_version(str)
      /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(str)
    end
  end
end

