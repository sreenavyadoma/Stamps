
module SdcEnv
  TEST_ENVIRONMENTS = %i[stg qacc cc qasc sc rating].freeze unless Object.const_defined?('SdcEnv::TEST_ENVIRONMENTS')
  BROWSERS = %i[ff firefox gc chrome safari edge chromeb ie iexplorer].freeze unless Object.const_defined?('SdcEnv::BROWSERS')
  BROWSER_MOBILE_EMULATORS = ['iPhone X', 'iPhone 4', 'Pixel 2', 'Pixel 2 XL', 'iPad'].freeze unless Object.const_defined?('SdcEnv::BROWSER_MOBILE_EMULATORS')
  HEALTH_CHECK_APPS = ['address book', 'orders', 'or reports', 'postage tools'].freeze unless Object.const_defined?('SdcEnv::HEALTH_CHECK_APPS')
  IOS = %i[iphone6 iphone7 iphone8 iphonex].freeze unless Object.const_defined?('SdcEnv::IOS')
  ANDROID = %i[samsung_galaxy nexus_5x].freeze unless Object.const_defined?('SdcEnv::ANDROID')

  class << self
    attr_accessor :sdc_app, :env, :health_check, :usr, :pw, :url, :debug,
                  :printer, :browser, :hostname, :mobile, :scenario,
                  :sauce_device, :test_name, :log_level, :driver_log_level,
                  :browser_mobile_emulator, :android, :ios, :firefox_profile,
                  :new_framework, :max_window, :web_dev, :jenkins
  end
end

##
# Variable
# Description
# SELENIUM_HOST  The hostname of the Selenium server
# SELENIUM_PORT  The port of the Selenium server
# SELENIUM_PLATFORM  The operating system of the selected browser
# SELENIUM_VERSION  The version number of the selected browser
# SELENIUM_BROWSER  The name of the selected browser
# SELENIUM_DRIVER  Contains the operating system, version and browser name of the selected browser
# SELENIUM_URL  The initial URL to load when the test begins
# SAUCE_USERNAME  The user name used to invoke Sauce OnDemand
# SAUCE_ACCESS_KEY  The access key for the user used to invoke Sauce OnDemand
# SELENIUM_STARTING_URL  The value of the Starting URL field
# SAUCE_ONDEMAND_BROWSERS  A JSON-formatted string representing browsers you selected for the job configuration
module SauceLabs
  class << self
    attr_accessor :host, :port, :platform, :version, :browser, :driver, :url,
                  :sauce_username, :sauce_access_key, :selenium_starting_url,
                  :sauce_on_demand_browsers
  end
end

module SdcFinder

  # @param [Browser] browser either Watir::Browser or Appium::Core::Driver
  # @param [String]  HTML tag
  # @param [Integer] timeout in seconds
  def element(browser, tag: nil, timeout: 15)
    if browser.is_a? Watir::Browser
      if tag
        element = instance_eval("browser.#{tag}(#{yield})", __FILE__, __LINE__)
        result = Watir::Wait.until(timeout: timeout) { element }
        if result
          element = instance_eval("browser.#{tag}(#{yield})", __FILE__, __LINE__)
          return SdcElement.new(element)
        end
      else
        element = browser.element(yield)
        result = Watir::Wait.until(timeout: timeout) { element }
        if result
          element = browser.element(yield)
          return SdcElement.new(element)
        end
      end
    else
      element = browser.find_element(yield)
      result = Watir::Wait.until(timeout: timeout) { element }
      if result
        element = browser.find_element(yield)
        return SdcElement.new(element)
      end
    end

    message = "Cannot locate element #{yield}"
    error = Selenium::WebDriver::Error::NoSuchElementError
    raise error, message
  end
  module_function :element

  def elements(browser, tag: nil, timeout: 15)
    if browser.is_a? Watir::Browser
      if tag
        begin
          code = "browser.#{tag}(#{yield})"
          elements = instance_eval(code, __FILE__, __LINE__)
          result = Watir::Wait.until(timeout: timeout) { elements }
          return instance_eval(code, __FILE__, __LINE__) if result
        rescue Selenium::WebDriver::Error::TimeOutError
          # ignore
        end
      else
        elements = browser.elements(yield)
        result = Watir::Wait.until(timeout: timeout) { elements }
        return browser.elements(yield) if result
      end
    else
      elements = browser.find_elements(yield)
      result = Watir::Wait.until(timeout: timeout) { elements }
      return browser.find_elements(yield) if result
    end

    message = "Cannot locate elements #{yield}"
    error = Selenium::WebDriver::Error::NoSuchElementError
    raise error, message
  end
  module_function :elements

end

