module Stamps
  module Orders
    module Toolbar
      class MoveToOnHoldModal < WebApps::Base
        attr_reader :window_title, :cancel_btn, :hold_until

        def initialize(param)
          super
          @window_title = StampsField.new(driver.div(css: "div[id^=movetohold-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsField.new(driver.span(text: "Cancel"))
          @hold_until = StampsTextbox.new(driver.text_field(css: "input[placeholder='Select a Date']"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsField.new(driver.spans(text: "Move").last)
          10.times do
            move_btn.click
            break unless move_btn.present?
          end
        end

        def cancel
          10.times do
            cancel_btn.click
            break unless cancel_btn.present?
          end
        end
      end

      class MoveToCanceledModal < WebApps::Base
        attr_reader :window_title, :cancel_btn

        def initialize(param)
          super
          @window_title = StampsField.new(driver.div(css: "div[id^=dialoguemodal-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsField.new(driver.span(text: "Cancel"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsField.new(driver.spans(text: "Move").last)
          10.times do
            move_btn.click
            break unless move_btn.present?
          end
        end

        def cancel
          10.times do
            cancel_btn.click
            break unless cancel_btn.present?
          end
        end
      end

      class MoveToShippedModal < WebApps::Base


        def window_title
          if cache[:window_title].nil? || !cache[:window_title].present?
            cache[:window_title] = StampsField.new(driver.div(css: "div[id^=movetoshippedwindow-][id$=_header-targetEl]>div[id^=title]"))
          end
          cache[:window_title]
        end
        def cancel_btn
          cache[:cancel_btn] = StampsField.new(driver.span(text: "Cancel")) if cache[:cancel_btn].nil? || !cache[:cancel_btn].present?
          cache[:cancel_btn]
        end

        def present?
          window_title.present?
        end

        def order
          cache[:order] = StampsField.new(driver.label(css: "[id^=thirdcolcell-]>label")) if cache[:order].nil? || !cache[:order].present?
          cache[:order]
        end

        def order_number
          order.text
        end

        def move_to_shipped
          ord_num = order_number
          move_to_shipped_btn = StampsField.new(driver.spans(text: "Move to Shipped").last)
          30.times do
            move_to_shipped_btn.click
            break unless move_to_shipped_btn.present?
          end
          expect(move_to_shipped_btn.present?).to be(false), "Unable to move order number #{ord_num} to Shipped"
        end

        def cancel
          10.times do
            cancel_btn.click
            break unless cancel_btn.present?
          end
        end
      end

      class MoveToAwaitingShipmentModal < WebApps::Base


        attr_reader :window_title, :cancel_btn

        def initialize(param)
          super
          @window_title = StampsField.new(driver.div(css: "div[id^=dialoguemodal-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsField.new(driver.span(text: "Cancel"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsField.new(driver.spans(text: "Move").last)
          10.times do
            move_btn.click
            break unless move_btn.present?
          end
        end

        def cancel
          10.times do
            cancel_btn.click
            break unless cancel_btn.present?
          end
        end
      end

      class MoveDropDown < WebApps::Base


        def dropdown
          cache[:dropdown] = StampsField.new(driver.span(text: "Move")) if cache[:dropdown].nil? || cache[:dropdown].present?
          cache[:dropdown]
        end

        def shipped
          cache[:shipped] = MoveToShippedModal.new(param) if cache[:shipped].nil?
          cache[:shipped]
        end

        def canceled
          cache[:canceled] = MoveToCanceledModal.new(param) if cache[:canceled].nil?
          cache[:canceled]
        end

        def on_hold
          cache[:on_hold] = MoveToOnHoldModal.new(param) if cache[:on_hold].nil?
          cache[:on_hold]
        end

        def awaiting_shipment
          cache[:awaiting_shipment] = MoveToAwaitingShipmentModal.new(param) if cache[:awaiting_shipment].nil?
          cache[:awaiting_shipment]
        end

        def tooltip_field
          cache[:tooltip_field] = StampsField.new(driver.div(id: 'ext-quicktips-tip-innerCt')) if cache[:tooltip_field].nil?
          cache[:tooltip_field]
        end

        def enabled?
          dropdown.enabled?
        end

        def move_to_shipped
          select(:shipped)
        end

        def move_to_canceled
          select(:canceled)
        end

        def move_to_awaiting_shipment
          select(:awaiting_shipment)
        end

        def move_to_on_hold
          select(:on_hold)
        end

        def select(selection)
          expect(enabled?).to be(true)
          expect([:shipped, :canceled, :awaiting_shipment, :on_hold]).to include(selection)
          selection_str = ""
          modal = nil
          case selection
            when :shipped
              selection_str = "Move to Shipped"
              modal = shipped
            when :canceled
              selection_str = "Move to Canceled"
              modal = canceled
            when :awaiting_shipment
              selection_str = "Move to Awaiting Shipment"
              modal = awaiting_shipment
            when :on_hold
              selection_str = "Move to On Hold"
              modal = on_hold
            else
              #do nothing.
          end

          30.times{
            return modal if modal.present?
            selection_item = StampsField.new(driver.span(text: selection_str))
            dropdown.click unless selection_item.present?
            sleep(0.50)
            selection_item.hover
            sleep(0.25)
            selection_item.click
          }
          expect("Unable to select #{selection}").to eql("Move Menu - Select")
        end

        def tooltip
          btn = dropdown
          btn.field.hover
          btn.field.hover
          15.times do
            btn.field.hover
            sleep(0.35)
            if tooltip_field.present?
              log.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      class MoreActionsDropDown < WebApps::Base
        def enabled?
          dropdown.enabled?
        end

        def dropdown
          (cache[:dropdown].nil? || !cache[:dropdown].present?) ? cache[:dropdown] = StampsField.new(driver.span(text: "More Actions")) : cache[:dropdown]
        end

        def split_order
          (cache[:split_order].nil? || !cache[:split_order].present?) ? cache[:split_order] = WebApps::Base.new(param).extend(Stamps::Orders::SplitOrder::WindowTitle) : cache[:split_order] #todo-ORDERSAUTO-3405 code review: you should only get a handle on window title here. SplitOrderModal should have a window title module.
        end

        def combine_orders

        end

        def apply_bulk_action

        end

        def select_combine_orders
          select(:combine_orders)
        end

        def select_split_order
          select(:split_order)
        end

        def select_apply_bulk_action
          select(:apply_bulk_action)
        end

        def select(str)
          raise "More actions drop down is disabled." unless enabled?
          5.times do
            return split_order.window_title.text if split_order.window_title.present? #this should be return
            selection = StampsField.new(driver.span(text: case str
                                                             when :combine_orders
                                                               "Combine Orders"
                                                             when :split_order
                                                               "Split Order"
                                                             when :apply_bulk_action
                                                               "Apply Bulk Action"
                                                             else
                                                               raise "Invalid selection: #{str}"
                                                           end
                                                    ))
            dropdown.click unless selection.present?
            sleep(0.1)
            selection.hover
            sleep(0.1)
            selection.click
            split_order.window_title.wait_until_present(2)
          end
          nil
        end
      end

      class PrintIncompleteOrderError < WebApps::Base


        attr_reader :window_title, :ok_btn, :error_message_label

        def window_title
          cache[:window_title] = StampsField.new(driver.div(text: 'Incomplete Order')) if cache[:window_title].nil? || !cache[:window_title].present?
          cache[:window_title]
        end

        def ok_btn
          cache[:ok_btn] = StampsField.new(driver.span(text: "OK")) if cache[:ok_btn].nil? || !cache[:ok_btn].present?
          cache[:ok_btn]
        end

        def error_message_label
          if cache[:error_message_label].nil? || !cache[:error_message_label].present?
           cache[:error_message_label] = driver.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
          end
          cache[:error_message_label]
        end


        def initialize(param)
          super
          @window_title = StampsField.new driver.div(text: 'Incomplete Order')
          @ok_btn = StampsField.new driver.span(text: "OK")
          @error_message_label = driver.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def ok
          ok_btn.click_while_present
        end

        def error_message
          StampsField.new(error_message_label).text
        end

        def error_message_p1
          StampsField.new(error_message_label.ps[0]).text
        end

        def error_message_p2
          StampsField.new(error_message_label.ps[1]).text
        end
     end

      #todo-rob update Print Multi Order Error tests
      class PrintMultiOrderError < WebApps::Base


        def window_title
          cache[:window_title] = StampsField.new(driver.div(text: 'Order Error')) if cache[:window_title].nil? || !cache[:window_title].present?
          cache[:window_title]
        end

        def error_message_label
          cache[:error_message_label].nil? ? cache[:error_message_label] = Navigation::NavigationBar.new(param) : cache[:error_message_label]
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def error_message
          StampsField.new(error_message_label).text
        end
      end

      class PrintMultiOrderSomeHasError < PrintMultiOrderError
        attr_reader :continue_btn, :cancel_btn

        def initialize(param)
          super
          @continue_btn = StampsField.new driver.span(text: 'Continue')
          @cancel_btn = StampsField.new driver.span(text: 'Cancel')
        end

        def present?
          continue_btn.present? && window_title.present?
        end

        def continue
          continue_btn.click_while_present
        end

        def cancel
          cancel_btn.click_while_present
        end

        def error_message_p1
          StampsField.new(error_message_label.ps[0]).text
        end

        def error_message_p2
          StampsField.new(error_message_label.ps[1]).text
        end
      end

      class PrintMultiOrderAllHaveError < PrintMultiOrderError
        def ok_btn
          cache[:ok_btn] = StampsField.new(driver.span(text: "OK")) if cache[:ok_btn].nil? || !cache[:ok_btn].present?
          cache[:ok_btn]
        end

        def present?
          ok_btn.present? && window_title.present?
        end

        def ok
          ok_btn.click_while_present
        end
      end

      class UspsPrivacyActStatement < WebApps::Base


        def window_title
          if cache[:window_title].nil? || !cache[:window_title].present?
            cache[:window_title] = StampsField.new(driver.div(text: 'USPS Privacy Act Statement'))
          end
          cache[:window_title]
        end

        def message_label
          if cache[:message_label].nil? || !cache[:message_label].present?
            cache[:message_label] = StampsField.new driver.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
          end
          cache[:message_label]
        end

        def ok_btn
          cache[:ok_btn] = StampsField.new(driver.span(text: "OK")) if cache[:ok_btn].nil? || !cache[:ok_btn].present?
          cache[:ok_btn]
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def text
          message_label.text
        end

        def ok
          ok_btn.click_while_present
        end
      end

      class USPSTermsOrders < WebApps::Base


        attr_reader :window_title, :i_agree_btn, :cancel_btn, :privacy_act_link

        def window_title
          cache[:window_title] = StampsField.new(driver.div(text: 'USPS Terms')) if cache[:window_title].nil? || !cache[:window_title].present?
          cache[:window_title]
        end

        def i_agree_btn
          cache[:i_agree_btn] = StampsField.new(driver.span(text: "I Agree")) if cache[:i_agree_btn].nil? || !cache[:i_agree_btn].present?
          cache[:i_agree_btn]
        end

        def cancel_btn
          cache[:cancel_btn] = StampsField.new(driver.span(text: "Cancel")) if cache[:cancel_btn].nil? || !cache[:cancel_btn].present?
          cache[:cancel_btn]
        end

        def privacy_act_link
          if cache[:privacy_act_link].nil? || !cache[:privacy_act_link].present?
            cache[:privacy_act_link] = StampsField.new(driver.div(text: 'USPS Privacy Act Statement'))
          end
          cache[:privacy_act_link]
        end

        def initialize(param)
          super
          @window_title = StampsField.new driver.div(text: 'USPS Terms')
          @i_agree_btn = StampsField.new driver.span(text: "I Agree")
          @cancel_btn = StampsField.new driver.span(text: "Cancel")
          @privacy_act_link = StampsField.new driver.a(text: "USPS Privacy Act Statement")
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def agree_to_terms
          i_agree_btn.click_while_present
        end

        def i_gree
          agree_to_terms
        end

        def cancel
          cancel_btn.click_while_present
        end

        def text_p1
          #"One or more orders is missing the following acknowledgement. Please agree to the following prior to printing these orders:"
          StampsField.new(driver.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div").first).text
        end

        def text_p2
          StampsField.new(driver.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div")[1]).text
        end

        def dont_show_this_again
          field = driver.label(text: "Don't show this again.")
          verify_field = field.parent.parent.parent
          StampsCheckbox.new field, verify_field, "class", "checked"
        end

        def usps_privacy_act_statement
          privacy_act = UspsPrivacyActStatement.new(param)
          10.times do
            privacy_act_link.click
            privacy_act.wait_until_present 2
            return privacy_act if privacy_act.present?
          end
          expect(privacy_act).to be_present
        end
      end

      class ShipStationServerError < WebApps::Base

        def window_title
          driver.divs(text: 'Server Error').first
        end

        def present?
          window_title.present?
        end

        def text
          StampsField.new(driver.divs(css: "div[class*=sdc-warning]>div[id$=outerCt]>div").first).text #todo-Rob this is wrong, fix it.
        end
      end

      class ToolbarPrintButton < WebApps::Base
        include Stamps::Orders::TermsAndConditions



        def incomplete_order_modal
          cache[:incomplete_order].nil? ? cache[:incomplete_order] = PrintIncompleteOrderError.new(param) : cache[:incomplete_order]
        end

        def multi_order_some_error
          cache[:multi_order].nil? ? cache[:multi_order] = PrintMultiOrderSomeHasError.new(param) : cache[:multi_order]
        end

        def usps_terms_modal
          cache[:usps_terms].nil? ? cache[:usps_terms] = USPSTermsOrders.new(param) : cache[:usps_terms]
        end

        def multi_order_all_error
          cache[:multi_order_all_error].nil? ? cache[:multi_order_all_error] = PrintMultiOrderAllHaveError.new(param) : cache[:multi_order_all_error]
        end

        def present?
          print_order_btn.present?
        end

        def wait_until_present(*args)
          print_order_btn.wait_until_present(*args)
        end

        def tooltip
          print_order_btn.hover
          print_order_btn.attribute_value("data-qtip").split("<br>").last
        end

        def click
          20.times do
            begin
              print_order_btn.click
              print_window.window_title.wait_until_present(4)
              return print_window.window_title.text if print_window.window_title.present?
              if terms_conditions.present?
                log.debug terms_conditions.form_body.text
                terms_conditions.i_agree
                terms_conditions.close.click_while_present
              end
              30.times do
                break unless usps_terms_modal.present?
                usps_terms_modal.i_gree if usps_terms_modal.present?
              end
              expect(incomplete_order_modal).to_not be_present, incomplete_order_modal.error_message_p2
              expect(multi_order_some_error).to_not be_present, multi_order_some_error.error_message_p2
            rescue
              # ignore
            end
          end
          nil
        end

        def usps_terms
          open_window(usps_terms_modal)
        end

        def open_window(window)
          return window if window.present?

          print_order_btn.click
          sleep 3
          window.wait_until_present 3

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          return window if window.present?
          return incomplete_order_modal if incomplete_order_modal.present?
          return multi_order_some_error if multi_order_some_error.present?
          return usps_terms_modal if usps_terms_modal.present?

          usps_terms.agree_to_terms if usps_terms_modal.present?

          error_connecting_to_plugin = ErrorConnectingToPlugin.new(param)

          10.times do
            begin
              return window if window.present?
              if error_connecting_to_plugin.present?
                5.times{
                  error_connecting_to_plugin.ok
                  #order_grid.column.checkbox.check_all checked_rows_cache
                  break unless error_connecting_to_plugin.present?
                }
              end

              if naws_plugin_error.present?
                5.times{
                  naws_plugin_error.ok
                  #order_grid.column.checkbox.check_all checked_rows_cache
                  break unless naws_plugin_error.present?
                }
              end

              return window if window.present?
              print_order_btn.click
              sleep(0.35)
            rescue
              # ignore
            end

            if install_plugin_error.present?
              install_plugin_error.close
              expect(window).to be_present
            end
          end

          expect(window).to be_present
        end

        #todo-Rob Rework print_expecting_error
        def print_expecting_error(*args)
          error_window = Stamps::Orders::OrdersRuntimeError::IncompleteOrderError.new(param) #Updated class reference for IncompleteOrderError
          open_window error_window
          case args.length
            when 0
              error_window
            when 1
              error_window.error_message.include? error_message
            else
              expect("Illegal number of arguments.").to eql ""
          end
        end

        def print_invalid_address
          open_window InvalidAddressError.new(param)
        end

        def print_window
          (cache[:print_window].nil? || !cache[:print_window].present?) ? cache[:print_window] = WebApps::Base.new(param).extend(Stamps::Orders::Printing::OrdersPrintModalTitle) : cache[:print_window]
        end

        #todo-Rob verify css locator
        def print_order_btn
          (cache[:print_order_btn].nil? || !cache[:print_order_btn].present?) ? cache[:print_order_btn] = StampsField.new(driver.a(css: "div[id^=app-main]>div[id^=toolbar]>div>div>a[data-qtip*=Print]")) : cache[:print_order_btn]
        end
      end

      class SettingsMenu < WebApps::Base
        def select(menu_item)
          dd = StampsField.new driver.span css: "span[class*=sdc-icon-settings]"
          case menu_item.downcase
            when /settings/
              selection = StampsField.new(driver.span text: "General Settings")
              modal = Orders::Settings::GeneralSettings.new(param)
            when /stores/
              selection = StampsField.new(driver.span text: "Add/Edit Stores")
              modal = Orders::Stores::ManageStores.new(param)
            # to-do Kaushal automation rules implement
            when /automation_rules/
              selection = StampsField.new(driver.span text: " ")
              modal = Orders::AutomationRulesModal.new(param)
            else
              expect("Invalid Menu Selection - #{menu_item} is not recognized.  Valid selections are Settings or Stores.").to eql ""
          end

          20.times do
            sleep(0.35)
            return modal if modal.present?
            dd.click unless selection.present?
            #sleep(0.35)
            selection.click
            selection.click
          end
          #expect("Unable to Toolbar Settings Menu Selection - #{menu_item}").to eql ""
        end

        def general_settings
          select "Settings"
        end

        def manage_stores
          select "Stores"
        end
      end

      class PerPage < WebApps::Base
        attr_reader :textbox, :dropdown

        def initialize(param)
          super
          @textbox = StampsTextbox.new(driver.text_field(id: "sdc-batch-grid-pagingtoolbar-combobox-inputEl"))
          @dropdown = StampsField.new(driver.div(id: "sdc-batch-grid-pagingtoolbar-combobox-trigger-picker"))
        end

        def select(selection)
          per_page = StampsField.new(driver.li(text: selection))
          box = textbox
          10.times do
            dropdown.click unless per_page.present?
            per_page.click if per_page.present?
            return box.text if box.text.include?(selection)
          end
        end

        def x100
          select("100")
        end

        def x250
          select("250")
        end

        def x500
          select("500")
        end
      end

      class AddButton < WebApps::Base
        include Stamps::Orders::SingleOrder::Fields::OrderDetailsOrderId


        def add_btn
          cache[:add_btn] = StampsField.new(driver.span(text: 'Add')) if cache[:add_btn].nil? || !cache[:add_btn].present?
          cache[:add_btn]
        end

        def details_order_id
          cache[:details_order_id] = Orders::SingleOrder::Fields::SingleOrderDetailsOrderId.new(param) if cache[:details_order_id].nil?
          cache[:details_order_id]
        end

        def server_error
          cache[:server_error] = ShipStationServerError.new(param) if cache[:server_error].nil?
          cache[:server_error]
        end

        def initializing_db
          if cache[:initializing_db].nil? || !cache[:initializing_db].present?
            cache[:initializing_db] = StampsField.new(driver.div(text: "Initializing Order Database"))
          end
          cache[:initializing_db]
        end

        def tooltip_field
          if cache[:tooltip_field].nil? || !cache[:tooltip_field].present?
            cache[:tooltip_field] = StampsField.new(driver.div(id: 'ext-quicktips-tip-innerCt'))
          end
          cache[:tooltip_field]
        end

        def click
          # add_btn=StampsField.new(driver.span(text: 'Add'))
          # details_order_id=Orders::SingleOrder::Fields::SingleOrderDetailsOrderId.new(param)
          # server_error=ShipStationServerError.new(param)
          # initializing_db=StampsField.new(driver.div(text: "Initializing Order Database"))

          15.times do
            begin
              add_btn.click
              20.times do
                sleep(0.15)
                return order_id.text.extract_numbers if order_id.present?
              end
              # new accounts will connect to ShipStation for the first time.
              20.times do
                if initializing_db.present?
                  log.info initializing_db.text
                  log.info initializing_db.text
                  log.info initializing_db.text
                  initializing_db.wait_while_present(3)
                  break unless initializing_db.present?
                end
              end

              raise "Server Error: \n#{server_error.text}" if server_error.present?

            rescue
              # ignore
            end
          end
          raise "Server Error: \n#{server_error.text}" if server_error.present?
          raise "Initializing Database took longer than expected. Check your test making sure ShipStation is up and running in  #{param.env}" if initializing_db.present?
          raise "Unable to add new order."
        end

        def tooltip
          #tooltip_field=StampsField.new(driver.div(id: 'ext-quicktips-tip-innerCt'))
          button.field.hover
          button.field.hover
          15.times do
            button.field.hover
            sleep(0.35)
            if tooltip_field.present?
              log.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      module OrdersToolbarRightSide
        def toolbar_settings
          (cache[:settings][:import].nil? || !cache[:settings][:import].present?) ? cache[:settings] = SettingsMenu.new(param) : cache[:settings]
        end

        def toolbar_import
          (cache[:import].nil? || !cache[:import].present?) ? cache[:import] = StampsField.new(driver.span(css: "a[data-qtip*='Import']>span>span>span[id$=btnIconEl]")) : cache[:import]
        end

        def import
          raise "Import needs to be re-visited"
          5.times do
            return import_orders_modal if import_orders_modal.present?
            toolbar_import.click
          end
        end
      end

      module OrdersToolbarLeftSide
        def present?
          toolbar_print.present?
        end

        def wait_until_present(*args)
          toolbar_print.wait_until_present(*args)
        end

        def toolbar_print
          cache[:print].nil? ? cache[:print] = ToolbarPrintButton.new(param) : cache[:print]
        end

        def toolbar_add
          cache[:add].nil? ? cache[:add] = AddButton.new(param) : cache[:add]
        end

        def toolbar_move
          cache[:move].nil? ? cache[:move] = MoveDropDown.new(param) : cache[:move]
        end

        def toolbar_more_actions
          cache[:more_actions].nil? ? cache[:more_actions] = MoreActionsDropDown.new(param) : cache[:more_actions]
        end

        def toolbar_tags
          raise 'Not Implemented'
        end
      end

      #todo-Rob verify these objects are still needed and which tests are using it
      module ToolbarItemsToBeVerified
        #============================

        def per_page
          PerPage.new(param)
        end

        def reprint
          button = StampsField.new driver.span(text: "Reprint")
          modal = RePrintModal.new(param)
          label_unavailable = LabelUnavailable.new(param)
          15.times do
            return modal if modal.present?
            return label_unavailable if label_unavailable.present?
            button.click
          end
        end

        def browser_settings_button
          StampsField.new(driver.span css: "span[class*=sdc-icon-settings]")
        end

        def page_count
          (driver.divs css: "div[id^=tbtext]").last
        end

        def page_number
          field = driver.text_field css: "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
          textbox = StampsTextbox.new field
          textbox
        end

        def first_page
          field = driver.span css: "span[class*=x-tbar-page-first]"
          label = StampsField.new field
          label
        end

        def first_page_disabled
          field = driver.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = StampsField.new field
          label.field.disabled?
        end

        def previous_page
          StampsField.new field driver.span css: "span[class*=x-tbar-page-prev]"
        end

        def previous_page_disabled
          field = driver.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = StampsField.new field
          label.field.disabled?
        end

        def next_page
          StampsField.new field driver.span css: "span[class*=x-tbar-page-next]"
        end

        def last_page
          StampsField.new field driver.span css: "span[class*=x-tbar-page-last]"
        end

        def last_page_disabled
          StampsField.new driver.a css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        end

        def total_number_of_pages
          label = (StampsField.new driver.divs css: "div[id^=tbtext-]").last
          number_str = label.text
          number = number_str.scan /\d+/
          number.last.to_s
        end
      end


      class ToolbarSettingsIcon < WebApps::Base
        include Stamps::Orders::OrdersSettings::OrdersSettingsModalTitle



        def field
          cache[:field] = StampsField.new(driver.span(css: "[class*=sdc-icon-settings]")) if cache[:field].nil? || !cache[:field].present?
          cache[:field]
        end

        def click
          20.times do
            hover
            field.click
            return true if window_title.present?
          end
          nil
        end

        def hover
          field.hover
        end

        def tooltip
          raise 'Not Implemented'
        end
      end

      class OrdersToolbar < WebApps::Base

        include OrdersToolbarLeftSide
        #include OrdersToolbarRightSide
        include ToolbarItemsToBeVerified

        def orders_settings
          (cache[:orders_settings].nil? || !cache[:orders_settings].present?) ? cache[:orders_settings] = ToolbarSettingsIcon.new(param) : cache[:orders_settings]
        end

        def import_orders_modal
          (cache[:import_orders_modal].nil? || !cache[:import_orders_modal].present?) ? cache[:import_orders_modal] = ImportOrders.new(param) : cache[:import_orders_modal]
        end

        def usps_intl_terms
          (cache[:usps_intl_terms].nil? || !cache[:usps_intl_terms].present?) ? cache[:usps_intl_terms] = USPSTermsOrders.new(param) : cache[:usps_intl_terms]
        end

        def refresh_orders
          button = StampsField.new driver.span(css: "a[data-qtip*='Refresh Orders']>span>span>span[id$=btnInnerEl]")
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          button.click
          sleep(0.35)
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.click
          sleep(0.35)
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          button.click
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            log.info importing_order.message
            importing_order.ok
          end
        end
      end
    end
  end
end
