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

        define_method("#{name}=") do |val|
          watir_element = self.instance_exec &block
          case watir_element
            when Watir::Radio
              watir_element.set if val
            when Watir::CheckBox
              val ? watir_element.set : watir_element.clear
            when Watir::Select
              watir_element.select val
            when Watir::Button
              watir_element.click
            when Watir::TextField, Watir::TextArea
              watir_element.set val if val
            else
              watir_element.click if val
          end
        end
=begin
=end

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

      def browser=(browser_input)
        @@browser = browser_input
      end

      def browser
        @@browser
      end

    end

    attr_reader :browser

    def initialize(browser_input = @@browser)
      @browser = browser_input
    end

    def submit_form(model)
      fill_form(model)
      submit.click
    end

    def fill_form(model)
      intersect = case model
                    when OpenStruct
                      self.class.element_list & model.to_h.keys
                    when Hash
                      self.class.element_list & model.keys
                    else
                      model = model_to_hash(model)
                      self.class.element_list & model.keys.reject { |el| model[el].nil? }
                  end
      intersect.each do |val|
        self.send("#{val}=", model[val])
      end
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
      if @browser.respond_to?(method) && method != :page_url
        @browser.send(method, *args, &block)
      else
        super
      end
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
      element.present? && @element.exist?
    end

    def method_missing(method, *args, &block)
      super unless element.respond_to?(method)
      element.send(method, *args, &block)
    end

    private
    :element
  end

  class SdcElement2
    def initialize(browser)
      @browser = browser
    end

    def method_missing(method, *args, &block)
      super unless browser.respond_to?(method)
      browser.send(method, *args, &block)
    end
    private
    :browser
  end

  class TestPage < PageObject

    element(:first_name) { SdcElement.new(browser.text_field(id: 'new_user_first_name')) }
    element(:last_name) { browser.text_field(id: 'new_user_last_name') }
    element(:email_address) { browser.text_field(id: 'new_user_email') }
    element(:email_address_confirm)  { browser.text_field(id: 'new_user_email_confirm') }
    element(:country) { browser.select(id: 'new_user_country')}
    element(:occupation) { browser.text_field(id: 'new_user_occupation') }
    element(:submit) { browser.button(id: 'new_user_submit') }

    element(:cars) { browser.checkbox(id: 'new_user_interests_cars')}
    element(:div_index) { |indx| browser.div(index: indx) }
    element(:first_element) { browser.div }
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