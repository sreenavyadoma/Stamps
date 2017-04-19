module Stamps
  module Orders
    module MultiOrderDetails
      class MultiOrderDetailsForm < Browser::StampsModal
        attr_reader :ship_from_multi, :weight, :domestic_service, :int_service, :insurance, :tracking, :dimensions, :buttons

        def initialize(param)
          super(param)
          @ship_from_multi = ShipFromAddress.new(param)
          @weight = MultiOrderDetailsWeight.new(param)
          @domesticservice = DomesticService.new(param)
          @intlService = InternationalService.new(param)
          @insurance = DetailsInsureFor.new(param)
          @tracking = MultiOrderDetailsTracking.new(param)
          @dimensions = MultiOrderDetailsDimensions.new(param)
          @buttons = MultiUpdateController.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def present?
          body.present?
        end

        def wait_until_present(*args)
          body.wait_until_present(*args)
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

        public
        def order_count
          expect(order_count_label).to be_present
          StampsElement.new(order_count_label).text.gsub(/\d+/).first.to_i
        end
      end
   end

      class ShipFromAddress < Browser::StampsModal
          attr_reader :drop_down, :text_box, :blur_element

          def initialize(param)
            super(param)
            @text_box = StampsTextbox.new browser.text_field(name: "ShipFrom")
            @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(3)>div>div>div>div[id^=shipfromdroplist][id$=bodyEl]>div>div[id$=picker]")
           # @manage_shipping_adddress = ManageShippingAddresses.new(param)
            @blur_element = BlurOutElement.new(param)
          end

          def blur_out
            blur_element.blur_out
          end

          def select(str)
            return manage_shipping_address if manage_shipping_address.present?
            drop_down.click
            lovs = []
            browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |element, index| lovs[index] = element.text }

            expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"

            selection = StampsElement.new(browser.li(text: /#{str}/))

            if str.downcase.include? "manage shipping"
              15.times do
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return manage_shipping_adddress if manage_shipping_adddress.present?
                expect(manage_shipping_adddress.present?).to be(true), "Manage Shipping Address modal did not come up."
              end
            else
              10.times do
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return if text_box.text.include?(str)
              end
            end
            expect(text_box.text).to include(str), "Unable to select Ship-From selection #{str}"
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

      class DomesticService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
          @blur_element = BlurOutElement.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def select(str)
          logger.info "Select service #{str}"

          sel_arr = str.split(/\s+/)
          substr = (sel_arr.size>=2?"#{sel_arr[0]} #{sel_arr[1]}":"#{sel_arr[0]}")

          selection = StampsElement.new browser.td(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text")

          20.times do
            begin
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
              blur_out
              logger.info "Selected service #{text_box.text} - #{(text_box.text.include? str)?"success": "service not selected"}"
              break if text_box.text.include?(substr)
            rescue
              #ignore
            end
          end
          logger.info "#{text_box.text} service selected."

          # Test if selected service includes abbreviated selection.
          expect(text_box.text).to include(substr)
          text_box.text
        end

        def inline_cost(service_name)
          cost_label = StampsElement.new(browser.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
          10.times do
            begin
              drop_down.click unless cost_label.present?
              if cost_label.present?
                service_cost = helper.remove_dollar_sign(cost_label.text)
                logger.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                drop_down.click if cost_label.present?
                return service_cost.to_f.round(2)
              end
            rescue
              #ignore
            end
          end
        end

        def cost_label
          labels = browser.label(text: "Service:").parent.labels
          cost_element = nil
          labels.each do |label|
            cost_element = label if label.text.include?('.')
          end
          cost_element
        end

        def cost
          helper.remove_dollar_sign(cost_label.text).to_f.round(2)
        end

        def tooltip(selection)
          button = drop_down
          selection_label = StampsElement.new(browser.tr(css: "tr[data-qtip*='#{selection}']"))
          10.times {
            begin
              button.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                tooltip = selection_label.attribute_value("data-qtip")
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def disabled?(service)

          @details_services = data_for(:orders_services, {})

          selection_field = browser.li(id: "#{@details_services[service]}")
          #selection_element = browser.tr css: "tr[data-qtip*='#{service}']"
          selection_label = StampsElement.new selection_field

          10.times do |index|
            drop_down.click unless selection_label.present?
            sleep(0.35)
            if selection_field.present?
              disabled_field = StampsElement.new(selection_field.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep(0.35)
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    drop_down.click
                    return result
                  end
                end
              rescue
                #ignore
              end
            else
              sleep(0.35)
              return true if index == 5 #try to look for service in service selection drop-down 3 times before declaring it's disabled.
            end
          end
        end

        def enabled? service
          !(disabled? service)
        end
      end

      class InternationalService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
          @blur_element = BlurOutElement.new(param)
        end

      end

      class DetailsInsureFor < Browser::StampsModal
        attr_reader :text_box, :increment_trigger, :decrement_trigger, :blur_element, :drop_down

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
          @drop_down = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
          @decrement_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
          @increment_trigger = StampsElement.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
          @blur_element = BlurOutElement.new(param)
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
        attr_reader :update_orders_button, :save_as_present_btn, :updating_orders

        def initialize(param)
          super(param)
          @update_orders_button = StampsElement.new browser.span(text: 'Update Orders')
          @save_as_present_btn = StampsElement.new browser.span(text: 'Save as Preset')
          @updating_orders = StampsElement.new(browser.div(text: "Updating Orders"))
        end

        def present?
          update_orders_button.present?
        end

        def update_Orders
          update_orders_button.click
          update_orders_button.click
          expect(updating_orders).to be_present
          updating_orders.wait_while_present(2.5)
        end

        def Save_as_Preset
          5.times do
            return view_restrictions if view_restrictions.present?
            restrictions_btn.click
          end
          expect(view_restrictions).to be_present
        end
      end



    end
  end
end

