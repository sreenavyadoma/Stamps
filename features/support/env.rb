$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('lib/features/orders', __FILE__)
$LOAD_PATH << File.expand_path('features/support/lib', __FILE__)

#require 'appium_lib'
require 'data_magic'
require 'rake'
require 'logger'
require 'rspec'
require 'date'
require 'fileutils'
require 'rbconfig'
require 'rubygems'
require 'open3'
require 'measured'
require 'holidays'
require 'watir'
require 'watir_drops'
require 'socket'

require_relative 'sdc_core/sdc_patch'
require_relative 'sdc_core/sdc_core'
require_relative 'sdc_core/sdc_test'
require_relative 'sdc_apps/sdc_website'
require_relative 'sdc_apps/orders/sdc_orders'
require_relative 'sdc_apps/mail/sdc_mail'
require_relative 'sdc_apps/sdc_navigation'

# web dev
require_relative 'web_dev/stamps_endicia/partner_portal'

require_relative 'helpers/test_helpers'

World Stamps, SdcWebsite, SdcOrders, SdcMail, SdcNavigation, PartnerPortal
