module Stamps
  module Orders
    module Toolbar
      class PrintIncompleteOrderError < Browser::Modal
        attr_reader :window_title, :ok_btn, :error_message_label

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'Incomplete Order')
          @ok_btn ||= ElementWrapper.new browser.span(text: "OK")
          @error_message_label ||= browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def ok
          ok_btn.click_while_present
        end

        def error_message
          element_helper.text error_message_label
        end

        def error_message_p1
          element_helper.text error_message_label.ps[0]
        end

        def error_message_p2
          element_helper.text error_message_label.ps[1]
        end
      end

      class PrintMultiOrderError < Browser::Modal
        attr_reader :window_title, :error_message_label

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'Order Error')
          @error_message_label ||= browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def error_message
          element_helper.text error_message_label
        end
      end

      class PrintMultiOrderSomeHasError < PrintMultiOrderError
        attr_reader :continue_btn, :cancel_btn

        def initialize param
          super param
          @continue_btn ||= ElementWrapper.new browser.span(text: 'Continue')
          @cancel_btn ||= ElementWrapper.new browser.span(text: 'Cancel')
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
          element_helper.text error_message_label.ps[0]
        end

        def error_message_p2
          element_helper.text error_message_label.ps[1]
        end
      end

      class PrintMultiOrderAllHaveError < PrintMultiOrderError
        attr_reader :ok_btn

        def initialize param
          super param
          @ok_btn ||= ElementWrapper.new browser.span(text: "OK")
        end

        def present?
          ok_btn.present? && window_title.present?
        end

        def ok
          ok_btn.click_while_present
        end
      end

      class UspsPrivacyActStatement < Browser::Modal
        attr_reader :window_title, :message_label, :ok_btn

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'USPS Privacy Act Statement')
          @message_label ||= ElementWrapper.new browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
          @ok_btn ||= ElementWrapper.new browser.span(text: "OK")
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def text
          message_label.text
        end

        def ok
          ok_btn.click_while_present
        end
      end

      class USPSTerms < Browser::Modal
        attr_reader :window_title, :i_agree_btn, :cancel_btn, :privacy_act_link

        def initialize param
          super param
          @window_title ||= ElementWrapper.new browser.div(text: 'USPS Terms')
          @i_agree_btn ||= ElementWrapper.new browser.span(text: "I Agree")
          @cancel_btn ||= ElementWrapper.new browser.span(text: "Cancel")
          @privacy_act_link ||= ElementWrapper.new browser.a(text: "USPS Privacy Act Statement")
        end

        def present?
          window_title.present?
        end

        def wait_until_present *args
          window_title.safely_wait_until_present *args
        end

        def i_agree
          i_agree_btn.click_while_present
        end

        def cancel
          cancel_btn.click_while_present
        end

        def text_p1
          #"One or more orders is missing the following acknowledgement. Please agree to the following prior to printing these orders:"
          element_helper.text browser.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div").first
        end

        def text_p2
          element_helper.text browser.divs(css: "div[id^=uspstermsdialog-][id$=-body]>div>div>div>div>div")[1]
        end

        def dont_show_this_again
          field = browser.label(text: "Don't show this again.")
          verify_field = field.parent.parent.parent
          CheckboxElement.new field, verify_field, "class", "checked"
        end

        def usps_privacy_act_statement
          privacy_act = UspsPrivacyActStatement.new param
          10.times do
            privacy_act_link.safe_click
            privacy_act.wait_until_present 2
            return privacy_act if privacy_act.present?
          end
          privacy_act.present?.should be true
        end
      end

=begin

        private
        def usps_terms_modal
          browser.div(text: "USPS Terms")
        end

        def checkbox_array
          browser.spans css: 'span[id^=checkbox]'
        end

        def i_agree_button
          browser.span css: 'span[id*=agree]'
        end

        def cancel_button
          browser.span css: 'span[id*=cancel]'
        end

        def dont_show_again_checkbox
          checkbox_array[1]
        end

        public

        def is_usps_terms_modal_present
          usps_terms_modal.present?
        end

        def click_i_agree_button
          element_helper.safe_click i_agree_button
        end

        def click_cancel_button
          element_helper.safe_click cancel_button
        end

        def check_dont_show_again_checkbox
          element_helper.safe_click dont_show_again_checkbox
        end
