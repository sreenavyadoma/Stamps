module Stamps
  module Orders
    module Toolbar

      class MoveToOnHold < Browser::StampsModal
        attr_reader :window_title, :cancel_btn, :hold_until

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(css: "div[id^=movetohold-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsElement.new(browser.span(text: "Cancel"))
          @hold_until = StampsTextBox.new(browser.text_field(css: "input[placeholder='Select a Date']"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsElement.new(browser.spans(text: "Move").last)
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

      class MoveToCanceled < Browser::StampsModal
        attr_reader :window_title, :cancel_btn

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsElement.new(browser.span(text: "Cancel"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsElement.new(browser.spans(text: "Move").last)
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

      class MoveToShipped < Browser::StampsModal
        attr_reader :window_title, :cancel_btn

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(css: "div[id^=movetoshippedwindow-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsElement.new(browser.span(text: "Cancel"))
        end

        def present?
          window_title.present?
        end

        def move
          btn = StampsElement.new(browser.spans(text: "Move to Shipped").last)
          10.times do
            btn.click
            break unless btn.present?
          end
        end

        def cancel
          10.times do
            cancel_btn.click
            break unless cancel_btn.present?
          end
        end
      end

      class MoveToAwaitingShipment < Browser::StampsModal
        attr_reader :window_title, :cancel_btn

        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=_header-targetEl]>div[id^=title]"))
          @cancel_btn = StampsElement.new(browser.span(text: "Cancel"))
        end

        def present?
          window_title.present?
        end

        def move
          move_btn = StampsElement.new(browser.spans(text: "Move").last)
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

      class MoveDropDown < Browser::StampsModal
        attr_reader :drop_down, :shipped, :canceled, :on_hold, :awaiting_shipment, :tooltip_element

        def initialize(param)
          super
          @drop_down = StampsElement.new(browser.span(text: "Move"))
          @shipped = MoveToShipped.new(param)
          @canceled = MoveToCanceled.new(param)
          @on_hold = MoveToOnHold.new(param)
          @awaiting_shipment = MoveToAwaitingShipment.new(param)
          @tooltip_element = StampsElement.new(browser.div(id: 'ext-quicktips-tip-innerCt'))
        end

        def enabled?
          drop_down.enabled?
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

          selection_item = StampsElement.new(browser.span(text: selection_str))

          30.times{
            return modal if modal.present?
            drop_down.click unless selection_item.present?
            sleep(0.50)
            selection_item.hover
            sleep(0.25)
            selection_item.click
          }
          expect("Unable to select #{selection}").to eql("Move Menu - Select")
        end

        def tooltip
          btn = drop_down
          btn.element.hover
          btn.element.hover
          15.times do
            btn.element.hover
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class PrintIncompleteOrderError < Browser::StampsModal
        attr_reader :window_title, :ok_btn, :error_message_label

        def initialize(param)
          super
          @window_title = StampsElement.new browser.div(text: 'Incomplete Order')
          @ok_btn = StampsElement.new browser.span(text: "OK")
          @error_message_label = browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
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
          StampsElement.new(error_message_label).text
        end

        def error_message_p1
          StampsElement.new(error_message_label.ps[0]).text
        end

        def error_message_p2
          StampsElement.new(error_message_label.ps[1]).text
        end
      end

      class PrintMultiOrderError < Browser::StampsModal
        attr_reader :window_title, :error_message_label

        #todo-rob update Print Multi Order Error tests
        def initialize(param)
          super
          @window_title = StampsElement.new(browser.div(text: 'Order Error'))
          @error_message_label = browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def error_message
          StampsElement.new(error_message_label).text
        end
      end

      class PrintMultiOrderSomeHasError < PrintMultiOrderError
        attr_reader :continue_btn, :cancel_btn

        def initialize(param)
          super
          @continue_btn = StampsElement.new browser.span(text: 'Continue')
          @cancel_btn = StampsElement.new browser.span(text: 'Cancel')
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
          StampsElement.new(error_message_label.ps[0]).text
        end

        def error_message_p2
          StampsElement.new(error_message_label.ps[1]).text
        end
      end

      class PrintMultiOrderAllHaveError < PrintMultiOrderError
        attr_reader :ok_btn

        def initialize(param)
          super
          @ok_btn = StampsElement.new(browser.span(text: "OK"))
        end

        def present?
          ok_btn.present? && window_title.present?
        end

        def ok
          ok_btn.click_while_present
        end
      end

      class UspsPrivacyActStatement < Browser::StampsModal
        attr_reader :window_title, :message_label, :ok_btn

        def initialize(param)
          super
          @window_title = StampsElement.new browser.div(text: 'USPS Privacy Act Statement')
          @message_label = StampsElement.new browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
          @ok_btn = StampsElement.new browser.span(text: "OK")
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

      class USPSTerms < Browser::StampsModal
        attr_reader :window_title, :i_agree_btn, :cancel_btn, :privacy_act_link

        def initialize(param)
          super
          @window_title = StampsElement.new browser.div(text: 'USPS Terms')
          @i_agree_btn = StampsElement.new browser.span(text: "I Agree")
          @cancel_btn = StampsElement.new browser.span(text: "Cancel")
          @privacy_act_link = StampsElement.new browser.a(text: "USPS Privacy Act Statement")
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

        def cancel
          cancel_btn.click_while_present
        end

        def text_p1
          #"One or more orders is missing the following acknowledgement. Please agree to the following prior to printing these orders:"
          StampsElement.new(browser.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div").first).text
        end

        def text_p2
          StampsElement.new(browser.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div")[1]).text
        end

        def dont_show_this_again
          field = browser.label(text: "Don't show this again.")
          verify_field = field.parent.parent.parent
          StampsCheckBox.new field, verify_field, "class", "checked"
        end

        def usps_privacy_act_statement
          privacy_act = UspsPrivacyActStatement.new(param)
          10.times do
            privacy_act_link.click
            privacy_act.wait_until_present 2
            return privacy_act if privacy_act.present?
          end
          expect(privacy_act.present?).to be(true)
        end
      end

      class ShipStationServerError < Browser::StampsModal
        def window_title
          browser.divs(text: 'Server Error').first
        end

        def present?
          window_title.present?
        end

        def text
          StampsElement.new(browser.divs(css: "div[class*=sdc-warning]>div[id$=outerCt]>div").first).text
        end
      end

      class ToolbarPrintButton < Browser::StampsModal
        attr_reader :print_order_btn, :orders_print_modal, :incomplete_order_modal, :usps_terms_modal,
                    :multi_order_some_error, :multi_order_all_error

        def initialize(param)
          super
          @orders_print_modal = Stamps::Orders::OrdersPrintModal.new(param)
          @print_order_btn = StampsElement.new browser.a(css: "div[id^=app-main]>div[id^=toolbar]>div>div>a[data-qtip*=Print]")
          @incomplete_order_modal = PrintIncompleteOrderError.new(param)
          @multi_order_some_error = PrintMultiOrderSomeHasError.new(param)
          @multi_order_all_error = PrintMultiOrderAllHaveError.new(param)
          @usps_terms_modal = USPSTerms.new(param)
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

        def print_modal
          return orders_print_modal if orders_print_modal.present?

          expectation = "Print Modal is present"
          if orders_print_modal.present?
            logger.info "Print Modal is Present"
            return orders_print_modal
          else
            logger.info "Print Modal is not yet Present"
          end

          15.times do |count|
            print_order_btn.click
            orders_print_modal.wait_until_present 3
            if orders_print_modal.present?
              logger.info "Print Modal is Present"
              return orders_print_modal
            else
              logger.info "Print Modal is not yet Present... try ##{count+1}"
            end

            if usps_terms_modal.present?
              #usps_terms_modal.cancel_btn
              text = logger.error usps_terms_modal.text_p1
              logger.error usps_terms_modal.text_p2
              usps_terms_modal.cancel
              expect(text).to eql ""
            end

            if incomplete_order_modal.present?
              logger.error incomplete_order_modal.error_message_p1
              logger.error incomplete_order_modal.error_message_p2
              incomplete_order_modal.ok

              expect(incomplete_order_modal.error_message_p2).to eql ""
            end

            if multi_order_some_error.present?
              logger.error multi_order_some_error.error_message_p1
              text = multi_order_some_error.error_message_p2
              logger.error text
              multi_order_some_error.continue
              expect(text).to eql ""
            end

            if multi_order_all_error.present?
              text = multi_order_all_error.error_message
              logger.error text
              multi_order_all_error.ok
              expect(text).to eql ""
            end

            return orders_print_modal if orders_print_modal.present?
          end
          expect(orders_print_modal.present?).to be(true), "Print Modal is NOT present"
        end

        def usps_terms
          expectation = "USPS Terms Modal is present"
          modal = open_window usps_terms_modal
          expectation = "USPS Terms Modal is NO present." unless modal.present?
          expect(expectation).to eql "USPS Terms Modal is present"
          modal
        end

        def open_window window
          return window if window.present?

          print_order_btn.click

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
              #ignore
            end

            if install_plugin_error.present?
              install_plugin_error.close
              expect(window.present?).to be(true)
            end
          end

          expect(window.present?).to be(true)
        end

        def print_expecting_error(*args)
          error_window = IncompleteOrderError.new(param)
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
      end

      class SettingsMenu < Browser::StampsModal
        def select menu_item
          dd = StampsElement.new browser.span css: "span[class*=sdc-icon-settings]"
          case menu_item.downcase
            when /settings/
              selection = StampsElement.new(browser.span text: "General Settings")
              modal = Orders::Settings::GeneralSettings.new(param)
            when /stores/
              selection = StampsElement.new(browser.span text: "Add/Edit Stores")
              modal = Orders::Stores::ManageStores.new(param)
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
          expect("Unable to Toolbar Settings Menu Selection - #{menu_item}").to eql ""
        end

        def general_settings
          select "Settings"
        end

        def manage_stores
          select "Stores"
        end
      end

      class PerPage < Browser::StampsModal
        attr_reader :text_box, :drop_down

        def initialize(param)
          super
          @text_box = StampsTextBox.new(browser.text_field(id: "sdc-batch-grid-pagingtoolbar-combobox-inputEl"))
          @drop_down = StampsElement.new(browser.div(id: "sdc-batch-grid-pagingtoolbar-combobox-trigger-picker"))
        end

        def select(selection)
          per_page = StampsElement.new(browser.li(text: selection))
          box = text_box
          10.times do
            drop_down.click unless per_page.present?
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

      class AddButton < Browser::StampsModal
        attr_reader :button, :initializing_db, :loading_orders

        def initialize(param)
          super
          @button = StampsElement.new(browser.span(text: 'Add'))
          @initializing_db = StampsElement.new(browser.div(text: "Initializing Order Database"))
          @loading_orders = StampsElement.new(browser.div(text: "Loading orders..."))
        end

        def order
          order_details
        end

        def order_details
          details = Orders::Details::SingleOrderDetails.new(param)
          nav_bar = Navigation::NavigationBar.new(param)
          server_error = ShipStationServerError.new(param)

          15.times do |count|
            begin
              button.click

              10.times do
                sleep(0.35)
                return details if details.present?
              end

              30.times do
                if initializing_db.present?
                  logger.message initializing_db.text
                  logger.message initializing_db.text
                  logger.message initializing_db.text
                  initializing_db.wait_until_present 2
                  break unless initializing_db.present?
                end
              end

              return details if details.present?
              expect("#{server_error.text}").to eql "Server Error" if server_error.present?
            rescue
              #ignore
            end
          end

          expect("#{server_error.text}").to eql "Server Error" if server_error.present?

          initializing_db.wait_until_present(15) if initializing_db.present?

          if initializing_db.present?
            message = "*****  #{initializing_db.text}  *****Ship Station might be down. USERNAME: #{nav_bar.username.text}"
            logger.info message
            expect(message).to eql "Initializing Database Error"
          end

          expect("#{server_error.text}").to eql "Server Error" if server_error.present?

          expect("Single Order Details Panel did not open upon clicking Add button.").to eql "Unable to Add new orders." unless details.present?
        end

        def tooltip
          tooltip_element = StampsElement.new browser.div(id: 'ext-quicktips-tip-innerCt')
          button.element.hover
          button.element.hover
          15.times do
            button.element.hover
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class OrdersToolbar < Browser::StampsModal
        attr_reader :print_btn, :add, :move_drop_down, :import_button, :import_orders_modal, :usps_intl_terms

        def initialize(param)
          super
          @import_button = StampsElement.new(browser.span(css: "a[data-qtip*='Import']>span>span>span[id$=btnIconEl]"))
          @print_btn = ToolbarPrintButton.new(param)
          @add = AddButton.new(param)
          @move_drop_down = MoveDropDown.new(param)
          @import_orders_modal = ImportOrders.new(param)
          @usps_intl_terms = USPSTerms.new(param)
        end

        def refresh_orders
          button = StampsElement.new browser.span(css: "a[data-qtip*='Refresh Orders']>span>span>span[id$=btnInnerEl]")
          importing_order = Orders::Stores::ImportingOrdersModal.new(param)

          button.click
          sleep(0.35)
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          button.click
          sleep(0.35)
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          button.click
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
          if importing_order.present?
            logger.info importing_order.message
            importing_order.ok
          end
        end

        def import
          5.times do
            return import_orders_modal if import_orders_modal.present?
            import_button.click
          end
        end

        def present?
          print_btn.present?
        end

        def wait_until_present(*args)
          print_btn.wait_until_present(*args)
        end

        #============================

        def per_page
          PerPage.new(param)
        end

        def settings
          SettingsMenu.new(param)
        end

        def reprint
          button = StampsElement.new browser.span(text: "Reprint")
          modal = RePrintModal.new(param)
          label_unavailable = LabelUnavailable.new(param)
          15.times do
            return modal if modal.present?
            return label_unavailable if label_unavailable.present?
            button.click
          end
        end

        def browser_settings_button
          StampsElement.new(browser.span css: "span[class*=sdc-icon-settings]")
        end

        def settings_modal
          SettingsModal.new(param)
        end

        def page_count
          (browser.divs css: "div[id^=tbtext]").last
        end

        def page_number
          field = browser.text_field css: "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
          text_box = StampsTextBox.new field
          text_box
        end

        def first_page
          field = browser.span css: "span[class*=x-tbar-page-first]"
          label = StampsElement.new field
          label
        end

        def first_page_disabled
          field = browser.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = StampsElement.new field
          label.element.disabled?
        end

        def previous_page
          StampsElement.new element browser.span css: "span[class*=x-tbar-page-prev]"
        end

        def previous_page_disabled
          field = browser.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = StampsElement.new field
          label.element.disabled?
        end

        def next_page
          StampsElement.new element browser.span css: "span[class*=x-tbar-page-next]"
        end

        def last_page
          StampsElement.new element browser.span css: "span[class*=x-tbar-page-last]"
        end

        def last_page_disabled
          StampsElement.new browser.a css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        end

        def total_number_of_pages
          label = (StampsElement.new browser.divs css: "div[id^=tbtext-]").last
          number_str=label.text
          number = number_str.scan /\d+/
          number.last.to_s
        end
      end
    end
  end
end
