$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/web_batch', __FILE__)

require 'data_magic'
require 'rake'
require 'watir'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'log4r'
require 'rspec'
require 'date'
require "set"

require_relative 'lib/common/browser'
require_relative 'lib/common/stamps'
require_relative 'lib/common/logger'

require_relative 'lib/web_batch/helpers'
require_relative 'lib/web_batch/fields'

require_relative 'lib/web_batch/batch'
require_relative 'lib/web_batch/navigation_bar'
require_relative 'lib/web_batch/toolbar'
require_relative 'lib/web_batch/pages'
require_relative 'lib/web_batch/single_order_form'
require_relative 'lib/web_batch/errors'
require_relative 'lib/web_batch/grid'
require_relative 'lib/web_batch/printing'
require_relative 'lib/web_batch/ship_from_address'
require_relative 'lib/web_batch/purchasing'

World(Stamps,Batch)
