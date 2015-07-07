$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../lib/web_batch', __FILE__)

require 'data_magic'
require 'rake'
require 'watir-webdriver'
require 'log4r'
require 'rspec'

require_relative '../../lib/common/test_helper'
require_relative '../../lib/web_batch/batch_test'
require_relative '../../lib/web_batch/batch_helper'
require_relative '../../lib/common/logger'
require_relative '../../lib/common/stamps_test'
require_relative '../../lib/common/browser_object'
require_relative '../../lib/common/browser_helper'
require_relative '../../lib/common/stamps'
require_relative '../../lib/web_batch/batch'
require_relative '../../lib/web_batch/navigation_bar'
require_relative '../../lib/web_batch/toolbar'
require_relative '../../lib/web_batch/batch_page'
require_relative '../../lib/web_batch/login_page'
require_relative '../../lib/web_batch/single_order'
require_relative '../../lib/web_batch/delete_shipping_address'
require_relative '../../lib/web_batch/errors'
require_relative '../../lib/web_batch/grid'
require_relative '../../lib/web_batch/manage_shipping_address'
require_relative '../../lib/web_batch/print_window'
require_relative '../../lib/web_batch/service_selection'
require_relative '../../lib/web_batch/add_shipping_adress'
require_relative '../../lib/web_batch/address_not_found'
require_relative '../../lib/web_batch/web_batch'

World(Batch)
