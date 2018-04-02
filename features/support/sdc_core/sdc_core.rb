module Stamps

  module SdcEnv
    TEST_ENVIRONMENTS = %i(stg qacc cc qasc sc rating).freeze unless Object.const_defined?('Stamps::SdcEnv::TEST_ENVIRONMENTS')
    BROWSERS = %i(firefox chrome safari edge chromeb).freeze unless Object.const_defined?('Stamps::SdcEnv::BROWSERS')
    SDC_APP = %i(orders mail webdev registration).freeze unless Object.const_defined?('Stamps::SdcEnv::SDC_APP')
    IDEVICES = %i(iphone6 iphone7 iphone8 iphonex android).freeze unless Object.const_defined?('Stamps::SdcEnv::IDEVICES')

    class << self #todo-Rob refactor PrintMedia
      attr_accessor :sdc_app, :env, :health_check, :usr, :pw, :url, :verbose, :printer, :browser, :hostname,
                    :print_media, :mobile, :firefox_profile, :framework
    end
  end

  module SdcWait
    def wait_until(timeout: 12, interval: 0.2, message: '', ignored: Selenium::WebDriver::Error::NoSuchElementError)
      end_time = Time.now + timeout
      last_error = nil

      until Time.now > end_time
        begin
          result = yield
          return result if result
        rescue *ignored => last_error
          # swallowed
        end

        sleep interval
      end

      msg = if message
              message.dup
            else
              "timed out after #{timeout} seconds"
            end

      msg << " (#{last_error.message})" if last_error

      raise Selenium::WebDriver::Error::TimeOutError, msg
    end

    def wait_while(timeout: 12, interval: 0.2, message: '', ignored: Selenium::WebDriver::Error::NoSuchElementError)
      end_time = Time.now + timeout
      last_error = nil

      until Time.now > end_time
        begin
          result = yield
          return result if result
        rescue *ignored => last_error
          # swallowed
        end

        sleep interval
      end

      msg = if message
              message.dup
            else
              "timed out after #{timeout} seconds"
            end

      msg << " (#{last_error.message})" if last_error

      raise Selenium::WebDriver::Error::TimeOutError, msg
    end

  end

  class SdcAppiumDriver
    class << self
      def core_driver(device_name)
        caps = Appium.load_appium_txt(file: File.expand_path("../../sdc_idevices/caps/#{device_name}.txt", __FILE__), verbose: true)
        @core_driver = Appium::Driver.new(caps, false)
        self
      end

      def method_missing(name, *args, &block)
        super unless @core_driver.respond_to?(name)
        @core_driver.send(name, *args, &block)
      end
    end
  end

  class SdcElementFinder
    include SdcWait

    attr_reader :driver
    alias_method :browser, :driver

    def initialize(driver)
      @driver = driver
    end

    def element(locator, message: '', timeout: 12)
      wait_element = case(locator)
                       when String
                         instance_eval(locator)
                       when Hash
                         if @driver.respond_to?(:element)
                           @driver.element(locator)
                         else
                           @driver.find_element(locator)
                         end
                       else
                         raise ArgumentError, "Invalid locator. #{locator}"
                     end
      begin
        return wait_until(timeout: timeout, message: message) { wait_element }
      rescue Selenium::WebDriver::Error::TimeOutError
        # swallow
      end
      nil
    end
  end

  class SdcPageObject
    include SdcDriver
    include SdcWait

    class << self
      attr_writer :element_list
      attr_writer :required_element_list
      attr_reader :require_url

      def page_url(required: false)
        @require_url = required

        define_method("page_url") do |*args|
          yield(*args)
        end
      end

      def page_title
        define_method("page_title") do |*args|
          yield(*args)
        end
      end

      def element_list
        @element_list ||= []
      end

      def required_element_list
        @required_element_list ||= []
      end

      def inherited(subclass)
        subclass.element_list = element_list.dup
        subclass.required_element_list = required_element_list.dup
      end

      def elements(name, &block)
        define_method(name) do |*args|
          self.instance_exec(*args, &block)
        end

        element_list << name.to_sym
      end

      def text_field(name, locator, required: false)
        watir_element(name, :text_field, locator, required: required)
      end

      def watir_element(name, tag_name, locator, required: false)
        set_element(name, required: required) { SdcElement.new(finder.element("browser.#{tag_name}(#{locator})")) }
      end

      def element(name, locator, timeout: 12, required: false)
        set_element(name, required: required) { SdcElement.new(finder.element(locator, message: name, timeout: timeout)) }
      end
      alias_method :button, :element

      def chooser(name, chooser_loc, verify_loc, property, property_name, timeout: 12, required: false)
        set_element(name, required: required) { SdcChooser.new(finder.element(chooser_loc, timeout: timeout),
                                                           finder.element(verify_loc, timeout: timeout),
                                                           property, property_name) }
      end
      alias_method :checkbox, :chooser
      alias_method :selection, :chooser
      alias_method :radio, :chooser

      def visit(*args)
        new.tap do |page|
          page.goto(*args)
          exception = Selenium::WebDriver::Error::WebDriverError
          message = "Expected to be on #{page.class}, but conditions not met"
          if page.page_verifiable?
            begin
              page.wait_until(timeout: 20) { page.on_page? }
            rescue Selenium::WebDriver::Error::TimeOutError
              raise exception, message
            end
          end
        end
      end

      private

      def set_element(name, required: false, &block)
        define_method(name) do |*args|
          self.instance_exec(*args, &block)
        end

        element_list << name.to_sym
        required_element_list << name.to_sym if required
      end
    end

    attr_reader :browser, :finder
    alias_method :driver, :browser

    def initialize(browser = @@browser)
      @browser = browser
      @finder = SdcElementFinder.new(browser)
    end

    def inspect
      '#<%s url=%s title=%s>' % [self.class, url.inspect, title.inspect]
    end
    alias_method :selector_string, :inspect

    def on_page?
      exception = Selenium::WebDriver::Error::WebDriverError
      message = 'Can not verify page without any requirements set'
      raise exception, message unless page_verifiable?

      if self.class.require_url
        expected = page_url.gsub("#{URI.parse(page_url).scheme}://", '').chomp('/')
        actual = browser.url.gsub("#{URI.parse(browser.url).scheme}://", '').chomp('/')
        return false unless expected == actual
      end

      if self.respond_to?(:page_title) && browser.title != page_title
        return false
      end

      if !self.class.required_element_list.empty? && self.class.required_element_list.any? { |e| !send(e).present? }
        return false
      end

      true
    end

    def goto(*args)
      return browser.goto page_url(*args)

      exception = Selenium::WebDriver::Error::WebDriverError
      message = "Unsupported driver #{browser.class}"
      raise exception, message unless page_verifiable?
    end

    def method_missing(method, *args, &block)
      super unless @browser.respond_to?(method) && method != :page_url
      @browser.send(method, *args, &block)
    end

    def respond_to_missing?(method, _include_all = false)
      @browser.respond_to?(method) || super
    end

    def page_verifiable?
      self.class.require_url || self.respond_to?(:page_title) || self.class.required_element_list.any?
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

    def method_missing(method, *args, &block)
      super unless @driver.respond_to?(method)
      @driver.send(method, *args, &block)
    end

    private
    attr_reader :driver
  end

  class SdcElement < BasicObject
    include SdcWait

    def initialize(element)
      @element = element
    end

    def present?
      return @element.send(:present?) if @lement.respond_to?(:present?)
      enabled? && @element.send(:displayed?)
    end

    def enabled?
      begin
        return @element.send(:enabled?)
      rescue
        # ignore
      end
      false
    end

    def visible?
      begin
        return @element.send(:visible?)
      rescue
        # ignore
      end
      false
    end

    def safe_hover
      begin
        @element.send(:focus).send(:hover)
      rescue
        # ignore
      end

      self
    end

    def safe_click(*modifiers, ctr: 1)
      ctr.to_i.times do
        begin
          @element.send(:click, *modifiers)
        rescue
          # ignore
        end
      end

      self
    end

    def set(*args, iter: 1)
      iter.to_i.times do
        return @element.send(:set, *args) if @element.respond_to? :set
        @element.send(:send_keys, *args)
      end
    end

    def safe_send_keys(*args, ctr: 1)
      ctr.to_i.times do
        begin
          send_keys(*args)
        rescue
          # ignore
        end
      end

      text_value
    end

    def send_keys_while_present(*args, ctr: 1)
      ctr.to_i.times do
        begin
          break unless present?
          safe_send_keys(*args)
          safe_wait_while_present(1)
        rescue
          # ignore
        end
      end
    end

    def wait_until_present(timeout: 12, interval: 0.2)
      wait_until(timeout: timeout, interval: interval) { present? }
    end

    def safe_wait_until_present(timeout: nil, interval: nil)
      begin
        wait_until_present(timeout: timeout, interval: interval)
      rescue
        # ignore
      end

      self
    end

    def wait_while_present(timeout: 12, interval: 0.2)
      wait_while(timeout: timeout, interval: interval) { present? }
    end

    def safe_wait_while_present(timeout: 10, interval: 0.2)
      begin
        wait_while_present(timeout: timeout, interval: interval)
      rescue
        # ignore
      end

      self
    end

    def text_value
      begin
        text = @element.text
        return text if text.size > 0
      rescue
        # ignore
      end

      begin
        value = @element.value
        return value if value.size > 0
      rescue
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
        rescue
          # ignore
        end
      end
    end

    def safe_double_click(ctr: 1)
      ctr.to_i.times do
        begin
          @element.double_click
        rescue
          # ignore
        end
      end

      self
    end

    def scroll_into_view
      begin
        @element.execute_script('arguments[0].scrollIntoView();', @element)
      rescue
        # ignore
      end
      self
    end

    def blur_out(ctr: 1)
      ctr.to_i.times do
        begin
          safe_double_click
          safe_click
        rescue
          # ignore
        end
      end

      self
    end

    def method_missing(method, *args, &block)
      super unless @element.respond_to?(method)
      @element.send(method, *args, &block)
    end
  end

  class SdcChooser

    attr_accessor :element, :verify, :property, :property_val

    def initialize(element, verify, property, property_val)
      set_instance_variables(binding, *local_variables)
    end

    def chosen?
      if verify.respond_to? :attribute_value
        result = verify.attribute_value(property)
      else
        result = verify.property(property)
      end
      return result.casecmp('true') == 0 if result.casecmp('true') == 0 || result .casecmp('false') == 0
      result.include?(property_val)
    end
    alias_method :checked?, :chosen?
    alias_method :selected?, :chosen?

    def choose(iter: 2)
      iter.times do element.click; break if chosen? end
      chosen?
    end
    alias_method :check, :choose
    alias_method :select, :choose

    def unchoose(iter: 2)
      iter.times do break unless chosen?; element.click end
      chosen?
    end
    alias_method :uncheck, :unchoose
    alias_method :unselect, :unchoose

    def method_missing(method, *args, &block)
      super unless element.respond_to?(method)
      element.send(method, *args, &block)
    end
  end

  class SdcNumberElement

    attr_reader :driver, :textbox, :increment, :decrement

    def initialize(text_field, increment, decrement)
      set_instance_variables(binding, *local_variables)
    end

    def method_missing(method, *args, &block)
      super unless @textbox.respond_to?(method)
      @textbox.send(method, *args, &block)
    end
  end
end
