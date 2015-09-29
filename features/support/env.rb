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
require_relative 'lib/core/browser'
require_relative 'lib/core/stamps'
require_relative 'lib/core/logger'

# BatchHelper module
require_relative 'lib/batch/batch_helper'
require_relative 'lib/batch/fields'

World(Stamps,Stamps::Browser,Batch)
