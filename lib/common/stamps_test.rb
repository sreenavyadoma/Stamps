module Stamps
  require_relative 'stamps_logger'

  def self.setup
    log "Begin..."
    cmd "taskkill /im chromedriver.exe /f"
    case ENV['BROWSER']
      when 'ie', 'Internet Explorer'
        browser = Watir::Browser.new :ie
        browser_name = 'Internet Explorer'
      when 'ff', 'firefox'
        browser = Watir::Browser.new :ff
        browser_name = 'Firefox'
      when 'chrome', 'gc'

        chrome_data_dir = "C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data"

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

        browser = Watir::Browser.new :chrome, :switches => ["--user-data-dir=#{chrome_data_dir}"]
        #browser = Watir::Browser.new :chrome, :switches => ["--user_data_dir=C:\\Users\\#{ENV['USERNAME']}\\AppData\\Local\\Google\\Chrome\\User Data", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate]"]
        #browser = Watir::Browser.new :chrome, :prefs => prefs
        browser_name = 'Chrome'
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
