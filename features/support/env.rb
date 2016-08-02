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
require_relative 'lib/core/stamps_logger'

# ParameterHelper module
require_relative 'lib/orders/fields'
require_relative 'lib/print/print_postage_object'
require_relative 'lib/windows/print_window'
require_relative 'lib/orders/store_management'
require_relative 'lib/orders/general_settings'
require_relative 'lib/windows/open_file'


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
          profile_dir = @model ? create_tmp_copy(@model) : Dir.mktmpdir("webdriver-profile")
          FileReaper << profile_dir

          install_extensions(profile_dir)
          delete_lock_files(profile_dir)
          delete_extensions_cache(profile_dir)
          update_user_prefs_in(profile_dir)

          # If a directory is specified, move the created profile to that directory
          if Profile.webdriver_profile_directory
            FileUtils.cp_r(profile_dir, Profile.webdriver_profile_directory)
            profile_dir = Profile.webdriver_profile_directory
          end

          profile_dir
        end
      end # Profile
    end # Firefox
  end # WebDriver
end # Selenium


World Stamps