class SdcPage < WatirDrops::PageObject

  class << self

    def page_object(name, tag: nil, required: false, timeout: 15, &block)
      element(name.to_sym, required: required) do
        SdcFinder.element(browser, tag: tag, timeout: timeout, &block)
      end
    end
    alias text_field page_object
    alias button page_object
    alias label page_object
    alias selection page_object
    alias link page_object

    def page_objects(name, tag: nil, index: nil, required: false, timeout: 15)
      list_name = index.nil? ? name : "#{name}s".to_sym

      elements(list_name) do
        SdcFinder.elements(browser, tag: tag, timeout: timeout) { yield }
      end

      if index
        element(name, required: required) do
          SdcElement.new(instance_eval(list_name.to_s, __FILE__, __LINE__)[index])
        end
      end
    end

    def chooser(name, chooser, verify, property, property_name)
      element(name.to_sym) do
        SdcChooser.new(instance_eval(chooser.to_s, __FILE__, __LINE__),
                       instance_eval(verify.to_s, __FILE__, __LINE__),
                       property, property_name)
      end
    end
    alias checkbox chooser
    alias radio chooser

    def sdc_number(name, text_field, increment, decrement)
      element(name.to_sym) do
        SdcNumber.new(instance_eval(text_field.to_s, __FILE__, __LINE__),
                      instance_eval(increment.to_s, __FILE__, __LINE__),
                      instance_eval(decrement.to_s, __FILE__, __LINE__))
      end
    end
  end

  define_method :sdc_number do |*args|
    self.class.sdc_number(*args)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

  define_method :chooser do |*args|
    self.class.chooser(*args)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

  define_method :page_objects do |*args, &block|
    SdcPage.page_objects(*args, &block)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

  define_method :page_object do |*args, &block|
    SdcPage.page_object(*args, &block)

    instance_eval(args.first.to_s, __FILE__, __LINE__)
  end

end

class SdcDriverDecorator < BasicObject

  def initialize(driver)
    @driver = driver
  end

  def goto(*args)
    return @driver.get(*args) if @driver.respond_to?(:get)
    @driver.goto(*args)
  end

  def respond_to_missing?(name, include_private = false)
    @driver.respond_to?(name, include_private) || super
  end

  def method_missing(method, *args, &block)
    super unless @driver.respond_to?(method)
    @driver.send(method, *args, &block)
  end

end

class SdcElement < BasicObject
  include ::Watir::Waitable

  def initialize(element)
    @element = element
  end

  def present?
    send(:displayed?) if respond_to?(:displayed?)
    send(:present?)
  end

  def enabled?
    begin
      return send(:enabled?)
    rescue ::StandardError
      # ignore
    end

    false
  end

  def visible?
    begin
      return send(:visible?)
    rescue ::StandardError
      # ignore
    end

    false
  end

  def safe_hover
    begin
      send(:focus)
      send(:hover)
    rescue ::StandardError
      # ignore
    end

    self
  end

  def set(*args)
    return send(:send_keys, *args) if is_a? ::Selenium::WebDriver::Element
    send(:set, *args)
  end

  def set_attribute(name, value)
    execute_script("return arguments[0].#{name.to_s}='#{value.to_s}'", @element)
  end

  def safe_send_keys(*args, ctr: 1)
    ctr.to_i.times do
      begin
        send(:send_keys, *args)
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def send_keys_while_present(*args, ctr: 1)
    ctr.to_i.times do
      begin
        break unless present?
        safe_send_keys(*args)
        safe_wait_while_present(timeout: 1)
      rescue ::StandardError
        # ignore
      end
    end
  end

  def safe_click(*modifiers, ctr: 1)
    ctr.to_i.times do
      begin
        send(:click, *modifiers)
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def safe_double_click(ctr: 1)
    ctr.to_i.times do
      begin
        send(:double_click) if present?
      rescue ::StandardError
        # ignore
      end
    end

    self
  end

  def wait_until_present(timeout: nil, message: nil, interval: nil)
    if respond_to? :wait_until_present
      send(:wait_until_present, timeout: timeout, interval: interval)
    else
      wait_until(timeout: timeout, interval: interval, &:present?)
    end

    self
  end

  def wait_while_present(timeout: nil, message: nil, interval: nil)
    if respond_to? :wait_while_present
      send(:wait_while_present, timeout: timeout)
    else
      wait_while(timeout: timeout, interval: interval, &:present?)
    end

    self
  end

  def safe_wait_until_present(timeout: nil, message: nil, interval: nil)
    wait_until_present(timeout: timeout, interval: interval)
  rescue ::Watir::Wait::TimeoutError
    # ignore
  rescue ::Selenium::WebDriver::Error::TimeOutError
    # ignore
    # ignored
  end

  def safe_wait_while_present(timeout: nil, message: nil, interval: nil)
    wait_while_present(timeout: timeout, interval: interval)
  rescue ::Watir::Wait::TimeoutError
    # ignore
  rescue ::Selenium::WebDriver::Error::TimeOutError
    # ignore
  end

  def text_value
    begin
      text = send(:text)
      return text unless text.empty?
    rescue ::StandardError
      # ignore
    end

    begin
      value = send(:value)
      return value unless value.empty?
    rescue ::StandardError
      # ignore
    end

    nil
  end

  def click_while_present(*modifiers, ctr: 2)
    ctr.to_i.times do
      begin
        safe_click(*modifiers)
        safe_wait_while_present(1)
        break unless present?
      rescue ::StandardError
        # ignore
      end
    end
  end

  def scroll_into_view
    begin
      execute_script('arguments[0].scrollIntoView();', @element)
    rescue ::StandardError
      # ignore
    end

    self
  end

  def blur_out(ctr: 1)
    ctr.to_i.times do
      safe_double_click
      safe_click
    end

    self
  end

  def class_disabled?
    attribute_include?('class', 'disable')
  end

  def class_enabled?
    attribute_include?('class', 'enabled')
  end

  def class_checked?
    attribute_include?('class', 'checked')
  end

  def attribute_include?(property_name, property_value)
    if respond_to? :attribute_value
      return send(:attribute_value, property_name).include?(property_value)
    end
    send(:attribute, property_name).include?(property_value)
  end

  def respond_to_missing?(name, include_private = false)
    @element.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @element.respond_to?(name)
    @element.send(name, *args, &block)
  end
