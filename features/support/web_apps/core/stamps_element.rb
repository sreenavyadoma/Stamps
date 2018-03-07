module Stamps
  module Core
    class StampsElement < PageObject
      attr_accessor :field, :verify_field, :ver_field_attr, :ver_field_attr_value
      def initialize(driver, locator)
        super(driver)
        @field = locator
        self.browser = locator.browser unless locator.browser.nil?
      end
      alias_method :checkbox, :field
      alias_method :radio, :field
      alias_method :textbox, :field
      alias_method :input, :field

      def browser
        if self.class.browser.nil?
          raise ArgumentError, "browser is nil for html field #{field.class}. Set #{self.class.to_s.split('::').last}.browser = browser after creating this object."
        end
        self.class.browser
      end

      def browser=(browser)
        self.class.browser = browser
      end

      def url
        browser.url
      end

      def flash
        field.flash
      end

      def disabled?
        begin
          return field.disabled?
        rescue
          # ignore
        end
        true
      end

      def present?
        begin
          return exist? && visible?
        rescue
          # ignore
        end
        false
      end

      def clickable?
        truthy? && present? && enabled?
      end

      def visible?
        begin
          return field.visible?
        rescue
          # ignore
        end
        false
      end

      def exist?
        begin
          return field.exist?
        rescue
          # ignore
        end
        false
      end

      def enabled?
        begin
          return field.enabled?
        rescue
          # ignore
        end
        false
      end

      def truthy?
        !field.nil? && exist?
      end

      def hover
        begin
          field.hover if present?
        rescue
          # ignore
        end
      end

      def wait_while_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            break unless present?
            sleep(duration)
          end
        rescue
          # ignore
        end
        self
      end

      def wait_until_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            break if present?
            sleep(duration)
          end
        rescue
          # ignore
        end
        self
      end

      def scroll_into_view
        begin
          browser.execute_script('arguments[0].scrollIntoView();', field)
        rescue
          # ignore
        end
        self
      end

      def text
        begin
          return field.text if truthy? && !field.text.nil? && field.text.size > 0
        rescue
          # ignore
        end

        begin
          return field.value if truthy? && !field.value.nil? && field.value.size > 0
        rescue
          # ignore
        end

        begin
          return attribute_value('value') if truthy? && !attribute_value('value').nil? && attribute_value('value').size > 0
        rescue
          # ignore
        end
        ''
      end

      def attribute_value(attribute)
        begin
          return field.attribute_value(attribute)
        rescue
          # ignore
        end
        ''
      end

      def click(ctr = 1)
        begin
          ctr.to_i.times do
            field.click if clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def click_while_present(counter = 2, duration = 0.25)
        begin
          counter.to_i.times do
            click
            sleep(duration)
            break unless clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def double_click(ctr = 1)
        begin
          ctr.to_i.times do
            field.double_click if clickable?
          end
        rescue
          # ignore
        end
        self
      end

      def blur_out(ctr = 1)
        begin
          ctr.to_i.times do
            flash
            double_click
            click
          end
        rescue
          # ignore
        end
        self
      end

      def set_attribute_value(attribute_name, value)
        browser.execute_script("return arguments[0].#{attribute_name}='#{value}'", field) if present?
      end

      def data_error
        attribute_value('data-errorqtip')
      end

      def style(property)
        field.style(property)
      end
      def fire_event(event)
        field.fire_event(event)
      end

      def stamps_disabled?(attrib = nil, attrib_val = nil)
        verify_field.attribute_value(attrib.nil? ? ver_field_attr : attrib).include?(attrib_val.nil? ? ver_field_attr_value : attrib_val)
      end
    end
  end
end