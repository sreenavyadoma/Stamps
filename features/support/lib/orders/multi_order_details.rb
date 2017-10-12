module Stamps
  module Orders
    module MultiOrderDetails
      class MultiOrderDetailsForm < Browser::StampsModal
        attr_reader :multi_ship_from, :weight, :multi_dom_service, :multi_int_service, :insurance, :tracking, :dimensions, :buttons

        def initialize(param)
          super
          @multi_ship_from = Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :multi_order_details)
          #@weight = Stamps::Orders::OrderDetailsCommon::OrderDetailsWeight.new(param, :multi_order)
          @multi_dom_service = Stamps::Orders::DetailsFormCommon::DetailsFormService.new(param, :multi_order_dom)
          @multi_int_service = Stamps::Orders::DetailsFormCommon::DetailsFormService.new(param, :multi_order_int)
          # @insurance = MultiDetailsInsureFor.new(param)
          # @tracking = MultiOrderDetailsTracking.new(param)
          # @dimensions = MultiOrderDetailsDimensions.new(param)
          @buttons = MultiUpdateController.new(param)
        end

        def multi_blur_out_element
          @multi_blur_out_element = StampsElement.new(browser.label(text: "Bulk Update:")) if @multi_blur_out_element.nil? || !@multi_blur_out_element.present?
          @multi_blur_out_element
        end

        def blur_out(count=1)
          expect(multi_blur_out_element).to be_present, "Blur out element is not present."
          ((count.nil?)?1:count.to_i).times do
            multi_blur_out_element.double_click
            multi_blur_out_element.flash
            multi_blur_out_element.click
          end
        end

        def present?
          multi_blur_out_element.present?
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        end

        def order_count_label
          browser.ps(css: 'b').last
        end
      end

      class MultiDetailsInsureFor < Browser::StampsModal
        attr_reader :textbox, :increment_trigger, :decrement_trigger, :blur_element, :dropdown

        def initialize(param)
          super(param)
          @textbox = StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
          @dropdown = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
        end

        def text
          textbox.text
        end

        def value
          text.to_f if checked?
          0
        end

        def set(value)
          15.times do
            check
            textbox.set(value)
            sleep(0.25)
            3.times {blur_out}
            return true if text.to_f == value.to_f
          end
          expect(text.to_f).to eql(value.to_f)
        end

        def increment(value)
          value.to_i.times do
            increment_trigger.click
          end
        end

        def decrement(value)
          value.to_i.times do
            decrement_trigger.click
          end
        end
      end

      class MultiOrderDetailsTracking < Browser::StampsModal
        attr_reader :textbox, :dropdown
        def initialize(param)
          super(param)
          @textbox = StampsTextbox.new browser.text_field(name: 'Tracking')
          @dropdown = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
        end

        def present?
          textbox.present?
        end

        def tracking_selection(selection)
          if selection.downcase.include? "usps"
            browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td")
          elsif selection.downcase.include? "signature"
            browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td")
          elsif selection.downcase.include? "none"
            browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td")
          else
            expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
          end
        end

        # todo-rob Details Tracking selection fix
        def select(str)
          expect(dropdown).to be_present
          20.times do
            selection = StampsElement.new(tracking_selection(str).first)
            dropdown.click unless selection.present?
            selection.click
            break if textbox.text.include?(str)
          end
          expect(textbox.text).to include(str)
        end

        def tooltip(selection)
          selection_label = browser.td(text: selection)
          5.times {
            begin
              dropdown.click unless selection_label.present?
              if selection_label.present?
                qtip = selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                logger.info "#{qtip}"
                return qtip
              end
            rescue
              #ignore
            end
          }
        end
      end

      class MultiOrderDetailsDimensions < Browser::StampsModal
        attr_reader :length, :width, :height
        def initialize(param)
          super(param)
          textbox = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Length]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]")
          @length = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Width]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]")
          @width = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)

          textbox = browser.text_field(css: 'div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Height]')
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=down]")
          @height = Stamps::Browser::StampsNumberField.new(textbox, inc_btn, dec_btn)
        end

        def present?
          length.present? && width.present? && height.present?
        end
      end

      class MultiUpdateController < Browser::StampsModal
        attr_reader :update_orders_btn, :save_as_present_btn, :updating_orders

        def initialize(param)
          super(param)
          @update_orders_btn = StampsElement.new browser.span(text: 'Update Orders')
          @save_as_present_btn = StampsElement.new browser.span(text: 'Save as Preset')
          @updating_orders = StampsElement.new(browser.div(text: "Updating Orders"))
        end

        def present?
          update_orders_btn.present?
        end

        def update_orders
          update_orders_btn.click
          sleep(2)
          expect(updating_orders).to be_present
          updating_orders.wait_while_present(5)
        end

        def save_as_present
          5.times do
            return view_restrictions if view_restrictions.present?
            restrictions_btn.click
          end
        end
      end
    end
  end
end