end

class SdcChooser < BasicObject

  def initialize(element, verify, property, value)
    @element = element
    @verify = verify
    @property = property.to_s
    @value = value.to_s
    # set_instance_variables(binding, *local_variables)
  end

  def chosen?
    result = if @verify.respond_to? :attribute_value
               @verify.send(:attribute_value, @property)
             else
               @verify.send(:attribute, @property)
             end
    return result.casecmp('true').zero? if result.casecmp('true').zero? || result .casecmp('false').zero?
    result.include?(@value)
  end

  alias checked? chosen?
  alias selected? chosen?

  def choose(iter: 3)
    iter.times do
      click
      break if chosen?
    end

    chosen?
  end

  alias check choose
  alias select choose

  def unchoose(iter: 3)
    iter.times do
      break unless chosen?
      click
    end

    chosen?
  end

  alias uncheck unchoose
  alias unselect unchoose

  def respond_to_missing?(name, include_private = false)
    @element.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @element.respond_to? name
    @element.send(name, *args, &block)
  end
end

class SdcNumber < BasicObject

  attr_reader :text_field, :increment, :decrement

  def initialize(text_field, increment, decrement)
    @text_field = text_field
    @increment = increment
    @decrement = decrement
  end

  def respond_to_missing?(name, include_private = false)
    @text_field.respond_to?(name, include_private) || super
  end

  def method_missing(name, *args, &block)
    super unless @text_field.respond_to?(name)
    @text_field.send(name, *args, &block)
  end
end

class SdcLogger
  class << self
    def logger
      unless @logger
        @logger = ::Logger.new(STDOUT)
        @logger.datetime_format = '%H:%M:%S'
        @logger.progname = 'Stamps.com'
        @logger.formatter = proc do |severity, datetime, progname, msg|
          "#{progname} :: #{msg}\n"
        end
      end
      @logger
    end

    def respond_to_missing?(name, include_private = false)
      logger.respond_to?(name, include_private) || super
    end

    def method_missing(method, *args)
      super unless logger.respond_to?(method)
      logger.send(method, *args)
    end
  end
end

class TestData
  class << self
    def hash
      @hash ||= {}
    end
  end
end

module SdcDriver
  class << self
    def browser=(browser)
      @@browser = browser
    end
    alias driver= browser=


    def browser
      @@browser
    end
    alias driver browser
  end
end

class SdcAppiumDriver

  attr_reader :device

  def initialize(device)
    @device = device
  end

  def core_driver
    @core_driver ||= initialize_driver
  end

  def respond_to_missing?(name, include_private = false)
    @core_driver.respond_to?(name, include_private)
  end

  def method_missing(name, *args, &block)
    super unless @core_driver.respond_to?(name)
    @core_driver.send(name, *args, &block)
  end

  private

  def initialize_driver
    file = ::File.expand_path("../../sdc_device_caps/#{device.to_s}.txt", __FILE__)
    exception = ::Selenium::WebDriver::Error::WebDriverError
    message = "Missing Appium capabilities file. #{device}: #{file}"
    raise(exception, message) unless ::File.exist? file

    caps = ::Appium.load_appium_txt(file: file, verbose: true)
    ::Appium::Driver.new(caps, false)
  end
end