module Stamps
  module Orders
    module BulkUpdate
      module Toolbar
      end

      module PresetMenu
      end

      module Fields
        class Dimensions < Browser::BaseCache
          assign({})
          def cache
            self.class.cache
          end

          def present?
            length.present? && width.present? && height.present? && checkbox.present?
          end

          def length
            (cache[:length].nil?||!cache[:length].present?)?cache[:length]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=Length]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=down]")):cache[:length]
          end

          def width
            (cache[:width].nil?||!cache[:width].present?)?cache[:width]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=Width]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=down]")):cache[:width]
          end

          def height
            (cache[:height].nil?||!cache[:height].present?)?cache[:height]=StampsNumberField.new(
                browser.text_field(css: '[class*=mult] [name=Height]'),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=down]")):cache[:height]
          end

          def checkbox
            (cache[:checkbox].nil?||!cache[:checkbox].present?)?cache[:checkbox]=StampsCheckbox.new(
                browser.input(css: "[class*=mult] [class*=dimension-row] [role=checkbox]"),
                browser.div(css: "[class*=mult] [class*=dimension-row] [class*=x-form-type-checkbox]"),
                "class",
                "checked"):cache[:checkbox]
          end
        end

        class Weight < Browser::BaseCache
          assign({})
          def cache
            self.class.cache
          end

          def present?
            lbs.present? && oz.present? && checkbox.present?
          end

          def lbs
            (cache[:lbs].nil?||!cache[:lbs].present?)?cache[:lbs]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=WeightLbs]"),
                browser.div(css: "[class*=mult] [class*=pounds] [class*=up]"),
                browser.div(css: "[class*=mult] [class*=pounds] [class*=down]")):cache[:lbs]
          end

          def oz
            (cache[:oz].nil?||!cache[:oz].present?)?cache[:oz]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=WeightOz]"),
                browser.div(css: "[class*=mult] [class*=ounces] [class*=up]"),
                browser.div(css: "[class*=mult] [class*=ounces] [class*=down]")):cache[:oz]
          end

          def checkbox
            (cache[:checkbox].nil?||!cache[:checkbox].present?)?cache[:checkbox]=StampsCheckbox.new(
                browser.input(css: "[class*=mult] [class*=weight-row]>div>div>div[class*=x-form-item] input"),
                browser.div(css: "[class*=mult] [class*=weight-row]>div>div>div[class*=x-form-item]"),
                "class",
                "checked"):cache[:checkbox]
          end
        end

        class ShipFrom < Browser::FloatingBoundList
          attr_reader :form_type
          def initialize(param, form_type)
            super(param)
            @form_type=form_type
          end

          def manage_shipping_address
            (cache[:manage_shipping_address].nil?||!cache[:manage_shipping_address].present?)?cache[:manage_shipping_address]=Orders::ShipFrom::ManageShippingAddresses.new(
                param):cache[:manage_shipping_address]
          end

          def textbox
            (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(
                browser.text_field(css: "[class*=multi] [componentid^=ship]")):cache[:textbox]
          end

          def dropdown
            (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsTextbox.new(
                browser.div(css: "[class*=multi] [id^=ship][id$=picker]")):cache[:dropdown]
          end

          def select(str)
            blah unless get(:order_details) && get(:bulk_update)
            # 1.If lov is nil, set lov[bulk:]=1
            # 2. if lov is not nil and lov does not contain bulk key and single key exist with value 1, then set bulk key to 2 ()i.e lov[bulk:]=lov[single:]+1), else lov[bulk:]


            return manage_shipping_address if manage_shipping_address.present?
            dropdown.click
            sleep(0.5)
            selection=StampsField.new((str.downcase.include?('default'))?browser.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']")[(form_type==:single_order)?0:1]:browser.lis(text: /#{str}/)[(form_type==:single_order)?0:1])
            if str.downcase.include?("manage shipping")
              15.times do
                sleep(0.35)
                dropdown.click unless selection.present?
                selection.scroll_into_view
                selection.click
                return manage_shipping_address if manage_shipping_address.present?
                expect(manage_shipping_address).to be_present, "Manage Shipping Address modal is not present!"
              end
            else
              15.times do
                sleep(0.35)
                dropdown.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return textbox.text if textbox.text.size > 2
              end
            end
            textbox.text
          end
        end

        class Base < Browser::FloatingBoundList
          BULK_UPDATE=:bulk_update
          ORDER_DETAILS=:single_order
          def selection_field(form, str)
            browser.tds(css "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")[get(form)]
          end

          def lov_count(str)
            browser.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text").size
          end
        end

        class Service < Base
          assign({})
          def cache
            self.class.cache
          end

          def textbox
            (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(
                browser.text_field(css: "[class*=domestic-service-row] [name=service]")):cache[:textbox]
          end

          def dropdown
            (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsField.new(
                browser.div(css: "[class*=domestic] [id$=trigger-picker]")):cache[:dropdown]
          end

          def select(str)
            dropdown.click
            set(BULK_UPDATE, 0) if get(BULK_UPDATE).nil? && get(ORDER_DETAILS).nil? # first time drop-down is clicked
            set(BULK_UPDATE, values.max+1) if get(BULK_UPDATE).nil? && !get(ORDER_DETAILS).nil? && lov_count(str)==1 # order details form services had been clicked, first time for bulk update
            selection = selection_field(BULK_UPDATE, str)
            10.times do
              begin
                dropdown.click unless selection.present?
                selection.scroll_into_view
                sleep(0.2)
                selection.click
                sleep(0.15)
                break if textbox.text.include?(str)
              rescue
                #ignore
              end
            end
            textbox.text
          end

          def tooltip(selection)
            button=dropdown
            selection_label=StampsField.new(browser.tr(css: "tr[data-qtip*='#{selection}']"))
            10.times do
              begin
                button.click unless selection_label.present?
                sleep(0.15)
                if selection_label.present?
                  tooltip=selection_label.attribute_value("data-qtip")
                  logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                  return tooltip if tooltip.include? "<strong>"
                end
              rescue
                #ignore
              end
            end
            blur_out
          end

          def disabled?(service)
            @details_services=data_for(:orders_services, {})
            selection_label=StampsField.new(browser.li(id: "#{@details_services[service]}"))

            10.times do |index|
              dropdown.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                disabled_field=StampsField.new(selection_label.element.parent.parent.parent)
                begin
                  if selection_label.present?
                    if disabled_field.present?
                      result=disabled_field.attribute_value("class").include? "disabled"
                      sleep(0.35)
                      result=disabled_field.attribute_value("class").include? "disabled"
                      result=disabled_field.attribute_value("class").include? "disabled"
                      dropdown.click
                      return result
                    end
                  end
                rescue
                  #ignore
                end
              else
                sleep(0.35)
                return true if index==5 #try to look for service in service selection drop-down 3 times before declaring it's disabled.
              end
            end
          end

          def enabled? service
            !(disabled? service)
          end
        end





# REWORK -----------------------------------------------
        class DomesticService < Browser::BaseCache
          assign({})
          attr_reader :textbox, :dropdown, :form_type
          def initialize(param, form_type)
            super(param)
            @form_type=form_type
            case form_type
              when :single_order
                @textbox=StampsTextbox.new(browser.text_field(css: "div[id^=singleOrderDetailsForm][id$=targetEl]>div>div>div>div>div>div>div>input[id^=service]"))
                @dropdown=StampsField.new(browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
              when :multi_order_dom
                @textbox=StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
                @dropdown=StampsField.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(5)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
              when :multi_order_int
                @textbox=StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=intlService]"))
                @dropdown=StampsField.new(browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(6)>div>div>div>div[id^=servicedroplist][id$=bodyEl]>div>div[id$=picker]"))
              else
                expect([:single_order, :multi_order_dom, :multi_order_int]).to include(form_type)
            end
          end

          def cache
            self.class.cache
          end

          def textbox
            (cache[:textbox].nil?||!cache[:textbox].present?)?cache[:textbox]=StampsTextbox.new(
                browser.text_field(css: "[class*=mult] [name=service]")):cache[:textbox]
          end

          def dropdown
            (cache[:dropdown].nil?||!cache[:dropdown].present?)?cache[:dropdown]=StampsTextbox.new(
                browser.div(css: "[class*=mult] [class*=domestic] [id^=servicedroplist][id$=trigger-picker]")):cache[:dropdown]
          end

          def select(str)
            dropdown.click
            10.times do
              begin
                tds=browser.tds(css: "li##{data_for(:orders_services, {})[str]}>table>tbody>tr>td.x-boundlist-item-text")
                selection=StampsField.new((form_type==:multi_order_int)?tds.last : tds.first)
                dropdown.click unless selection.present?
                selection.scroll_into_view
                sleep(0.15)
                selection.click
                logger.info "Selected service #{textbox.text} - #{(textbox.text.include? str)?"success": "service not selected"}"
                sleep(0.15)
                break if textbox.text.include?(str)
              rescue
                #ignore
              end
            end
            expect(textbox.text).to include(str)
            textbox.text
          end

          def tooltip(selection)
            button=dropdown
            selection_label=StampsField.new(browser.tr(css: "tr[data-qtip*='#{selection}']"))
            10.times do
              begin
                button.click unless selection_label.present?
                sleep(0.15)
                if selection_label.present?
                  tooltip=selection_label.attribute_value("data-qtip")
                  logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                  return tooltip if tooltip.include? "<strong>"
                end
              rescue
                #ignore
              end
            end
            blur_out
          end

          def disabled?(service)
            @details_services=data_for(:orders_services, {})
            selection_label=StampsField.new(browser.li(id: "#{@details_services[service]}"))

            10.times do |index|
              dropdown.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                disabled_field=StampsField.new(selection_label.element.parent.parent.parent)
                begin
                  if selection_label.present?
                    if disabled_field.present?
                      result=disabled_field.attribute_value("class").include? "disabled"
                      sleep(0.35)
                      result=disabled_field.attribute_value("class").include? "disabled"
                      result=disabled_field.attribute_value("class").include? "disabled"
                      dropdown.click
                      return result
                    end
                  end
                rescue
                  #ignore
                end
              else
                sleep(0.35)
                return true if index==5 #try to look for service in service selection drop-down 3 times before declaring it's disabled.
              end
            end
          end

          def enabled?(service)
            !(disabled? service)
          end
        end

        class InsureForField < Browser::BaseCache
          assign({})
          attr_reader :textbox, :increment_trigger, :decrement_trigger, :blur_field, :dropdown
          def initialize(param)
            super(param)
            @textbox=StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
            @dropdown=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
            @decrement_trigger=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
            @increment_trigger=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
          end

          def cache
            self.class.cache
          end

          def text
            textbox.text
          end

          def value
            return text.to_f if checked?
            0
          end

          def set(value)
            15.times do
              check
              textbox.set(value)
              sleep(0.25)
              3.times {blur_out}
              return true if text.to_f==value.to_f
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

        class MultiOrderDetailsTracking < Browser::BaseCache
          assign({})
          attr_reader :textbox, :dropdown
          def initialize(param)
            super(param)
            @textbox=StampsTextbox.new browser.text_field(name: 'Tracking')
            @dropdown=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          end

          def cache
            self.class.cache
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
              selection=StampsField.new(tracking_selection(str).first)
              dropdown.click unless selection.present?
              selection.click
              break if textbox.text.include?(str)
            end
            expect(textbox.text).to include(str)
          end

          def tooltip(selection)
            selection_label=browser.td(text: selection)
            5.times {
              begin
                dropdown.click unless selection_label.present?
                if selection_label.present?
                  qtip=selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                  logger.info "#{qtip}"
                  return qtip
                end
              rescue
                #ignore
              end
            }
          end
        end

        class MultiUpdateController < Browser::BaseCache
          assign({})
          attr_reader :update_orders_btn, :save_as_present_btn, :updating_orders

          def initialize(param)
            super(param)
            @update_orders_btn=StampsField.new browser.span(text: 'Update Orders')
            @save_as_present_btn=StampsField.new browser.span(text: 'Save as Preset')
            @updating_orders=StampsField.new(browser.div(text: "Updating Orders"))
          end

          def cache
            self.class.cache
          end

          def present?
            update_orders_btn.present?
          end

          def update_orders
            update_orders_btn.click
            sleep(2)
            updating_orders.wait_while_present(5)
            #expect(updating_orders).to be_present
          end

          def save_as_present
            5.times do
              return view_restrictions if view_restrictions.present?
              restrictions_btn.click
            end
          end
        end

      end

      class Form < Browser::BaseCache
        include Toolbar
        include PresetMenu
        assign({})

        def cache
          self.class.cache
        end

        def buttons
          @buttons=MultiUpdateController.new(param)
          #(cache[:multi_order].nil?||!cache[:multi_order].present?)?cache[:multi_order]=Orders::MultiOrderDetails::BulkUpdateForm.new(param):cache[:multi_order]
        end

        def blur_out_field
          (cache[:blur_out].nil?||!cache[:blur_out].present?)?cache[:blur_out]=StampsField.new(browser.label(text: "Bulk Update:")):cache[:blur_out]
        end

        def blur_out(count=1)
          ((count.nil?)?1:count.to_i).times do
            blur_out_field.double_click
            blur_out_field.click
          end
        end

        def present?
          blur_out_field.present?
        end

        def ship_from
          @multi_ship_from=Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :multi_order_details)
        end

        def domestic_service
          @multi_dom_service=Fields::Service.new(param)
        end

        def international_service
          @multi_int_service=Stamps::Orders::DetailsFormCommon::DetailsFormService.new(param, :multi_order_int)
        end

        # done
        def update_orders
          (cache[:weight].nil?||!cache[:weight].present?)?cache[:weight]=Fields::Weight.new(param):cache[:weight]
        end

        def weight
          (cache[:weight].nil?||!cache[:weight].present?)?cache[:weight]=Fields::Weight.new(param):cache[:weight]
        end

        def dimensions
          (cache[:dimensions].nil?||!cache[:dimensions].present?)?cache[:dimensions]=Fields::Dimensions.new(param):cache[:dimensions]
        end
      end
    end
  end
end



