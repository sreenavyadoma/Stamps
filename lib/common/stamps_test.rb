module Stamps
  require_relative 'logger'

  def self.setup
    log "Begin..."
    begin
      system "taskkill /im chrome.exe /f"
    rescue
      #ignore
    end
    case ENV['BROWSER']
      when 'ie', 'Internet Explorer'
        browser = Watir::Browser.new :ie
        browser_name = 'Internet Explorer'
      when 'ff', 'firefox', 'Firefox'
        browser = Watir::Browser.new :ff
        browser_name = 'Firefox'
      when 'chrome', 'gc', 'Chrome'
        browser_name = 'Chrome'
        chrome_data_dir = "C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data"
        log_param "chrome_data_dir:  exist?  #{File.exist? chrome_data_dir}  ##", chrome_data_dir

        raise "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}" unless File.exist? chrome_data_dir

        prefs = {
            :download => {
                :prompt_for_download => false,
                :default_directory => chrome_data_dir
        }

        }

        profile = Selenium::WebDriver::Chrome::Profile.new

        user_data_dir = "user-data-dir=#{chrome_data_dir}"
        #--user-data-dir="C:\Users\rcruz\AppData\Local\Temp\scoped_dir19560_20237"
        log "Launching #{browser_name}..."
        browser = Watir::Browser.new :chrome, :switches => ["--user-data-dir=#{chrome_data_dir}"]
        log "#{browser_name} instantiated."
        #browser = Watir::Browser.new :chrome, :switches => ["--user_data_dir=C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate]"]
        #browser = Watir::Browser.new :chrome, :prefs => prefs

      when 'opera'
        browser = Watir::Browser.new :opera
        browser_name = 'Opera'
      when 'debug'
        debug_profile = Selenium::WebDriver::Firefox::Profile.new
        #debug_profile.add_extension "firebug-1.9.1-fx.xpi"
        browser = Watir::Browser.new :firefox, :profile => debug_profile
        browser_name = 'Firefox (Firebug)'
      else
        browser = Watir::Browser.new :ie
        browser_name = 'Internet Explorer'
    end

    log_param 'Browser', browser_name
    browser.window.maximize
    @browser = browser
  end

  def self.teardown
    @browser.quit unless @browser == nil
    @browser = nil
    log "Done!"
  end
end
=begin
        public static void killChromeDriverProcess(){
                     String command = "taskkill /im chromedriver.exe /f";
                     executeShellCommand(command);
        }
=end
