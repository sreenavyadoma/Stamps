module Stamps
  module Orders
    module DetailsFormCommon #todo-ORDERSAUTO-3737

      class DetailsFormDimensions < WebApps::Base


        def initialize(param, form_type)
          super(param)
          @form_type = form_type
        end

        def length # todo-Rob Fix increment & decrement empty locators
          if @length.nil? || !@length.present?
            textbox = driver.text_fields(css: "[class*=sdc-mainpanel-lengthnumberfield]")[(@form_type == :single_order) ? 0 : 1]
            inc_btn = driver.div(css: "")
            dec_btn = driver.div(css: "")
            @length = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)
          end
          @length
        end

        def width
          if @width.nil? || !@width.present?
            textbox = driver.text_field(css: "[class*=sdc-mainpanel-widthnumberfield]")
            inc_btn = driver.div(css: "")
            dec_btn = driver.div(css: "")
            @width = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)
          end
          @width
        end

        def height
          if @height.nil? || !@height.present?
            textbox = driver.text_field(css: "[class*=sdc-mainpanel-heightnumberfield]")
            inc_btn = driver.div(css: "")
            dec_btn = driver.div(css: "")
            @height = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)
          end
          @height
        end

        def present?
          length.present? && width.present? && height.present?
        end
      end

      class ShipFromField < WebApps::Base
        attr_reader :form
        def initialize(param, form)
          super(param)
          @form = form
        end

        def manage_shipping_address
          (cache[:shipping_address].nil? || !cache[:shipping_address].present?) ? cache[:shipping_address] = ShipFrom::ManageShippingAddresses.new(
              param) : cache[:shipping_address]
        end

        def textbox
          (cache[:textbox].nil? || !cache[:textbox].present?) ? cache[:textbox] = StampsTextbox.new(
              (form == :single) ? driver.text_field(css: "[class*=singleorder] [id^=shipfromdroplist-][id$=-trigger-picker]") :
                  driver.text_field(css: "[class*=multiorder] [id^=shipfromdroplist][id$=-inputEl]")) : cache[:textbox]
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsTextbox.new(
              (form == :single) ? driver.div(css: "[class*=single] [id^=shipfromdroplist-][id$=-trigger-picker]") :
                  driver.div(css: "[class*=multiorder] [id^=shipfromdroplist-][id$=-trigger-picker]")) : cache[:dropdown]


          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(driver.div(css: "[class*=multiorder] [id^=shipfromdroplist-][id$=-trigger-picker]")) : cache[:dropdown]
        end

        def select(str)
          return manage_shipping_address if manage_shipping_address.present?
          dropdown.click
          15.times do
            selection1 = (str.downcase.include?('default')) ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']")[0] : driver.lis(text: /#{str}/)[0]
            selection2 = (str.downcase.include?('default')) ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']")[1] : driver.lis(text: /#{str}/)[1]
            selection = StampsField.new((selection1.present?) ? selection1 : selection2)
            dropdown.click unless selection.present?
            selection.scroll_into_view
            selection.click
            sleep(0.35)
            if str.downcase.include?("manage shipping")
              return manage_shipping_address if manage_shipping_address.present?
            else
              return textbox.text if textbox.text.size > 2
            end
          end
          textbox.text
        end
      end

      class DetailsFormShipFrom < WebApps::Base
        attr_reader :form_type

        def initialize(param, form_type)
          super(param)
          @form_type = form_type
        end

        def textbox
          if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox] = StampsTextbox.new(driver.text_fields(name: "ShipFrom")[(form_type == :single_order) ? 0 : 1])
          end
          cache[:textbox]
        end

        def dropdown
          if cache[:dropdown].nil? || !cache[:dropdown].present?
            cache[:dropdown] = StampsTextbox.new(driver.divs(css: "div[id^=shipfromdroplist][id$=trigger-picker]")[(form_type == :single_order) ? 0 : 1])
          end
          cache[:dropdown]
        end

        def select(str)
          dropdown.click
          sleep(0.5)
          window_title = Class.new(WebApps::Base).new(param).extend(Stamps::Orders::ShipFrom::WindowTitle)
          selection = StampsField.new((str.downcase.include?('default')) ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']")[(form_type == :single_order) ? 0 : 1] : driver.lis(text: /#{str}/)[(form_type == :single_order) ? 0 : 1])
          if str.downcase.include?("manage shipping")
            20.times do
              sleep(0.35)
              dropdown.click unless selection.present?
              selection.scroll_into_view.click
              return window_title.window_title.text if window_title.present?
            end

            raise "Failed to open Manage Shipping Addresses modal"
          else
            15.times do
              sleep(0.35)
              dropdown.click unless selection.present?
              selection.scroll_into_view.click
              sleep(0.35)
              return textbox.text if textbox.text.size > 2
            end
          end
          textbox.text
        end
      end

      class DetailsFormService < WebApps::Base
        attr_reader :textbox, :dropdown, :form_type
        def initialize(param, form_type)
          super(param)
          @form_type = form_type
          case form_type
            when :single_order
              @textbox = StampsTextbox.new(driver.text_field(css: "div[id^=singleOrderDetailsForm][id$=targetEl]>div>div>div>div>div>div>div>input[id^=service]"))
              @dropdown = StampsField.new(driver.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
            when :multi_order_dom
              @textbox = StampsTextbox.new(driver.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
              @dropdown = StampsField.new(driver.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
            when :multi_order_int
              @textbox = StampsTextbox.new(driver.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
              @dropdown = StampsField.new(driver.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
            else
              expect([:single_order, :multi_order_dom, :multi_order_int]).to include(form_type)
          end
        end

        def select(str)
          sleep(0.35)
          dropdown.click
          10.times do
            begin
              tds = driver.tds(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text")
              selection = StampsField.new((form_type == :multi_order_int) ? tds.last : tds.first)
              dropdown.click unless selection.present?
              selection.scroll_into_view
              sleep(0.15)
              selection.click
              log.info "Selected service #{textbox.text} - #{(textbox.text.include? str) ? "success" : "service not selected"}"
              sleep(0.15)
              break if textbox.text.include?(str)
            rescue
              # ignore
            end
          end
          textbox.text
        end

        def tooltip(selection)
          button = dropdown
          selection_label = StampsField.new(driver.tr(css: "tr[data-qtip*='#{selection}']"))
          10.times do
            begin
              button.click unless selection_label.present?
              sleep(0.15)
              if selection_label.present?
                tooltip = selection_label.attribute_value("data-qtip")
                log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip if tooltip.include? "<strong>"
              end
            rescue
              # ignore
            end
          end
          blur_out
        end

        def disabled?(service)
          @details_services = data_for(:orders_services, {})
          selection_label = StampsField.new(driver.li(id: "#{@details_services[service]}"))

          10.times do |index|
            dropdown.click unless selection_label.present?
            sleep(0.35)
            if selection_label.present?
              disabled_field = StampsField.new(selection_label.element.parent.parent.parent)
              begin
                if selection_label.present?
                  if disabled_field.present?
                    result = disabled_field.attribute_value("class").include? "disabled"
                    sleep(0.35)
                    result = disabled_field.attribute_value("class").include? "disabled"
                    result = disabled_field.attribute_value("class").include? "disabled"
                    dropdown.click
                    return result
                  end
                end
              rescue
                # ignore
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

        def cost_label
          labels = driver.label(text: "Service:").parent.labels
          cost_field = nil
          labels.each do |label|
            cost_field = label if label.text.include?('.')
          end
          cost_field
        end

        def cost
          cost_label.text.dollar_amount_str.to_f.round(2)
        end

        def inline_cost(service_name)
          cost_label = StampsField.new(driver.td(css: "tr[data-qtip*='#{service_name}']>td:nth-child(3)"))
          10.times do
            begin
              dropdown.click unless cost_label.present?
              if cost_label.present?
                service_cost = cost_label.text.dollar_amount_str
                log.info "Service Cost for \"#{service_name}\" is #{service_cost}"
                dropdown.click if cost_label.present?
                return service_cost.to_f.round(2)
              end
            rescue
              # ignore
            end
          end
        end

      end

      class OrderDetailsWeight < WebApps::Base
        attr_reader :lb, :oz
        def initialize(param, form_type)
          super(param)
          case form_type
            when :single_order
              textbox = driver.text_field(name: 'WeightLbs')
              inc_btn = driver.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=up]")
              dec_btn = driver.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=pounds]>div[class*=down]")
              @lb = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)

              textbox = driver.text_field(name: 'WeightOz')
              inc_btn = driver.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=up]")
              dec_btn = driver.div(css: "div[id^=single]>div>div>div>div[id^=weight]>div>div>div>div>div>div[id*=ounces]>div[class*=down]")
              @oz = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)
            when :multi_order_details
              textbox = driver.text_field(name: 'WeightLbs')
              inc_btn = driver.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=up]")
              dec_btn = driver.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=down]")
              @lb = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)

              textbox = driver.text_field(name: 'WeightOz')
              inc_btn = driver.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=up]")
              dec_btn = driver.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=down]")
              @oz = Stamps::WebApps::StampsNumberField.new(textbox, inc_btn, dec_btn)
            else
              raise "Invalid form type: #{form_type}"
          end
        end
      end
    end
  end
end