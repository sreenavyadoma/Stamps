module Stamps

  module SdcEnv
    TEST_ENVIRONMENTS = %i(stg qacc cc qasc sc rating).freeze unless Object.const_defined?('Stamps::SdcEnv::TEST_ENVIRONMENTS')
    BROWSERS = %i(ff firefox gc chrome safari edge chromeb ie iexplorer).freeze unless Object.const_defined?('Stamps::SdcEnv::BROWSERS')
    SDC_APP = %i(orders mail webdev registration).freeze unless Object.const_defined?('Stamps::SdcEnv::SDC_APP')
    IOS = %i(iphone6 iphone7 iphone8 iphonex).freeze unless Object.const_defined?('Stamps::SdcEnv::IOS')
    ANDROID = %i(samsung_galaxy nexus_5x).freeze unless Object.const_defined?('Stamps::SdcEnv::ANDROID')

    class << self
      attr_accessor :sdc_app, :env, :health_check, :usr, :pw, :url, :verbose,
                    :printer, :browser, :hostname, :print_media, :mobile,
                    :android, :ios, :firefox_profile, :new_framework, :debug,
                    :scenario, :sauce_device, :test_name, :driver_log_level
    end
  end

  module SdcFinder
    extend self
    include Watir::Waitable

    def element(browser, tag: nil, timeout: 20)
      if browser.is_a? Watir::Browser
        if tag
          element = instance_eval("browser.#{tag}(#{yield})")
          result = wait_until(timeout: timeout) { element }
          if result
            element = instance_eval("browser.#{tag}(#{yield})")
            return SdcElement.new(element)
          end
        else
          element = browser.element(yield)
          result = wait_until(timeout: timeout) { element }
          if result
            element = browser.element(yield)
            return SdcElement.new(element)
          end
        end
      else
        element = browser.find_element(yield)
        result = wait_until(timeout: timeout) { element }
        if result
          element = browser.find_element(yield)
          return SdcElement.new(element)
        end
      end

      message = "Cannot locate element #{yield}"
      error = Selenium::WebDriver::Error::NoSuchElementError
      raise error, message
    end

    def elements(browser, tag: nil, timeout: 20)
      if browser.is_a? Watir::Browser
        if tag
          begin
            code = "browser.#{tag}(#{yield})"
            elements = instance_eval(code)
            result = wait_until(timeout: timeout) { elements }
            return instance_eval(code) if result
          rescue Selenium::WebDriver::Error::TimeOutError
            # ignore
          end
        else
          elements = browser.elements(yield)
          result = wait_until(timeout: timeout) { elements }
          return browser.elements(yield) if result
        end
      else
        elements = browser.find_elements(yield)
        result = wait_until(timeout: timeout) { elements }
        return browser.find_elements(yield) if result
      end

      message = "Cannot locate elements #{yield}"
      error = Selenium::WebDriver::Error::NoSuchElementError
      raise error, message
    end

  end

  class SdcPage < WatirDrops::PageObject

    class << self
      def page_obj(name, tag: nil, required: false, timeout: 30, &block)
        _page_object(name, required: required) { SdcFinder.element(browser, tag: tag, timeout: timeout, &block) }
      end
      alias_method :text_field, :page_obj
      alias_method :button, :page_obj
      alias_method :label, :page_obj
      alias_method :selection, :page_obj
      alias_method :link, :page_obj

      def page_objs(name, tag: nil, index: nil, required: false, timeout: 30, &block)
        list_name = index.nil? ? name : "#{name}s".to_sym
        _page_objects(list_name) { SdcFinder.elements(browser, tag: tag, timeout: timeout, &block) }
        _page_object(name, required: required) { SdcElement.new(instance_eval(list_name.to_s)[index]) } if index
      end

      def chooser(name, chooser, verify, property, property_name)
        _page_object(name) { SdcChooser.new(instance_eval(chooser.to_s), instance_eval(verify.to_s), property, property_name) }
      end
      alias_method :checkbox, :chooser
      alias_method :radio, :chooser

      def number(name, text_field, increment, decrement)
        _page_object(name) { SdcNumber.new(instance_eval(text_field.to_s), instance_eval(increment.to_s), instance_eval(decrement.to_s)) }
      end

      def visit(*args)
        super(*args)
      end

      def page_url(required: false)
        super(required: required)
      end

      protected

      def _page_object(name, required: false, &block)
        element(name, required: required, &block)
      end

      def _page_objects(name, &block)
        elements(name, &block)
      end
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
    include ::Watir::Waitable

    def initialize(element)
      @element = element
    end

    def present?
      @element.send(:displayed?) if @lement.respond_to?(:displayed?)
      @element.send(:present?)
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

    def class_disabled?
      prop_include?('class', 'disable')
    end

    def class_enabled?
      prop_include?('class', 'enabled')
    end

    def class_checked?
      prop_include?('class', 'checked')
    end

    def set(*args)
      return @element.send(:send_keys, *args) if @element.is_a? ::Selenium::WebDriver::Element
      @element.send(:set, *args)
    end

    def safe_send_keys(*args, ctr: 1)
      ctr.to_i.times do
        begin
          @element.send(:send_keys, *args)
        rescue
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
          safe_wait_while_present(1)
        rescue
          # ignore
        end
      end
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

    def wait_until_present(timeout: 20, interval: 0.2)
      if @element.respond_to? :wait_until_present
        @element.send(:wait_until_present, timeout: timeout, interval: interval)
      else
        wait_until(timeout: timeout, interval: interval) { present? }
      end

      self
    end

    def wait_while_present(timeout: 20, interval: 0.2)
      if @element.respond_to? :wait_while_present
        @element.send(:wait_while_present, timeout: timeout)
      else
        wait_until(timeout: timeout, interval: interval) { present? }
      end

      self
    end

    def safe_wait_until_present(timeout: nil, interval: nil)
      begin
        wait_until_present(timeout: timeout, interval: interval)
      rescue
        # ignore
      end
    end

    def safe_wait_while_present(timeout: 10, interval: 0.2)
      begin
        wait_while_present(timeout: timeout, interval: interval)
      rescue
        # ignore
      end
    end

    def text_value
      begin
        text = @element.send(:text)
        return text if text.size > 0
      rescue
        # ignore
      end

      begin
        value = @element.send(:value)
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

    def method_missing(name, *args, &block)
      super unless @element.respond_to?(name)
      @element.send(name, *args, &block)
    end

    private

    def prop_include?(property_name, property_value)
      if @element.respond_to? :attribute_value
        return @element.send(:attribute_value, property_name).include?(property_value)
      end
      @element.send(:attribute, property_name).include?(property_value)
    end
  end

  class SdcChooser < BasicObject

    attr_reader :element, :verify, :property, :property_val

    def initialize(element, verify, property, property_val)
      @element = element
      @verify = verify
      @property = property
      @property_val = property_val
      # set_instance_variables(binding, *local_variables)
    end

    def chosen?
      if verify.respond_to? :attribute_value
        result = verify.attribute_value(property)
      else
        result = verify.attribute(property)
      end
      return result.casecmp('true') == 0 if result.casecmp('true') == 0 || result .casecmp('false') == 0
      result.include?(property_val)
    end
    alias_method :checked?, :chosen?
    alias_method :selected?, :chosen?

    def choose(iter: 3)
      iter.times do element.click; break if chosen? end
      chosen?
    end
    alias_method :check, :choose
    alias_method :select, :choose

    def unchoose(iter: 3)
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

  class SdcNumber < BasicObject

    attr_reader :text_field, :increment, :decrement

    def initialize(text_field, increment, decrement)
      @text_field = text_field
      @increment = increment
      @decrement = decrement
      # set_instance_variables(binding, *local_variables)
    end

    def method_missing(name, *args, &block)
      super unless @text_field.respond_to?(name)
      @text_field.send(name, *args, &block)
    end
  end

end