=end

      class ShipStationServerError < Browser::Modal
        def window_title
          browser.divs(text: 'Server Error').first
        end

        def present?
          window_title.present?
        end

        def text
          element_helper.text browser.divs(css: "div[class*=sdc-warning]>div[id$=outerCt]>div").first
        end
      end

      class Toolbar < Browser::Modal
        attr_reader :print_btn, :add, :move
        def initialize param
          super param
          @print_btn ||= ToolbarPrintButton.new param
          @add ||= AddButton.new param
          @move ||= MoveMenu.new param
        end

        class ToolbarPrintButton < Browser::Modal
          attr_reader :print_order_btn, :orders_print_modal, :incomplete_order_modal, :usps_terms_modal,
                      :multi_order_some_error, :multi_order_all_error

          def initialize param
            super param
            @orders_print_modal = Stamps::Orders::PrintModal.new param
            @print_order_btn ||= ElementWrapper.new browser.a(css: "div[id^=app-main]>div[id^=toolbar]>div>div>a[data-qtip*=Print]")
            @incomplete_order_modal ||= PrintIncompleteOrderError.new param
            @multi_order_some_error ||= PrintMultiOrderSomeHasError.new param
            @multi_order_all_error ||= PrintMultiOrderAllHaveError.new param
            @usps_terms_modal ||= USPSTerms.new param
          end

          def present?
            print_order_btn.present?
          end

          def wait_until_present *args
            print_order_btn.safely_wait_until_present *args
          end

          def tooltip
            print_order_btn.hover
            print_order_btn.attribute_value("data-qtip").split("<br>").last
          end

          def print_modal
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
                text.should eql ""
              end

              if incomplete_order_modal.present?
                logger.error incomplete_order_modal.error_message_p1
                logger.error incomplete_order_modal.error_message_p2
                incomplete_order_modal.ok

                incomplete_order_modal.error_message_p2.should eql ""
              end

              if multi_order_some_error.present?
                logger.error multi_order_some_error.error_message_p1
                text = multi_order_some_error.error_message_p2
                logger.error text
                multi_order_some_error.continue
                text.should eql ""
              end

              if multi_order_all_error.present?
                text = multi_order_all_error.error_message
                logger.error text
                multi_order_all_error.ok
                text.should eql ""
              end

              return orders_print_modal if orders_print_modal.present?
            end

            expectation = "Print Modal is NO present" unless orders_print_modal.present?
            expectation.should eql "Print Modal is present"
          end

          def usps_terms
            expectation = "USPS Terms Modal is present"
            modal = open_window usps_terms_modal
            expectation = "USPS Terms Modal is NO present." unless modal.present?
            expectation.should eql "USPS Terms Modal is present"
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

            usps_terms.i_agree if usps_terms_modal.present?

            naws_plugin_error = NawsPluginError.new param
            error_connecting_to_plugin = ErrorConnectingToPlugin.new param
            install_plugin_error = ErrorInstallPlugin.new param

            10.times do
              begin
                return window if window.present?
                if error_connecting_to_plugin.present?
                  5.times{
                    error_connecting_to_plugin.ok
                    #order_grid.checkbox.check_all checked_rows_cache
                    break unless error_connecting_to_plugin.present?
                  }
                end

                if naws_plugin_error.present?
                  5.times{
                    naws_plugin_error.ok
                    #order_grid.checkbox.check_all checked_rows_cache
                    break unless naws_plugin_error.present?
                  }
                end

                return window if window.present?
                print_order_btn.click
                sleep 1
              rescue
                #ignore
              end

              if install_plugin_error.present?
                install_plugin_error.close
                window.present?.should be true
              end
            end

            window.present?.should be true
          end

          def print_expecting_error *args
            error_window = IncompleteOrderError.new param
            open_window error_window
            case args.length
              when 0
                error_window
              when 1
                error_window.error_message.include? error_message
              else
                stop_test "Illegal number of arguments."
            end
          end

          def print_invalid_address
            open_window InvalidAddressError.new param
          end
        end

        class SettingsMenu < Browser::Modal
          def collapse_button
            ElementWrapper.new browser.span css: "span[class*=sdc-icon-settings]"
          end

          def select menu_item
            dd = collapse_button
            case menu_item.downcase
              when /settings/
                selection = ElementWrapper.new(browser.span text: "General Settings")
                modal = Orders::GeneralSettings.new param
              when /stores/
                selection = ElementWrapper.new(browser.span text: "Add/Edit Stores")
                modal = Orders::Stores::ManageStores.new param
              else
                stop_test "Invalid Menu Selection - #{menu_item} is not recognized.  Valid selections are Settings or Stores."
            end

            20.times do
              sleep 1
              return modal if modal.present?
              dd.safe_click unless selection.present?
              #sleep 1
              selection.safe_click
              selection.safe_click
            end
            stop_test "Unable to Toolbar Settings Menu Selection - #{menu_item}"
          end

          def general_settings
            select "Settings"
          end

          def manage_stores
            select "Stores"
          end
        end

        class MoveMenu < Browser::Modal
          class MoveConfirmation < Browser::Modal
            def present?
              (browser.span Orders::Locators::ToolBar::confirmation_modal_move_label).present?
            end

            def move_label
              ElementWrapper.new browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
            end

            def cancel_label
              ElementWrapper.new browser.span Orders::Locators::ToolBar::confirmation_modal_cancel_label
            end

            def move
              label = move_label
              label.click_while_present
              Orders::FilterPanel.new param
            end

            def cancel
              label = cancel_label
              label.click_while_present
              Orders::FilterPanel.new param
            end
          end

          def drop_down
            ElementWrapper.new browser.span Orders::Locators::ToolBar::move
          end

          def select selection
            case selection
              when :shipped
                selection_str = "Move to Shipped"
              when :cancelled
                selection_str = "Move to Canceled"
              when :awaiting_shipment
                selection_str = "Move to Awaiting Shipment"
              else
                stop_test "#{selection} is not a valid value for Move Menu.  Valid values are :shipped, :canceled or :awaiting_shipment"
            end

            confirmation = MoveConfirmation.new param
            dd = drop_down
            selection_label = ElementWrapper.new browser.span text: selection_str

            10.times{
              dd.safe_click unless selection_label.present?
              selection_label.safe_click
              return confirmation if confirmation.present?
            }

            stop_test "Unable to select #{selection} from Move menu."
          end

          def tooltip
            btn = drop_down
            tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
            btn.element.hover
            btn.element.hover
            15.times do
              btn.element.hover
              sleep 1
              if tooltip_element.present?
                logger.info tooltip_element.text
                return tooltip_element.text
              end
            end
          end

          def to_shipped
            select :shipped
          end

          def to_canceled
            select :cancelled
          end

          def to_awaiting_shipment
            select :awaiting_shipment
          end
        end

        class PerPage < Browser::Modal
          def text_box
            TextBoxElement.new browser.text_field(id: "sdc-batch-grid-pagingtoolbar-combobox-inputEl")
          end

          def select selection
            dd = ElementWrapper.new browser.div(id: "sdc-batch-grid-pagingtoolbar-combobox-trigger-picker")
            per_page = ElementWrapper.new browser.li(text: selection)
            box = text_box
            10.times do
              dd.safe_click unless per_page.present?
              per_page.safe_click if per_page.present?
              return box.text if box.text.include? selection
            end
          end

          def x100
            select "100"
          end

          def x250
            select "250"
          end

          def x500
            select "500"
          end
        end

        class AddButton < Browser::Modal
          attr_reader :button, :initializing_db

          def initialize param
            super param
            @button ||= ElementWrapper.new browser.span text: 'Add'
            @initializing_db ||= ElementWrapper.new browser.div text: "Initializing Order Database"

          end

          def order_details
            details = Orders::Details::SingleOrderDetails.new param # keep this here
            grid = Orders::Grid::OrdersGrid.new param
            nav_bar = Navigation::NavigationBar.new param
            server_error = ShipStationServerError.new param

            logger.info "Row 1 Order ID #{grid.order_id.row 1}. Adding new order..."
            8.times do |count|
              begin
                button.safe_click

                if initializing_db.present?
                  30.times do
                    logger.info initializing_db.text
                    sleep1
                    break unless initializing_db.present?
                  end
                end

                "Server Error: #{server_error.text}".should eql "" if server_error.present?

                details.wait_until_present 7

                if details.present?
                  details_order_id = details.toolbar.order_id
                  grid_order_id = grid.order_id.row 1

                  logger.info "Add #{(details_order_id==grid_order_id)?"successful":"failed"} on try #{count+1}"
                  return details if details_order_id==grid_order_id
                end

                "Server Error: #{server_error.text}".should eql "" if server_error.present?

              rescue
                #ignore
              end
            end

            "Server Error: #{server_error.text}".should eql "" if server_error.present?

            if initializing_db.present?
              message = "\n*****  #{initializing_db.text}  *****\nShip Station might be down. \nUSERNAME: #{nav_bar.username.text} "
              logger.info message
              message.should eql ""
            end

            "Server Error: #{server_error.text}".should eql "" if server_error.present?

            "Unable to Add new orders. Single Order Details Panel did not open upon clicking Add button." unless details.present?
          end

          def tooltip
            tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
            button.element.hover
            button.element.hover
            15.times do
              button.element.hover
              sleep 1
              if tooltip_element.present?
                logger.info tooltip_element.text
                return tooltip_element.text
              end
            end
          end
        end

        def refresh_orders
          button = ElementWrapper.new browser.span(css: "a[data-qtip*='Refresh Orders']>span>span>span[id$=btnInnerEl]")
          importing_order = Orders::Stores::ImportingOrdersModal.new param

          button.safe_click
          sleep 1
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
          button.safe_click
          sleep 1
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
          button.safe_click
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
          button = ElementWrapper.new browser.span(css: "a[data-qtip*='Import']>span>span>span[id$=btnIconEl]")
          modal = ImportOrders.new param
          5.times do
            button.safe_click
            return modal if modal.present?
          end
        end

        def present?
          print_btn.present?
        end

        def wait_until_present *args
          print_btn.wait_until_present *args
        end

        def usps_intl_terms
          USPSTerms.new param
        end

        #============================

        def per_page
          PerPage.new param
        end

        def settings
          SettingsMenu.new param
        end

        def reprint
          button = ElementWrapper.new browser.span(text: "Reprint")
          modal = RePrintModal.new param
          label_unavailable = LabelUnavailable.new param
          15.times do
            return modal if modal.present?
            return label_unavailable if label_unavailable.present?
            button.safe_click
          end
        end

        def browser_settings_button
          ElementWrapper.new (browser.span css: "span[class*=sdc-icon-settings]")
        end

        def settings_modal
          SettingsModal.new param
        end

        def page_count
          (browser.divs css: "div[id^=tbtext]").last
        end

        def page_number
          field = browser.text_field css: "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
          text_box = TextBoxElement.new field
          text_box
        end

        def first_page
          field = browser.span css: "span[class*=x-tbar-page-first]"
          label = ElementWrapper.new field
          label
        end

        def first_page_disabled
          field = browser.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = ElementWrapper.new field
          label.element.disabled?
        end

        def previous_page
          ElementWrapper.new element browser.span css: "span[class*=x-tbar-page-prev]"
        end

        def previous_page_disabled
          field = browser.a  css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
          label = ElementWrapper.new field
          label.element.disabled?
        end

        def next_page
          ElementWrapper.new element browser.span css: "span[class*=x-tbar-page-next]"
        end

        def last_page
          ElementWrapper.new element browser.span css: "span[class*=x-tbar-page-last]"
        end

        def last_page_disabled
          ElementWrapper.new browser.a css: "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        end

        def total_number_of_pages
          label = (ElementWrapper.new browser.divs css: "div[id^=tbtext-]").last
          number_str=label.text
          number = number_str.scan /\d+/
          number.last.to_s
        end
      end
    end
  end
end
