module Stamps
  module Orders
    class CollapseButton < Modal
      def button
        ElementWrapper.new (browser.span css: "span[id^=menuitem-][id$=-textEl]")
      end

      def click
        btn = button
        10.times do
          begin
            btn.safe_click
            sleep 1
            break unless btn.present?
          rescue
            #ignore
          end
        end
      end

      def tooltip
        btn = button
        tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
        btn.hover
        btn.hover
        15.times do
          btn.hover
          sleep 1
          if tooltip_element.present?
            logger.info tooltip_element.text
            return tooltip_element.text
          end
        end
      end
    end

    class ExpandButton < Modal

      def button
        ElementWrapper.new (browser.img css: 'img[class*=tool-expand-right]')
      end

      def click
        btn = button
        10.times do
          begin
            btn.safe_click
            sleep 1
            break unless btn.present?
          rescue
            #ignore
          end
        end
      end

      def tooltip
        btn = button
        tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
        btn.hover
        btn.hover
        15.times do
          btn.hover
          sleep 1
          if tooltip_element.present?
            logger.info tooltip_element.text
            return tooltip_element.text
          end
        end
      end

    end

    class FilterMenuItem < Modal

      def collapse
        CollapseButton.new param
      end

      def expand
        ExpandButton.new param
      end
    end

    class FilterPanel < Modal
      def filter_panel
        browser.div css: "div[id*=filterpanel][class*=x-panel-dark-grey]"
      end

      def closed_filter_panel
        browser.div css: "div[id*=title][class*=x-title-text-dark-grey]"
      end

      def filter_panel_border_arrow
        browser.div css: "div[id*=filterpanel][class*=x-layout-split-left]"
      end

      def filter_panel_header_arrow
        browser.img css: "img[id*=tool][class*=x-tool-expand-right]"
      end

      def filter_panel_header_name
        browser.div css: "div[id*=title][class*=x-title-text-dark-grey]"
      end

      def selected_filter_button
        browser.table css: "table[id*=badgebutton][class*=sdc-badgebutton-selected]"
      end

      def cancelled_field
        browser.div text: "Canceled"
      end

      def menu_item
        FilterMenuItem.new param
      end

      def awaiting_shipment_count
        browser_helper.text(browser.div css: "div.sdc-badge").to_i
      end

      def awaiting_shipment
        clickable = browser.divs(css: "div[class*='table-cell-inner sdc-badgebutton-text']")[0]
        verify = clickable.parent.parent.parent.parent
        tab = Stamps::Browser::SelectionElement.new clickable, verify, "class", "selected"
        tab.select
        grid = Orders::Grid::OrdersGrid.new param
        sleep 2
        grid.wait_until_present
        grid
      end

      def shipped
        clickable = browser.divs(css: "div[class*='table-cell-inner sdc-badgebutton-text']")[1]
        verify = clickable.parent.parent.parent.parent
        tab = Stamps::Browser::SelectionElement.new clickable, verify, "class", "selected"
        tab.select
        grid = Orders::Grid::OrdersGrid.new param
        sleep 2
        grid.wait_until_present
        grid
      end

      def cancelled
        clickable = browser.divs(css: "div[class*='table-cell-inner sdc-badgebutton-text']")[2]
        verify = clickable.parent.parent.parent.parent
        tab = Stamps::Browser::SelectionElement.new clickable, verify, "class", "selected"
        tab.select
        grid = Orders::Grid::OrdersGrid.new param
        sleep 2
        grid.wait_until_present
        grid
      end

      def get_closed_filter_name
        browser_helper.text filter_panel_header_name #, 'Filter Panel - Panel Header Name'
      end

      def get_arrow_direction
        style =  filter_panel_border_arrow.style filter_panel_border_arrow, "background-image"
        if style.include? 'mini-left.png'
          'left'
        elsif style.include? 'mini-right.png'
          'right'
        end
      end

      def click_closed_filter_panel
        browser_helper.safe_click closed_filter_panel
      end

      def get_selected_filter_text
        browser_helper.text selected_filter_button #, 'Selected Filter'
      end

      def is_order_grid_filtered(filter)
        if filter == "Shipped"
          return are_ship_dates_full
        elsif filter == "Awaiting Shipment"
          return are_ship_dates_empty
        end
      end

      def is_filter_panel_present?
        sleep 2
        filter_panel.present?
      end

      def click_border_arrow
        browser_helper.safe_click filter_panel_border_arrow
      end

      def is_header_arrow_present
        filter_panel_header_arrow.present?
      end

      def are_filter_links_present
        (filter_panel_header_name.present? ) || (filter_panel_header_arrow.present? )
      end

      def click_filter_
      end
    end
  end

end