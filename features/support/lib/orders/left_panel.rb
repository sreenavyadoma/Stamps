module Stamps
  module Orders
    module LeftPanel
      class CollapseButton < Modal
        attr_reader :button, :tooltip_element

        def initialize param
          super param
          @button = ElementWrapper.new (browser.span css: "span[id^=menuitem-][id$=-textEl]")
          @tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.safe_click
              sleep 1
              break unless button.present?
            rescue
              #ignore
            end
          end
        end

        def tooltip
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

      class ExpandButton < Modal
        attr_reader :button, :tooltip_element

        def initialize param
          super param
          @button = ElementWrapper.new (browser.img css: 'img[class*=tool-expand-right]')
          @tooltip_element = ElementWrapper.new (browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.safe_click
              sleep 1
              break unless button.present?
            rescue
              #ignore
            end
          end
        end

        def tooltip
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

      class FilterMenuItem < Modal
        attr_reader :collapse, :expand

        def initialize param
          super param
          @collapse = CollapseButton.new param
          @expand = ExpandButton.new param
        end
      end

      class SearchResults < Modal
        attr_reader :label, :remove_button, :count_label

        def initialize param
          super param
          @label = ElementWrapper.new browser.div(text: "Search Results")
          @remove_button = ElementWrapper.new browser.a(css: "a[data-qtip=Remove]")
          @count_label = ElementWrapper.new browser.div(css: "div[id=left-filter-panel-targetEl]>table>tbody>tr>td:nth-child(3)>div>div")
        end

        def present?
          label.present?
        end

        def remove
          remove_button.click_while_present
        end

        def count
          "Test Error: Check your test flow.".should be "Search Results is not present on Left Filter Panel.Did you forget to do a search first?" unless present?
          count_label.text
        end
      end

      class SearchOrders < Modal
        attr_reader :textbox, :search_button, :search_results

        def initialize param
          super param
          @textbox = TextboxElement.new browser.text_field(css: "input[placeholder='Search Orders']")
          @search_button = ElementWrapper.new browser.div(css: "div[id^=textfield-][id$=-trigger-search]")
          @search_results = SearchResults.new param
        end

        def present?
          search_button.present?
        end

        def search str
          20.times do
            textbox.set str
            search_button.safe_click
            return search_results if search_results.present?
          end
          search_results.present?.should be true
        end
      end

      class LeftFilterPanel < Modal
        attr_reader :filter_panel, :closed_filter_panel, :filter_panel_border_arrow, :filter_panel_header_arrow, :filter_panel_header_name,
                    :selected_filter_button, :cancelled_field, :search_orders_modal, :search_results

        def initialize param
          super param
          @menu_item ||= FilterMenuItem.new param
          @search_orders_modal ||= SearchOrders.new param
          @search_results = SearchResults.new param

          @filter_panel = ElementWrapper.new browser.div(css: "div[id*=filterpanel][class*=x-panel-dark-grey]")
          @closed_filter_panel = ElementWrapper.new browser.div(css: "div[id*=title][class*=x-title-text-dark-grey]")
          @filter_panel_border_arrow = ElementWrapper.new browser.div(css: "div[id*=filterpanel][class*=x-layout-split-left]")
          @filter_panel_header_arrow = ElementWrapper.new browser.img(css: "img[id*=tool][class*=x-tool-expand-right]")
          @filter_panel_header_name = ElementWrapper.new browser.div(css: "div[id*=title][class*=x-title-text-dark-grey]")
          @selected_filter_button = ElementWrapper.new browser.table(css: "table[id*=badgebutton][class*=sdc-badgebutton-selected]")
          @cancelled_field = ElementWrapper.new browser.div(text: "Canceled")
        end

        def search_orders str
          search_orders_modal.search str
        end

        def awaiting_shipment_count
          (element_helper.text (browser.divs css: "div.sdc-badge").last).to_i
        end

        def awaiting_shipment
          clickable = browser.divs(css: "div[class*='table-cell-inner sdc-badgebutton-text']")[0]
          verify = clickable.parent.parent.parent.parent
          tab = SelectionElement.new(clickable, verify, "class", "selected")
          tab.select
          grid = OrdersGrid.new param
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
          element_helper.text filter_panel_header_name #, 'Filter Panel - Panel Header Name'
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
          element_helper.safe_click closed_filter_panel
        end

        def get_selected_filter_text
          element_helper.text selected_filter_button #, 'Selected Filter'
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
          element_helper.safe_click filter_panel_border_arrow
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
end