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

World Stamps
