class SdcTest
  class << self
    def sauce_endpoint
      #"https://#{data_for(:sauce_endpoint, {})['username']}:#{data_for(:sauce_endpoint, {})['access_key']}@ondemand.saucelabs.com:443/wd/hub"
      "https://robcruz:0e60dbc9-5bbf-425a-988b-f81c42d6b7ef@ondemand.saucelabs.com:443/wd/hub"
    end

    def sauce_edge
      caps = Selenium::WebDriver::Remote::Capabilities.edge
      caps['platform'] = 'Windows 10'
      caps['version'] = '16.16299'
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 180

      Watir::Browser.new :remote, { desired_capabilities: caps, http_client: client, url: sauce_endpoint }
    end

    def capabilities(device)
      case device
        when :macos_safari
          capabilities_config = {
            :version => '11.0',
              :platform => 'macOS 10.13',
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :safari

        when :macos_chrome
          capabilities_config = {
            :version => '54.0',
              :platform => 'macOS 10.13',
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :chrome

        when :temp_device
          capabilities_config = {
            :version => '16.16299',
              :platform => 'Windows 10',
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :edge
        else
          message = "Unsupported device. DEVICE=#{device}"
          error = ArgumentError
          raise error, message
      end

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      Selenium::WebDriver::Remote::Capabilities.send(browser, capabilities_config)
    end

    def win10_edge_sauce
      capabilities_config = {
        :version => '16.16299',
          :platform => 'Windows 10',
          :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      }

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      caps = Selenium::WebDriver::Remote::Capabilities.send(:edge, capabilities_config)

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 120

      Watir::Browser.new(:remote, {desired_capabilities: caps, http_client: client, url: sauce_endpoint})
    end

    def macos_chrome_sauce
      capabilities_config = {
        :version => '65.0',
          :platform => 'macOS 10.13',
          :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
      }

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      caps = Selenium::WebDriver::Remote::Capabilities.send(:chrome, capabilities_config)

      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 120

      Watir::Browser.new(:remote, {desired_capabilities: caps, http_client: client, url: sauce_endpoint})
    end

    def iphonex_sauce
      desired_caps = {
          caps: {
              appiumVersion: '1.7.2',
              deviceName:    'iPhone X Simulator',
              deviceOrientation: 'portrait',
              platformVersion: '11.2',
              platformName:  'iOS',
              browserName: 'Safari',
              name: "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          },
          appium_lib: {
              sauce_username:   'robcruz', #nil, # don't run on Sauce
              sauce_access_key: '0e60dbc9-5bbf-425a-988b-f81c42d6b7ef', #nil,
              wait: 120
          }
      }

      Appium::Driver.new(desired_caps, false).start_driver
    end

    def samsung_galaxy_sauce
      desired_caps = {
          caps: {
              appiumVersion: '1.7.2',
              deviceName:    'Samsung Galaxy S8 GoogleAPI Emulator',
              deviceOrientation: 'portrait',
              platformVersion: '7.1',
              platformName:  'Android',
              browserName: 'Chrome',
              name: "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          },
          appium_lib: {
              sauce_username:   nil, # don't run on Sauce 'robcruz',
              sauce_access_key: nil, # '0e60dbc9-5bbf-425a-988b-f81c42d6b7ef', #
              wait: 120
          }
      }

      Appium::Driver.new(desired_caps, false).start_driver
    end

    def configure

      SdcLogger.debug "Initializing test driver...\n"

      if SdcEnv.sauce_device
        SdcPage.browser = SdcDriverDecorator.new(class_eval(SdcEnv.sauce_device.to_s))

      else
        if SdcEnv.browser
          begin
            # Watir.always_locate = true
            case(SdcEnv.browser)

            when :edge
              kill('taskkill /im MicrosoftEdge.exe /f')

              if SdcEnv.jenkins
                def running_in_admin_mode?
                  (`reg query HKU\\S-1-5-19 2>&1` =~ /ERROR/).nil?
                end

                unless running_in_admin_mode?
                  require 'win32ole'
                  shell = WIN32OLE.new('Shell.Application')
                  shell.ShellExecute("ruby", File.expand_path(__FILE__), nil, 'runas')
                  exit
                end
                # Check for x64, call appropriate command
                if File.directory? '\\Windows\\SysWOW64' then
                  result = `\\Windows\\sysnative\\nbtstat.exe -A #{putername}`
                else
                  result = `nbtstat.exe -A #{putername}`
                end
                system 'C:\\windows\\sysnative\\C:\Stamps\config\batch\edge_rdp_unlock.bat'
              end
              #system 'C:\Stamps\config\batch\edge_rdp_unlock.bat' if SdcEnv.jenkins


              SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:edge, accept_insecure_certs: true))

            when :firefox
              kill('taskkill /im firefox.exe /f')
              unless SdcEnv.firefox_profile
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, accept_insecure_certs: true))
              else
                if SdcEnv.web_dev
                  download_directory = "#{Dir.getwd}/download"
                  download_directory.tr!('/', '\\') if Selenium::WebDriver::Platform.windows?
                  profile = Selenium::WebDriver::Firefox::Profile.new
                  profile['browser.download.folderList'] = 2 # custom location
                  profile['browser.download.dir'] = download_directory
                  profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv,application/pdf,image/png,application/x-zip-compressed,text/plain'
                  SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, profile: profile, accept_insecure_certs: true))
                  Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download")
                else
                  profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                  profile.assume_untrusted_certificate_issuer = true
                  profile['network.http.phishy-userpass-length'] = 255
                  SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, :profile => profile))
                  SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, profile: profile, accept_insecure_certs: true))
                end

                SdcPage.browser.driver.manage.timeouts.page_load = 12
              end

              when :chrome
              prefs = {
                  download: {
                      prompt_for_download: false,
                      default_directory: "#{Dir.getwd}/download"
                  }
              }
              kill('taskkill /im chrome.exe /f')
              if SdcEnv.web_dev
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:chrome, options: {prefs: prefs}, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
                Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download")
              else
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
              end

              SdcPage.browser.driver.manage.timeouts.page_load = 12

              # if SdcEnv.scenario.name.include? 'webdev_download'
              #   Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download")
              # end

            when :chromeb
              kill('taskkill /im chrome.exe /f')
              Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
              SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))

              SdcPage.browser.driver.manage.timeouts.page_load = 12

            when :ie
              kill('taskkill /im iexplore.exe /f')
              SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:ie))

            when :safari
              kill("killall 'Safari Technology Preview'")
              SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:safari, technology_preview: true))

            else
              raise ArgumentError, "Invalid browser selection. #{test_driver}"
            end

            SdcPage.browser.window.maximize if SdcEnv.max_window

          rescue StandardError => e
            SdcLogger.error e.message
            SdcLogger.error e.backtrace.join("\n")
            raise e, 'Browser driver failed to start'
          end

        elsif SdcEnv.mobile
          begin
            SdcPage.browser = SdcDriverDecorator.new(SdcAppiumDriver.new(SdcEnv.mobile).core_driver.start_driver)
            SdcPage.browser.manage.timeouts.implicit_wait = 180

          rescue StandardError => e
            SdcLogger.error e.message
            SdcLogger.error e.backtrace.join("\n")
            raise e, 'Appium driver failed to start'
          end

        elsif SdcEnv.browser_mobile_emulator
          arg_arr = SdcEnv.browser_mobile_emulator.split(',')
          if arg_arr.size != 2
            raise ArgumentError, "Wrong number of arguments. Expected 2, Got #{arg_arr.size}"
          end
          browser = arg_arr[0]
          device_name = arg_arr[1]
          driver = browser_emulator_options(browser, device_name)
          SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(driver, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
          SdcPage.browser.driver.manage.timeouts.page_load = 12

          Dir.mkdir("#{Dir.getwd}/download") unless Dir.exist?("#{Dir.getwd}/download/") if SdcEnv.web_dev
        else
          raise ArgumentError, 'Device must be defined'
        end

      end
    end

    def start
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

      SdcEnv.sauce_device ||= ENV['SAUCE_DEVICE']

      if SdcEnv.sauce_device
        SdcEnv::BROWSERS.each { |browser| SdcEnv.browser = browser if SdcEnv.sauce_device.eql? browser.to_s }
        SdcEnv::IOS.each { |device| SdcEnv.ios = device if SdcEnv.sauce_device.eql? device.to_s }
        SdcEnv::ANDROID.each { |device| SdcEnv.android = device if SdcEnv.sauce_device.eql? device.to_s }
      else
        SdcEnv.browser ||= browser_selection(ENV['BROWSER'])
        SdcEnv.browser_mobile_emulator ||= ENV['BROWSER_MOBILE_EMULATOR']
        SdcEnv.ios ||= ENV['IOS']
        SdcEnv.android ||= ENV['ANDROID']
      end

      SdcEnv.mobile = SdcEnv.ios || SdcEnv.android
      SdcEnv.health_check ||= ENV['HEALTHCHECK']
      SdcEnv.usr = ENV['USR']
      SdcEnv.pw = ENV['PW']
      SdcEnv.firefox_profile ||= ENV['FIREFOX_PROFILE']
      SdcEnv.new_framework ||= ENV['NEW_FRAMEWORK']
      SdcEnv.env ||= test_env(ENV['URL'])
      SdcEnv.jenkins ||= ENV['JENKINS']
      SdcEnv.web_dev ||= ENV['WEB_DEV']
      SdcEnv.max_window ||= ENV['MAX_WINDOW'].nil? ? true : ENV['MAX_WINDOW'].casecmp('true').zero?

      #deprecated
      SdcEnv.sdc_app ||= ENV['WEB_APP'].downcase.to_sym unless ENV['WEB_APP'].nil?
      require_gems

      #todo-Rob These should be in an orders/mail or sdc_apps environment variable container. This is a temp fix.
      SdcEnv.printer = ENV['PRINTER']

      @web_apps_param = Stamps::WebApps::Param.new
      @web_apps_param.log = SdcLogger
      @web_apps_param.test_scenario
      @web_apps_param.test_scenario
      @web_apps_param.env = SdcEnv.env
      @web_apps_param.usr = SdcEnv.usr
      @web_apps_param.pw = SdcEnv.pw
      @web_apps_param.printer = SdcEnv.printer
      @web_apps_param.sdc_app = SdcEnv.sdc_app

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
      #require 'mysql2' if SdcEnv.usr.nil? || SdcEnv.usr.casecmp('default').zero?

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
      system 'C:\Stamps\config\batch\edge_rdp_unlock.bat' if SdcEnv.jenkins && SdcEnv.browser == 'edge'
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

    def kill(str)

      stdout, stdeerr, status = Open3.capture3(str)
    rescue
      # ignore

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