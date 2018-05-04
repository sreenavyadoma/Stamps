module Stamps
  module Orders
    module BulkUpdate
      module Toolbar
      end

      module PresetMenu
      end

      module BulkUpdateFields
        # class ShipFrom < WebApps::Base
        #   attr_reader :form_type
        #   def initialize(param, form_type)
        #     super(param)
        #     @form_type = form_type
        #   end
        #
        #   def manage_shipping_address
        #     if cache[:shipping_address].nil? || !cache[:shipping_address].present?
        #       cache[:shipping_address] = Orders::ShipFrom::ManageShippingAddresses.new(param)
        #     else
        #       cache[:shipping_address]
        #     end
        #   end
        #
        #   def textbox
        #     if cache[:textbox].nil? || !cache[:textbox].present?
        #       cache[:textbox] = StampsTextbox.new(driver.text_field(css: '[class*=multi] [componentid^=ship]'))
        #     else
        #       cache[:textbox]
        #     end
        #   end
        #
        #   def dropdown
        #     cache[:dropdown].nil? || !cache[:dropdown].present? ? cache[:dropdown] = StampsTextbox.new(
        #         driver.div(css: '[class*=multi] [id^=ship][id$=picker]')) : cache[:dropdown]
        #   end
        #
        #   def select(str)
        #     blah unless get(:order_details) && get(:bulk_update)
        #     # 1.If lov is nil, set lov[bulk:]=1
        #     # 2. if lov is not nil and lov does not contain bulk key and single key exist with value 1, then set bulk key to 2 ()i.e lov[bulk:]=lov[single:]+1), else lov[bulk:]
        #
        #
        #     return manage_shipping_address if manage_shipping_address.present?
        #     dropdown.click
        #     sleep(0.5)
        #     selection = StampsField.new(str.downcase.include?('default') ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']")[form_type == :single_order ? 0 : 1] : driver.lis(visible_text: str)[form_type == :single_order ? 0 : 1])
        #     if str.downcase.include?('manage shipping')
        #       15.times do
        #         sleep(0.35)
        #         dropdown.click unless selection.present?
        #         selection.scroll_into_view
        #         selection.click
        #         return manage_shipping_address if manage_shipping_address.present?
        #         expect(manage_shipping_address).to be_present, 'Manage Shipping Address modal is not present!'
        #       end
        #     else
        #       15.times do
        #         sleep(0.35)
        #         dropdown.click unless selection.present?
        #         selection.scroll_into_view
        #         selection.click
        #         sleep(0.35)
        #         return textbox.text if textbox.text.size > 2
        #       end
        #     end
        #     textbox.text
        #   end
        # end

        class Dimensions < WebApps::Base
          

          def present?
            length.present? && width.present? && height.present? && checkbox.present?
          end

          def length
            cache[:length].nil? || !cache[:length].present? ? cache[:length] = StampsNumberField.new(
                driver.text_field(css: '[class*=mult] [name=Length]'),
                driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=up]'),
                driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=down]')) : cache[:length]
          end

          def width
            cache[:width].nil? || !cache[:width].present? ? cache[:width] = StampsNumberField.new(
                driver.text_field(css: '[class*=mult] [name=Width]'),
                driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=up]'),
                driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=down]')) : cache[:width]
          end

          def height
            cache[:height].nil? || !cache[:height].present? ? cache[:height] = StampsNumberField.new(driver.text_field(css: '[class*=mult] [name=Height]'), driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=up]'),
                driver.div(css: '[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=down]')) : cache[:height]
          end

          def checkbox
            cache[:checkbox].nil? || !cache[:checkbox].present? ? cache[:checkbox] = StampsCheckbox.new(
                driver.input(css: '[class*=mult] [class*=dimension-row] [role=checkbox]'),
                driver.div(css: '[class*=mult] [class*=dimension-row] [class*=x-form-type-checkbox]'),
                'class',
                'checked') : cache[:checkbox]
          end
        end

        class Weight < WebApps::Base
          def present?
            lbs.present? && oz.present? && checkbox.present?
          end

          def lbs
            cache[:lbs].nil? || !cache[:lbs].present? ? cache[:lbs] = StampsNumberField.new(
                driver.text_field(css: '[class*=mult] [name=WeightLbs]'),
                driver.div(css: '[class*=mult] [class*=pounds] [class*=up]'),
                driver.div(css: '[class*=mult] [class*=pounds] [class*=down]')) : cache[:lbs]
          end

          def oz
            cache[:oz].nil? || !cache[:oz].present? ? cache[:oz] = StampsNumberField.new(
                driver.text_field(css: '[class*=mult] [name=WeightOz]'),
                driver.div(css: '[class*=mult] [class*=ounces] [class*=up]'),
                driver.div(css: '[class*=mult] [class*=ounces] [class*=down]')) : cache[:oz]
          end

          def checkbox
            cache[:checkbox].nil? || !cache[:checkbox].present? ? cache[:checkbox] = StampsCheckbox.new(
                driver.input(css: '[class*=mult] [class*=weight-row]>div>div>div[class*=x-form-item] input'),
                driver.div(css: '[class*=mult] [class*=weight-row]>div>div>div[class*=x-form-item]'),
                'class',
                'checked') : cache[:checkbox]
          end

          def weigh
            @weigh ||= StampsField.new(driver.span(css: '[class*=mult] div[id^=weightview] a>span[id$=btnWrap][class*=secondary]'))
          end
        end

        class DomesticService < WebApps::Base
          
          def textbox
            cache[:textbox] = StampsTextbox.new(driver.text_field(css: '[class*=domestic-service-row] [name=service]')) if cache[:textbox].nil? || !cache[:textbox].present?
            cache[:textbox]
          end

          def dropdown
            cache[:dropdown] = StampsField.new(driver.div(css: '[class*=domestic] [id$=trigger-picker]')) if cache[:dropdown].nil? || !cache[:dropdown].present?
            cache[:dropdown]
          end

          def selection(str)
            lov = driver.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")
            if lov.size == 1 # return first one
              return lov[0]
            elsif lov.size == 2
              10.times do
                dropdown.scroll_into_view.click unless lov[0].present? || lov[1].present?
                return lov[0] if lov[0].present?
                return lov[1] if lov[1].present?
              end
            end

            raise ArgumentError, "Unable to create selection field for #{str}. Maximum of 2 floating service list of values expected."
          end

          def select(str)
            dropdown.click
            10.times do
              begin
                break if textbox.text.include?(str)
                field = StampsField.new(selection(str))
                dropdown.scroll_into_view.click unless field.present?
                field.scroll_into_view.click
              rescue
                # ignore
              end
            end
            textbox.text
          end

          def tooltip(selection)
            raise 'Not Implemented'
