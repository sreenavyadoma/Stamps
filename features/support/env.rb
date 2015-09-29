$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/batch', __FILE__)

require 'data_magic'
require 'rake'
require 'watir'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'log4r'
require 'rspec'
require 'date'
require "set"

# Stamps module
require_relative 'lib/common/browser'
require_relative 'lib/common/stamps'
require_relative 'lib/common/logger'

# BatchHelper module
require_relative 'lib/batch/batch_helper'
require_relative 'lib/batch/fields'

World(Stamps,Stamps::Browser,Batch)
