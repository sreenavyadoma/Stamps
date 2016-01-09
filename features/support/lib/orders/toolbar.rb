module Orders
  module Toolbar
    class MoveConfirmation < OrdersObject
      def present?
        browser_helper.present? @browser.span Locators::ToolBar::confirmation_modal_move_label
      end

      def move_label
        Label.new @browser.span Locators::ToolBar::confirmation_modal_move_label
      end

      def cancel_label
        Label.new @browser.span Locators::ToolBar::confirmation_modal_cancel_label
      end

      def move
        label = move_label
        label.click_while_present
        Orders::FilterPanel.new @browser
      end

      def cancel
        label = cancel_label
        label.click_while_present
        Orders::FilterPanel.new @browser
      end
    end

    class MoveMenu < OrdersObject

      def drop_down
        Button.new @browser.span Locators::ToolBar::move
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
            raise "#{selection} is not a valid value for Move Menu.  Valid values are :shipped, :canceled or :awaiting_shipment"
        end

        confirmation = MoveConfirmation.new @browser
        dd = drop_down
        selection_label = Label.new @browser.span :text => selection_str

        10.times{
          dd.safe_click unless selection_label.present?
          selection_label.safe_click
          return confirmation if confirmation.present?
        }

        raise "Unable to select #{selection} from Move menu."
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

    #
    #  Contains Add/Edit buton for orders.
    #
    class Toolbar < OrdersObject

      def print
        @print_window ||= Orders::PrintModal.new @browser
        open_window @print_window
      end

      def print_invalid_address
        open_window InvalidAddressError.new(@browser)
      end

      def print_expecting_error *args
        error_window = OrderErrors.new(@browser)
        open_window error_window
        case args.length
          when 0
            error_window
          when 1
            error_window.error_message.include? error_message
          else
            raise "Illegal number of arguments."
        end
      end

      def open_window window
        return window if window.present?
        print = print_button

        print.click

        usps_terms = USPSTermsModal.new @browser

        if usps_terms.is_usps_terms_modal_present
          usps_terms.check_dont_show_again_checkbox
          usps_terms.click_i_agree_button
        end

        #order_grid = Orders::Grid::OrdersGrid.new @browser
        #checked_rows_cache = order_grid.checkbox.checked_rows

        naws_plugin_error = NawsPluginError.new @browser
        error_connecting_to_plugin = ErrorConnectingToPlugin.new @browser
        install_plugin_error = ErrorInstallPlugin.new @browser

        20.times do
          if install_plugin_error.present?
            install_plugin_error.close
            return nil
          end

          begin
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
            #order_grid.checkbox.check_all checked_rows_cache
            print.click
          rescue
            #ignore
          end
        end

        return window if window.present?
        raise "Unable to open Print Window.  There might be errors in printing of order is not ready for printing.  Check your test."
      end

      def add
        order_details = Orders::Details::OrderDetails.new @browser
        grid = Orders::Grid::OrdersGrid.new @browser
        add_button = Button.new @browser.span Locators::ToolBar::add

        # Initializing Order Database
        initializing_db = Label.new @browser.div :text => "Initializing Order Database"
        nav_bar = NavBar.new @browser

        grid.order_date.sort.descending
        sleep 2
        grid.checkbox.uncheck 1

        old_id = grid.order_id.row 1
        log.info "Row 1 Order ID #{old_id}"
        20.times do |count|
          begin
            add_button.safe_click
            sleep 3
            log.info initializing_db.text if initializing_db.present?
            if order_details.present?
              new_id = grid.order_id.row 1
              add_successful = old_id != new_id
              log.info "Add #{(add_successful)?"successful!":"failed!"}  -  Old Grid 1 ID: #{old_id}, New Grid 1 ID: #{new_id}"
              return order_details if add_successful
            end
            sleep 1
          rescue
            #ignore
          end
        end

        if initializing_db.present?
          message = "\n*****  #{initializing_db.text}  *****\nUser #{nav_bar.username.text} is NOT setup correctly in ShipStation.  Check that this user's email is unique."
          log.info message
          raise message
        end

        raise "Unable to I Add a new orders!" unless order_details.present?
      end

      def move
        Orders::Toolbar::MoveMenu.new @browser
      end

      def browser_settings_button
        Button.new (@browser.span :css => "span[class*=sdc-icon-settings]")
      end

      def print_button
        Button.new ((@browser.spans :css => "div[id^=toolbar-][id$=-targetEl]>a>span>span>span")[1])
      end

      def usps_intl_terms
        USPSTermsModal.new @browser
      end

      def wait_until_present
        browser_helper.wait_until_present @browser.span Locators::ToolBar::add
      end

      def present?
        browser_helper.present? @browser.span Locators::ToolBar::add
      end

      def settings_modal
        SettingsModal.new(@browser)
      end

      def open_settings
        sleep 1
        browser_settings_button.click
      end

      def page_count
        divs = @browser.divs :css => "div[id^=tbtext]"
        div = divs.last
        present = browser_helper.present? div
        log.info "Page count: #{browser_helper.text div}"
        div
      end

      def page_number
        field = @browser.text_field :css => "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
        text_box = Textbox.new field
        text_box
      end

      def first_page
        field = @browser.span :css => "span[class*=x-tbar-page-first]"
        label = Label.new field
        label
      end

      def first_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = Label.new field
        label.disabled?
      end

      def previous_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-prev]"
      end

      def previous_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = Label.new field
        label.disabled?
      end

      def next_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-next]"
      end

      def last_page
        Label.new field @browser.span :css => "span[class*=x-tbar-page-last]"
      end

      def last_page_disabled
        Label.new @browser.a :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      end

      def total_number_of_pages
        label = (Label.new @browser.divs :css => "div[id^=tbtext-]").last
        number_str=label.text
        number = number_str.scan /\d+/
        number.last.to_s
      end

      def per_page_dd
        #browser, drop_down_button, selection_field_type, drop_down_input
        buttons = @browser.divs :css => "div[id^=combo-][id$=trigger-picker]"
        drop_down_button = buttons.first
        drop_down_input = @browser.text_field :css => "input[name^=combo]"
        Dropdown.new @browser, drop_down_button, :li, drop_down_input
      end
    end
  end
end