$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

require 'data_magic'
require 'rake'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'log4r'
require 'rspec'
require 'date'
require "set"
require 'fileutils'
require 'rbconfig'
require "csv"
require "rautomation"
require 'rubygems' # for compatibility with JRuby, MRI 1.8, etc

# Stamps module
require_relative 'lib/core/browser'
require_relative 'lib/core/stamps'
require_relative 'lib/core/logger'

# OrdersHelper module
require_relative 'lib/orders/orders_helper'
require_relative 'lib/orders/fields'

require_relative 'lib/print/print_helper'
require_relative 'lib/print/helpers'
require_relative 'lib/print/print_postage_object'

require_relative 'lib/webreg/webreg_helper'

require_relative 'lib/pam/pam_helper'
require_relative 'lib/windows/print_window'
require_relative 'lib/orders/store_management'
require_relative 'lib/orders/general_settings'
require_relative 'lib/windows/open_file'
require_relative 'lib/stores/stores_helper'

#require 'atomic'
#require 'thread'
#require 'mysql'

module Selenium
  module WebDriver
    module Firefox
      class Profile
        class << self
          attr_accessor :webdriver_profile_directory
        end

        def layout_on_disk
          # When a directory is specified, ensure it is not deleted at exit
          if Profile.webdriver_profile_directory
            FileReaper.reap = false
          end

          # Use the specified directory if it already exists (ie assuming an existing profile)
          if Profile.webdriver_profile_directory && Dir.exists?(Profile.webdriver_profile_directory)
            return Profile.webdriver_profile_directory
          end

          # Create the profile directory as usual when it does not exist
          temp_dir = Dir.mktmpdir("webdriver-profile")
          FileReaper << temp_dir

          install_extensions(temp_dir)
          delete_lock_files(temp_dir)
          delete_extensions_cache(temp_dir)
          #update_user_prefs_in(temp_dir)

          path = File.join(temp_dir, 'user.js')
          prefs = read_user_prefs(path)

          prefs.merge! self.class.default_preferences.fetch 'mutable'
          prefs.merge! @additional_prefs
          prefs.merge! self.class.default_preferences.fetch 'frozen'

          prefs[WEBDRIVER_PREFS[:untrusted_certs]]  = !secure_ssl?
          prefs[WEBDRIVER_PREFS[:native_events]]    = false
          prefs[WEBDRIVER_PREFS[:untrusted_issuer]] = assume_untrusted_certificate_issuer?

          # If the user sets the home page, we should also start up there
          prefs["startup.homepage_welcome_url"] = prefs["browser.startup.homepage"]

          write_prefs prefs, path

          # If a directory is specified, move the created profile to that directory
          if Profile.webdriver_profile_directory
            FileUtils::mkdir_p(Profile.webdriver_profile_directory)
            FileUtils.cp_r(temp_dir, Profile.webdriver_profile_directory)
            temp_dir = Profile.webdriver_profile_directory
          end

          temp_dir
        end
      end # Profile
    end # Firefox
  end # WebDriver
end # Selenium


World Stamps,Orders,Print,WebReg,Pam,Windows,Stores
