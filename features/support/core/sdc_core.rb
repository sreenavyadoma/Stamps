module Stamps
  class PageObject
    include Watir::Waitable

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

      def element(name, required: false, &block)
        define_method(name) do |*args|
          self.instance_exec(*args, &block)
        end

        element_list << name.to_sym
        required_element_list << name.to_sym if required
      end

      def visit(*args)
        new.tap do |page|
          page.goto(*args)
          exception = Selenium::WebDriver::Error::WebDriverError
          message = "Expected to be on #{page.class}, but conditions not met"
          if page.page_verifiable?
            begin
              page.wait_until(&:on_page?)
            rescue Watir::Wait::TimeoutError
              raise exception, message
            end
          end
        end
      end

      def browser=(browser)
        @@browser = browser
      end

      def browser
        @@browser
      end

    end

    attr_reader :browser

    def initialize(browser = @@browser)
      @browser = browser
    end

    def inspect
      '#<%s url=%s title=%s>' % [self.class, url.inspect, title.inspect]
    end
    alias_method :selector_string, :inspect

    def on_page?
      exception = Selenium::WebDriver::Error::WebDriverError
      message = "Can not verify page without any requirements set"
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
      browser.goto page_url(*args)
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

  class SdcElement < BasicObject
    def initialize(element)
      @element = element
    end

    def disabled?
      begin
        return @element.send(:disabled?)
      rescue
        # ignore
      end
      true
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

    def truthy?
      !@element.nil? && @element.send(:exist?)
    end

    def clickable?
      truthy? && @element.present? && @element.enabled?
    end

    def hover
      begin
        @element.send(:hover) if @element.present?
      rescue
        # ignore
      end
    end

    def safe_click(*modifiers, count = 1)
      count.to_i.times do
        begin
          @element.send(:click, *modifiers)
        rescue
          # ignore
        end
      end
    end

    def safe_set(*args, count: 1)
      count.to_i.times do
        begin
          @element.send(:set, *args)
        rescue
          # ignore
        end
      end
    end

    def safe_send_keys(*args, count = 1)
      count.to_i.times do
        begin
          @element.send(:send_keys, *args)
        rescue
          # ignore
        end
      end
    end

    def safe_wait_while_present(*args)
      begin
        @element.send(:wait_while_present, *args)
      rescue
        # ignore
      end
    end

    def safe_wait_until_present(*args)
      begin
        @element.send(:wait_until_present, *args)
      rescue
        # ignore
      end
    end

    def text_value
      begin
        text = @element.send(:text)
        return text if text > 0
      rescue
        # ignore
      end

      begin
        value = @element.send(:value)
        return value if value.size > 0
      rescue
        # ignore
      end

      ''
    end

    def method_missing(method, *args, &block)
      super unless @element.respond_to?(method)
      @element.send(method, *args, &block)
    end
  end

  class SdcChooser

    attr_accessor :element, :verify, :attribute, :attribute_value

    def initialize(element, verify, attribute, attribute_value)
      set_instance_variables(binding, *local_variables)
    end

    def chosen?
      result = verify.attribute_value(attribute)
      return result.casecmp('true') == 0 if result.casecmp('true') == 0 || result .casecmp('false') == 0
      result.include?(attribute_value)
    end
    alias_method :checked?, :chosen?
    alias_method :selected?, :chosen?

    def choose(persist = 2)
      persist.times do element.click; break if chosen? end
      chosen?
    end
    alias_method :check, :choose
    alias_method :select, :choose

    def unchoose(persist = 2)
      persist.times do break unless chosen?; element.click end
      chosen?
    end
    alias_method :uncheck, :unchoose
    alias_method :unselect, :unchoose

    def method_missing(method, *args, &block)
      super unless element.respond_to?(method)
      element.send(method, *args, &block)
    end
  end

  module Core
    class Base
      class << self
        attr_accessor :driver
      end
      def initialize(driver)
        self.class.driver = driver
      end

      def driver; self.class.driver; end
    end
  end
end