#             selection_label=StampsField.new(driver.tr(css: "tr[data-qtip*='#{selection}']"))
#             10.times do
#               begin
#                 dropdown.click unless selection_label.present?
#                 sleep(0.15)
#                 if selection_label.present?
#                   tooltip=selection_label.attribute_value("data-qtip")
#                   log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
#                   return tooltip if tooltip.include? "<strong>"
#                 end
#               rescue
#                 # ignore
#               end
#             end
#             blur_out
          end

          def disabled?(service)
            @details_services = data_for(:orders_services, {})
            selection_label = StampsField.new(driver.li(id: @details_services[service].to_s))

            10.times do |index|
              dropdown.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                disabled_field = StampsField.new(selection_label.element.parent.parent.parent)
                begin
                  if selection_label.present?
                    if disabled_field.present?
                      result = disabled_field.attribute_value('class').include? 'disabled'
                      sleep(0.35)
                      result = disabled_field.attribute_value('class').include? 'disabled'
                      result = disabled_field.attribute_value('class').include? 'disabled'
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

          def enabled?(service)
            !(disabled? service)
          end
        end

        class IntlService < WebApps::Base
          
          def textbox
            cache[:box] = StampsTextbox.new(driver.text_field(css: '[name=intlService]')) if cache[:box].nil? || !cache[:box].present?
            cache[:box]
          end

          def dropdown
            cache[:dd] = StampsField.new(driver.div(css: '[class*=intl] [id$=picker]')) if cache[:dd].nil? || !cache[:dd].present?
            cache[:dd]
          end

          def selection(str)
            lov = driver.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")
            if lov.size == 1 # return first one
              return lov[0]
            elsif lov.size == 2
              10.times do
                dropdown.scroll_into_view.click unless lov[0].present? || lov[1].present?
                return lov[0] if lov[0].present?
                return lov[1] if lov[1].present?
              end
            end

            raise ArgumentError, "Unable to create selection field for #{str}. Maximum of 2 floating service list of values expected."
          end

          def select(str)
            dropdown.click
            10.times do
              begin
                break if textbox.text.include?(str)
                field = StampsField.new(selection(str))
                dropdown.click unless field.present?
                field.scroll_into_view.click
              rescue
                # ignore
              end
            end
            textbox.text
          end

          def tooltip(selection)
            raise 'Service tooltip is not implemented!'
