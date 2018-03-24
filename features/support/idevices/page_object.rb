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
          if page.page_verifiable?
            begin
              page.wait_until(&:on_page?)
            rescue Watir::Wait::TimeoutError
              raise Selenium::WebDriver::Error::WebDriverError,
                    "Expected to be on #{page.class}, but something went wrong. Check your test."
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

    def model_to_hash(model)
      return model unless model.is_a? WatirModel
      hash = model.to_hash
      matching_aliases = self.class.element_list & model.aliases.keys
      matching_aliases.each do |key|
        hash[key] = hash.delete(model.aliases[key])
      end
      hash
    end

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

    def present?
      @element.present? && @element.exist?
    end

    def text_value
      begin
        return @element.text if @element.text.size > 0
      rescue
        # ignore
      end

      begin
        return @element.value if @element.value.size > 0
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

  class TestPage < PageObject

    element(:first_name) { SdcElement.new(browser.text_field(id: 'new_user_first_name')) }
    element(:last_name) { SdcElement.new(browser.text_field(id: 'new_user_last_name')) }
    element(:email_address) { SdcElement.new(browser.text_field(id: 'new_user_email')) }
    element(:email_address_confirm)  { SdcElement.new(browser.text_field(id: 'new_user_email_confirm')) }
    element(:country) { SdcElement.new(browser.select(id: 'new_user_country'))}
    element(:occupation) { SdcElement.new(browser.text_field(id: 'new_user_occupation')) }
    element(:submit) { SdcElement.new(browser.button(id: 'new_user_submit')) }

    element(:cars) { SdcElement.new(browser.checkbox(id: 'new_user_interests_cars'))}
    element(:div_index) { |indx| SdcElement.new(browser.div(index: indx)) }
    element(:first_element) { SdcElement.new(browser.div) }
    elements(:all_elements) { browser.divs }
    element(:first_sub_element) { div_index(1).div }
    elements(:all_sub_elements) { div_index(1).divs }

    page_url { 'http://watir.com/examples/forms_with_input_elements.html' }

  end


  class ResultPage < PageObject

    element(:message) { browser.div(id: 'messages').div(index: -1) }

    def success?
      message.text == 'submit'
    end
  end
end