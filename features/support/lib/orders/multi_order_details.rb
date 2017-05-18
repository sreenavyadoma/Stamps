module Stamps
  module Orders
    module MultiOrderDetails
      class MultiOrderDetailsForm < Browser::StampsModal
        attr_reader :ship_from_multi, :weight, :domestic_service, :int_service, :insurance, :tracking, :dimensions, :buttons, :manage_shipping_add, :add_shipping_add, :delete_shipping_add

        def initialize(param)
          super
          @ship_from_multi = Stamps::Orders::OrderDetailsCommon::ShipFromAddress.new(param, :multi_order)
           #@weight = MultiOrderDetailsWeight.new(param)
          @domestic_service = Stamps::Orders::OrderDetailsCommon::Service.new(param, :multi_order)
          # @int_service = MultiInternationalService.new(param)
          # @insurance = MultiDetailsInsureFor.new(param)
          # @tracking = MultiOrderDetailsTracking.new(param)
          # @dimensions = MultiOrderDetailsDimensions.new(param)
          @buttons = MultiUpdateController.new(param)
        end

        def present
          ship_from_multi.present?
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        private
        def order_count_label
          browser.ps(css: 'b').last
        end
      end
   end

      class MultiOrderDetailsWeight < Browser::StampsModal
        attr_reader :lb, :oz
        def initialize(param)
          super(param)
          text_box = browser.text_field(name: 'WeightLbs')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=down]")
          @lb = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: 'WeightOz')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=down]")
          @oz = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
        end
      end

      class MultiInternationalService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextBox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
          @blur_element = BlurOutElement.new(param)
        end

      end

      class MultiDetailsInsureFor < Browser::StampsModal
        attr_reader :text_box, :increment_trigger, :decrement_trigger, :blur_element, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
          @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
          @blur_element = BlurOutElement.new(param) # This blur out element is for single order details form. Must create a blur out element for multi order details
        end

        def text
          text_box.text
        end

        def value
          text.to_f if checked?
          0
        end

        def blur_out
          blur_element.blur_out
        end

        def set(value)
          15.times do
            check
            text_box.set(value)
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
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(name: 'Tracking')
          @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          @blur_element = BlurOutElement.new(param)
        end

        def present?
          text_box.present?
        end

        def blur_out
          blur_element.blur_out
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
          expect(drop_down).to be_present
          20.times do
            selection = StampsElement.new(tracking_selection(str).first)
            drop_down.click unless selection.present?
            selection.click
            break if text_box.text.include?(str)
          end
          expect(text_box.text).to include(str)
        end

        def tooltip(selection)
          selection_label = browser.td(text: selection)
          5.times {
            begin
              drop_down.click unless selection_label.present?
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
          text_box = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Length]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(1)>div>div>div[id*=spinner]>div[class*=down]")
          @length = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Width]")
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div[id^=dimensionsview]>div>div:nth-child(3)>div>div>div[id*=spinner]>div[class*=down]")
          @width = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(css: 'div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div>div>div>div>input[name=Height]')
          inc_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div[id^=dimensionsview]>div>div>div[id^=numberfield]:nth-child(5)>div>div>div>div[class*=down]")
          @height = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
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

      class BlurOutElement < Browser::StampsModal
        attr_reader :element

        def initialize(param)
          super(param)
          @element= StampsElement.new browser.label(text: 'Insurance')
        end

        def blur_out
          2.times do
            element.click
            element.double_click
            element.click
          end
        end
      end

    end
  end
end