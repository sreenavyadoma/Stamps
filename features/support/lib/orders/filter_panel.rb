module Orders


#todo-rob
  class FilterPanel < BrowserObject
    private

    def filter_panel
      @browser.div :css => "div[id*=filterpanel][class*=x-panel-dark-grey]"
    end

    def closed_filter_panel
      @browser.div :css => "div[id*=title][class*=x-title-text-dark-grey]"
    end

    def filter_panel_border
      @browser.div :css => "div[id*=filterpanel][class*=x-splitter-vertical]"
    end

    def filter_panel_border_arrow
      @browser.div :css => "div[id*=filterpanel][class*=x-layout-split-left]"
    end

    def filter_panel_header_arrow
      @browser.img :css => "img[id*=tool][class*=x-tool-expand-right]"
    end

    def filter_panel_header_name
      @browser.div :css => "div[id*=title][class*=x-title-text-dark-grey]"
    end

    def selected_filter_button
      @browser.table :css => "table[id*=badgebutton][class*=sdc-badgebutton-selected]"
    end

    def cancelled_field
      @browser.div :text => "Canceled"
    end

    public

    def awaiting_shipment_count
      browser_helper.text(@browser.div :css => "div.sdc-badge").to_i
    end

    def awaiting_shipment
      table = (@browser.tables :css => "table[id^=badgebutton]").first
      div = table.tbody.tr.tds.first.div
      tab = Stamps::Browser::Selection.new div, table, "class", "selected"
      tab.select
      sleep 1
      Orders::Grid::OrdersGrid.new @browser
    end

    def shipped
      table = (@browser.tables :css => "table[id^=badgebutton]")[1]
      div = table.tbody.tr.tds.first.div
      tab = Stamps::Browser::Selection.new div, table, "class", "selected"
      tab.select
      sleep 1
      Orders::Grid::OrdersGrid.new @browser
    end

    def cancelled
      table = (@browser.tables :css => "table[id^=badgebutton]").last
      div = table.tbody.tr.tds.first.div
      tab = Stamps::Browser::Selection.new div, table, "class", "selected"
      tab.select
      sleep 1
      Orders::Grid::OrdersGrid.new @browser
    end

    def get_closed_filter_name
      browser_helper.text filter_panel_header_name, 'Filter Panel Header Name'
    end

    def get_arrow_direction
      style =  browser_helper.style filter_panel_border_arrow, "background-image"
      log.info style
      if style.include? 'mini-left.png'
        return 'left'
      elsif style.include? 'mini-right.png'
        return 'right'
      end
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

    def is_filter_panel_present
      sleep 2
      browser_helper.present? filter_panel
    end

    def are_filter_buttons_present
      (browser_helper.present? awaiting_shipment_tab) && (browser_helper.present? shipped_tab)
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

    def click_filter_
  end
  end
end