#             selection_label=StampsField.new(driver.tr(css: "tr[data-qtip*='#{selection}']"))
#             10.times do
#               begin
#                 dropdown.click unless selection_label.present?
#                 sleep(0.15)
#                 if selection_label.present?
#                   tooltip=selection_label.attribute_value("data-qtip")
#                   log.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
#                   return tooltip if tooltip.include? "<strong>"
#                 end
#               rescue
#                 # ignore
#               end
#             end
#             blur_out
          end

          def disabled?(service)
            @details_services = data_for(:orders_services, {})
            selection_label = StampsField.new(driver.li(id: @details_services[service].to_s))

            10.times do |index|
              dropdown.click unless selection_label.present?
              sleep(0.35)
              if selection_label.present?
                disabled_field = StampsField.new(selection_label.element.parent.parent.parent)
                begin
                  if selection_label.present?
                    if disabled_field.present?
                      result = disabled_field.attribute_value('class').include? 'disabled'
                      sleep(0.35)
                      result = disabled_field.attribute_value('class').include? 'disabled'
                      result = disabled_field.attribute_value('class').include? 'disabled'
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

          def enabled?(service)
            !(disabled? service)
          end
        end

        #todo - not in use delete?
        class IntServiceTwo < WebApps::Base
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
                      result = disabled_field.attribute_value('class').include? "disabled"
                      sleep(0.35)
                      result = disabled_field.attribute_value('class').include? "disabled"
                      result = disabled_field.attribute_value('class').include? "disabled"
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

        class ShipFrom < WebApps::Base
          def textbox
            if cache[:textbox].nil? || !cache[:textbox].present?
              cache[:textbox] = StampsTextbox.new(driver.text_fields(name: "ShipFrom").last)
            end
            cache[:textbox]
          end

          def dropdown
            if cache[:dropdown].nil? || !cache[:dropdown].present?
              cache[:dropdown] = StampsTextbox.new(driver.divs(css: "div[id^=shipfromdroplist][id$=trigger-picker]").last)
            end
            cache[:dropdown]
          end

          def select(str)
            dropdown.click
            sleep(0.5)
            window_title = Object.const_get('WebApps::Base').new(param).extend(Stamps::Orders::ShipFrom::WindowTitle)
            selection = StampsField.new((str.downcase.include?('default')) ? driver.lis(css: "[class*='x-boundlist-item-over'][data-recordindex='0']").last : driver.lis(visible_text: /#{str}/).last)
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

          def checkbox
            @checkbox ||= StampsCheckbox.new(
                driver.input(css: '[class*=mult] [class*=shipfrom-row]>div>div>div[class*=x-form-item] input[type=button]'),
                driver.div(css: '[class*=mult] [class*=shipfrom-row]>div>div>div[class*=checkbox]'),
                'class',
                'checked')
          end
        end

        class Insurance < WebApps::Base

          attr_reader :textbox, :dropdown
          def initialize(param)
            super(param)
            # @textbox ||= StampsTextbox.new driver.text_field(name: 'Insurance')
            @textbox ||= StampsTextbox.new driver.input(css: 'div[id^=multiOrderDetailsForm-] div[id^=combo-][id$=triggerWrap] input')
            @dropdown ||= StampsField.new driver.div(css: 'div[id^=multiOrderDetailsForm-] div[id^=combo-][id$=trigger-picker]')
          end

          def present?
            textbox.present?
          end

          def insurance_selection(selection)
            if selection.downcase.include? 'none'
              driver.tds(visible_text: 'None')
            elsif selection.downcase.include? 'stamps'
              driver.tds(visible_text: 'Stamps.com Insurance')
            else
              expect("#{selection} is not a valid selection").to eql 'Valid selections are None and Stamps.com Insurance'
            end
          end

          # todo-rob Details Tracking selection fix
          def select(str)
            expect(dropdown).to be_present
            20.times do
              selection = StampsField.new(insurance_selection(str).first)
              dropdown.click unless selection.present?
              selection.click
              break if textbox.text.include?(str)
            end
            expect(textbox.text).to include(str)
          end

          def checkbox
            @checkbox ||= StampsCheckbox.new(
                driver.input(css: '[class*=mult] [class*=insurance-row] div[class*=x-form-item] input[type=button]'),
                driver.div(css: '[class*=mult] [class*=insurance-row] div[class*=checkbox]'),
                'class',
                'checked')
          end
        end

        class InsureAmt < WebApps::Base
          def present?
            insure_amt.present?
          end

          def insure_amt
            @insure_amt ||= StampsNumberField.new(
                driver.text_field(css: '[class*=mult] [name=InsuredValue]'),
                driver.div(css: '[class*=mult] [class*=insurance-field] [class*=up]'),
                driver.div(css: '[class*=mult] [class*=insurance-field] [class*=down]'))
          end
        end

        class Tracking < WebApps::Base

          attr_reader :textbox, :dropdown
          def initialize(param)
            super(param)
            # @textbox ||= StampsTextbox.new driver.text_field(name: 'Tracking')
            @textbox ||= StampsTextbox.new driver.input(css: 'div[id^=multiOrderDetailsForm-] input[id^=trackingdroplist-]')
            @dropdown ||= StampsField.new driver.div(css: 'div[id^=multiOrderDetailsForm-] div[id^=trackingdroplist-][id$=trigger-picker]')
          end

          def present?
            textbox.present?
          end

          def tracking_selection(selection)
            if selection.downcase.include? 'usps'
              driver.tds(css: 'div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td')
            elsif selection.downcase.include? 'signature'
              driver.tds(css: 'div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td')
            elsif selection.downcase.include? 'none'
              driver.tds(css: 'div[id=sdc-trackingdroplist-none]>table>tbody>tr>td')
            else
              expect("#{selection} is not a valid selection").to eql 'Valid selections are USPS Tracking and Signature Required'
            end
          end

          # todo-rob Details Tracking selection fix
          def select(str)
            expect(dropdown).to be_present
            20.times do
              selection = StampsField.new(tracking_selection(str).first)
              dropdown.click unless selection.present?
              selection.click
              break if textbox.text.include?(str)
            end
            expect(textbox.text).to include(str)
          end

          def tooltip(selection)
            selection_label = driver.td(text: selection)
            5.times do
              begin
                dropdown.click unless selection_label.present?
                if selection_label.present?
                  qtip = selection_label.parent.parent.parent.parent.attribute_value('data-qtip')
                  log.info qtip.to_s
                  return qtip
                end
              rescue
                # ignore
              end
            end
          end

          def checkbox
            cache[:checkbox].nil? || !cache[:checkbox].present? ? cache[:checkbox] = StampsCheckbox.new(
                driver.input(css: '[class*=mult] [class*=tracking-row] div[class*=x-form-item] input[type=button]'),
                driver.div(css: '[class*=mult] [class*=tracking-row] div[class*=checkbox]'),
                'class',
                'checked') : cache[:checkbox]
          end
        end
      end

      class Form < WebApps::Base
        
        include Toolbar
        include PresetMenu

        def blur_out_field
          if cache[:blur_out].nil? || !cache[:blur_out].present?
            cache[:blur_out] = StampsField.new(driver.label(text: 'Bulk Update:'))
          end
          cache[:blur_out]
        end

        def blur_out(count = 1)
          (count.nil? ? 1 : count.to_i).times do
            blur_out_field.double_click
            blur_out_field.click
          end
        end

        def present?
          blur_out_field.present?
        end

        def ship_from
          if cache[:ship_from].nil?
            cache[:ship_from] = BulkUpdateFields::ShipFrom.new(param)
          end
          cache[:ship_from]
        end

        def intl_service
          cache[:int_service] = BulkUpdateFields::IntlService.new(param) if cache[:int_service].nil?
          cache[:int_service]
        end

        # done
        def domestic_service
          cache[:domestic_service] = BulkUpdateFields::DomesticService.new(param) if cache[:domestic_service].nil?
          cache[:domestic_service]
        end

        def updating_orders
          if cache[:updating_orders].nil? || !cache[:updating_orders].present?
            cache[:updating_orders] = StampsField.new(driver.div(text: 'Updating Orders'))
          end
          cache[:updating_orders]
        end

        def update_orders
          if cache[:update_orders].nil? || !cache[:update_orders].present?
            cache[:update_orders] = StampsField.new(driver.span(text: 'Update Orders'))
          end
          cache[:update_orders]
        end

        def save_as_preset
          if cache[:save_preset].nil? || !cache[:save_preset].present?
            cache[:save_preset] = StampsField.new(driver.span(text: 'Save as Preset'))
          end
          cache[:save_preset]
        end

        def weight
          cache[:weight].nil? ? cache[:weight] = BulkUpdateFields::Weight.new(param) : cache[:weight]
        end

        def dimensions
          cache[:dimensions].nil? ? cache[:dimensions] = BulkUpdateFields::Dimensions.new(param) : cache[:dimensions]
        end

        def insurance
          @insurance ||= BulkUpdateFields::Insurance.new(param)
        end

        def insure_amt
          @insure_amt ||= BulkUpdateFields::InsureAmt.new(param)
        end

        def tracking
          @tracking ||= BulkUpdateFields::Tracking.new(param)
        end
      end
    end
  end
end



