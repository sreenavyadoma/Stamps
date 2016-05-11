module Orders
  module Toolbar
    class Toolbar < OrdersObject
      class SettingsMenu < Print::Postage::PrintObject
        def collapse_button
          StampsButton.new @browser.span :css => "span[class*=sdc-icon-settings]"
        end

        def select menu_item
          dd = collapse_button
          case menu_item.downcase
            when /settings/
              selection = StampsLabel.new(@browser.span :text => "General Settings")
              modal = Orders::GeneralSettings.new @browser
            when /stores/
              selection = StampsLabel.new(@browser.span :text => "Add/Edit Stores")
              modal = Orders::Stores::ManageStores.new @browser
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

      class MoveMenu < OrdersObject
        class MoveConfirmation < OrdersObject
          def present?
            browser_helper.present? @browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
          end

          def move_label
            StampsLabel.new @browser.span Orders::Locators::ToolBar::confirmation_modal_move_label
          end

          def cancel_label
            StampsLabel.new @browser.span Orders::Locators::ToolBar::confirmation_modal_cancel_label
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

        def drop_down
          StampsButton.new @browser.span Orders::Locators::ToolBar::move
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

          confirmation = MoveConfirmation.new @browser
          dd = drop_down
          selection_label = StampsLabel.new @browser.span :text => selection_str

          10.times{
            dd.safe_click unless selection_label.present?
            selection_label.safe_click
            return confirmation if confirmation.present?
          }

          stop_test "Unable to select #{selection} from Move menu."
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

      class PerPage < OrdersObject

        def text_box
          StampsTextbox.new @browser.text_field(id: "sdc-batch-grid-pagingtoolbar-combobox-inputEl")
        end

        def select selection
          dd = StampsButton.new @browser.div(id: "sdc-batch-grid-pagingtoolbar-combobox-trigger-picker")
          per_page = StampsLabel.new @browser.li(text: selection)
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

      class AddButton < OrdersObject
        def button
          StampsButton.new @browser.span Orders::Locators::ToolBar::add
        end

        def click
          order_details = Orders::Details::DetailsForm.new @browser
          grid = Orders::Grid::OrdersGrid.new @browser
          add_button = button

          # Initializing Order Database
          initializing_db = StampsLabel.new @browser.div :text => "Initializing Order Database"
          nav_bar = Orders::Navigation::NavigationBar.new @browser

          sleep 2
          grid.checkbox.uncheck 1

          old_id = grid.order_id.row 1
          log.info "Row 1 Order ID #{old_id}"
          15.times do |count|
            begin
              add_button.safe_click
              sleep 2
              if initializing_db.present?
                log.info initializing_db.text
              else
                if order_details.present?
                  new_id = grid.order_id.row 1
                  log.info "Add #{(order_details.present?)?"successful!":"failed!"}  -  Old Grid 1 ID: #{old_id}, New Grid 1 ID: #{new_id}"
                  return order_details
                end
              end
            rescue
              #ignore
            end
          end

          if initializing_db.present?
            message = "\n*****  #{initializing_db.text}  *****\nUser #{nav_bar.username.text} is NOT setup correctly in ShipStation.  Check that this user's email is unique."
            log.info message
            stop_test message
          end

          stop_test "Unable to Toolbar: Adds!" unless order_details.present?
        end

        def tooltip
          btn = button
          tooltip_element = StampsLabel.new (@browser.div id: 'ext-quicktips-tip-innerCt')
          btn.hover
          btn.hover
          15.times do
            btn.hover
            sleep 1
            if tooltip_element.present?
              log.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      def print_modal
        open_window Orders::PrintModal.new @browser
      end

      def open_window window
        return window if window.present?
        print = StampsButton.new ((@browser.spans :css => "div[id^=toolbar-][id$=-targetEl]>a>span>span>span")[1])

        print.click
        sleep 1
        return window if window.present?

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
            print.click
            sleep 1
          rescue
            #ignore
          end

          if install_plugin_error.present?
            install_plugin_error.close
            return nil
          end
        end

        return window if window.present?
        #stop_test "Unable to open Print Window.  There might be errors in printing OR order is not ready for printing.  Check your test."
      end

      def add
        AddButton.new @browser
      end

      def move
        MoveMenu.new @browser
      end

      def refresh_orders
        button = StampsButton.new @browser.span(css: "a[data-qtip*='Refresh Orders']>span>span>span[id$=btnInnerEl]")
        importing_order = Orders::Stores::ImportingOrdersModal.new @browser

        button.safe_click
        sleep 1
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
        button.safe_click
        sleep 1
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
        button.safe_click
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

      def import
        button = StampsButton.new @browser.span(css: "a[data-qtip*='Import']>span>span>span[id$=btnIconEl]")
        modal = ImportOrders.new @browser
        5.times do
          button.safe_click
          return modal if modal.present?
        end
      end

      def wait_until_present
        browser_helper.wait_until_present @browser.span Orders::Locators::ToolBar::add
      end

      def present?
        browser_helper.present? @browser.span Orders::Locators::ToolBar::add
      end


      #============================


      def per_page
        PerPage.new @browser
      end

      def settings
        SettingsMenu.new @browser
      end

      def reprint
        button = StampsButton.new @browser.span(text: "Reprint")
        modal = RePrintModal.new @browser
        label_unavailable = LabelUnavailable.new @browser
        15.times do
          return modal if modal.present?
          return label_unavailable if label_unavailable.present?
          button.safe_click
        end
      end

      def print_invalid_address
        open_window InvalidAddressError.new(@browser)
      end

      def print_expecting_error *args
        error_window = IncompleteOrderError.new(@browser)
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

      def browser_settings_button
        StampsButton.new (@browser.span :css => "span[class*=sdc-icon-settings]")
      end

      def usps_intl_terms
        USPSTermsModal.new @browser
      end

      def settings_modal
        SettingsModal.new(@browser)
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
        text_box = StampsTextbox.new field
        text_box
      end

      def first_page
        field = @browser.span :css => "span[class*=x-tbar-page-first]"
        label = StampsLabel.new field
        label
      end

      def first_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = StampsLabel.new field
        label.disabled?
      end

      def previous_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-prev]"
      end

      def previous_page_disabled
        field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
        label = StampsLabel.new field
        label.disabled?
      end

      def next_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-next]"
      end

      def last_page
        StampsLabel.new field @browser.span :css => "span[class*=x-tbar-page-last]"
      end

      def last_page_disabled
        StampsLabel.new @browser.a :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      end

      def total_number_of_pages
        label = (StampsLabel.new @browser.divs :css => "div[id^=tbtext-]").last
        number_str=label.text
        number = number_str.scan /\d+/
        number.last.to_s
      end
    end
  end
end