$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

require 'data_magic'
require 'rake'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'log4r'
require 'rspec'
require 'date'
require "set"
require 'fileutils'
require 'rbconfig'
require "csv"
require "rautomation"
require 'rubygems' # for compatibility with JRuby, MRI 1.8, etc
require 'open3'
require 'yaml'
require 'spreadsheet'
require 'measured'

# Stamps module
require_relative 'lib/core/browser'
require_relative 'lib/core/stamps'
require_relative 'lib/core/stamps_logger'
#require_relative 'lib/stamps/whats_new_modal'

# ParameterHelper module
require_relative 'lib/orders/fields'
require_relative 'lib/mail/mail_form'
require_relative 'lib/windows/print_window'
require_relative 'lib/orders/store_management'
require_relative 'lib/orders/general_settings'
require_relative 'lib/windows/open_file'

# require 'Win32API'
# require 'win32/registry.rb'

World Stamps
