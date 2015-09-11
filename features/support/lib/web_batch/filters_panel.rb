module Batch
  #
  #
  #
  class Filters < BrowserObject
    private

    def filter_panel
      @browser.div :css => 'div[id*=filterpanel][class*=x-panel-dark-grey]'
    end

    def closed_filter_panel
      @browser.div :css => 'div[id*=title][class*=x-title-text-dark-grey]'
    end

    def filter_panel_border
      @browser.div :css => 'div[id*=filterpanel][class*=x-splitter]'
    end

    def filter_panel_border_arrow
      @browser.div :css => 'div[id*=filterpanel][class*=x-layout-split-left]'
    end

    def filter_panel_header_arrow
      @browser.img :css => 'img[id*=tool][class*=x-tool-expand-right]'
    end

    def filter_panel_header_name
      @browser.div :css => 'div[id*=title][class*=x-title-text-dark-grey]'
    end

    def selected_filter_button
      @browser.table :css => 'table[id*=badgebutton][class*=sdc-badgebutton-selected]'
    end

    def shipped_button
      @browser.div(:text => "Shipped")
    end

    def awaiting_shipment_button
      @browser.div(:text => "Awaiting Shipment")
    end



    public

    def get_closed_filter_name
      browser_helper.text filter_panel_header_name, 'Filter Panel Header Name'
    end

    def get_arrow_direction
      style =  browser_helper.style filter_panel_border_arrow, "background-image"
      log style
      if style.include? 'mini-left.png'
        return 'left'
      elsif style.include? 'mini-right.png'
        return 'right'
      end
      #log "Test #{(test_stat)?'Passed':'Failed'}"
      #arrow_direction_url = filter_panel_border_arrow.x-layout-split-left "background-image"
      # arrow_direction = app_content.x-layout-split-left "background-image"
      # url("images/util/splitter/mini-left.png");
    end

    def filter filter
      case filter.downcase
        when 'awaiting shipment'
          awaiting_shipment_button = Button.new @browser.div :text => "Awaiting Shipment"
          5.times {
            awaiting_shipment_button.safe_click
            break if get_selected_filter_text == 'Awaiting Shipment'
          }
        when 'shipped'
          awaiting_shipment_button = Button.new @browser.div :text => "Shipped"
          5.times {
            awaiting_shipment_button.safe_click
            break if get_selected_filter_text == 'Shipped'
          }
          else raise "illegal parameter exception"
      end
      browser_helper.click @browser.div(:text => filter)
      Grid.new @browser
    end

    def click_closed_filter_panel
      browser_helper.click closed_filter_panel
    end

    def get_selected_filter_text
      browser_helper.text selected_filter_button, 'Selected Filter'
    end

    def is_order_grid_filtered(filter)
      if filter == "Shipped"
        return are_ship_dates_full
      elsif filter == "Awaiting Shipment"
        return are_ship_dates_empty
      end
    end

    def get_print_button_status
      is_print_button_present
    end

    def is_filter_panel_present
      sleep 5
      browser_helper.present? filter_panel
    end

    def are_filter_buttons_present
      (browser_helper.present? awaiting_shipment_button) && (browser_helper.present? shipped_button)
    end

    def click_border_arrow
      browser_helper.click filter_panel_border_arrow
    end


    def is_header_arrow_present
      browser_helper.present? filter_panel_header_arrow
    end

    def are_filter_links_present
      (browser_helper.present? filter_panel_header_name) || (browser_helper.present? filter_panel_header_arrow)
    end

    def double_click_border
      browser_helper.double_click filter_panel_border
    end

    def click_filter_panel_name
      browser_helper.click filter_panel_header_name
    end



  end
end