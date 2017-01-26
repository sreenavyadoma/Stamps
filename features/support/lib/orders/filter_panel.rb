module Stamps
  module Orders
    module LeftPanel
      class CollapseButton < Browser::Modal
        attr_reader :button, :tooltip_element

        def initialize(param)
          super(param)
          @button = BrowserElement.new (browser.span css: "span[id^=menuitem-][id$=-textEl]")
          @tooltip_element = BrowserElement.new (browser.div id: 'ext-quicktips-tip-innerCt')
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

      class ExpandButton < Browser::Modal
        attr_reader :button, :tooltip_element

        def initialize(param)
          super(param)
          @button = BrowserElement.new (browser.img css: 'img[class*=tool-expand-right]')
          @tooltip_element = BrowserElement.new (browser.div id: 'ext-quicktips-tip-innerCt')
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

      class FilterMenuItem < Browser::Modal
        attr_reader :collapse, :expand

        def initialize(param)
          super(param)
          @collapse = CollapseButton.new(param)
          @expand = ExpandButton.new(param)
        end
      end

      class SearchResults < Browser::Modal
        attr_reader :label, :remove_button, :count_label

        def initialize(param)
          super(param)
          @label = BrowserElement.new browser.div(text: "Search Results")
          @remove_button = BrowserElement.new browser.a(css: "a[data-qtip=Remove]")
          @count_label = BrowserElement.new browser.div(css: "div[id=left-filter-panel-targetEl]>table>tbody>tr>td:nth-child(3)>div>div")
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

      class SearchOrders < Browser::Modal
        attr_reader :textbox, :search_button, :search_results

        def initialize(param)
          super(param)
          @textbox = TextboxElement.new browser.text_field(css: "input[placeholder='Search Orders']")
          @search_button = BrowserElement.new browser.div(css: "div[id^=textfield-][id$=-trigger-search]")
          @search_results = SearchResults.new(param)
        end

        def present?
          search_button.present?
        end

        def search str
          20.times do
            textbox.set str
            search_button.safe_click
            search_button.safe_click
            search_button.safe_click
            if str.include? '@'
              search_button.send_keys :enter
              textbox.set str
              search_button.safe_click
              search_button.safe_click
              sleep 1
              search_button.safe_click
              search_button.safe_click
              sleep 1
              search_button.safe_click
              search_button.safe_click
              sleep 1
            end
            return search_results if search_results.present?
          end
          search_results.present?.should be true
        end
      end

      class FilterTab < Browser::Modal
        attr_reader :index
        def initialize(param, index)
          super(param)
          @index = index
        end

        def tabs
          browser.divs(css: "div#left-filter-panel-targetEl>table[style*=left]>tbody>tr>td>div[class*=sdc-badgebutton-text]")
        end

        def element
          tabs[index]
        end

        def select
          30.times do
            element_helper.safe_click(element)
            sleep(0.25)
            break if selected?
          end
          selected?.should be true
        end

        def selected?
          begin
            element.parent.parent.parent.parent.attribute_value("class").include?('selected')
          rescue
            false
          end
        end

        def text
          element_helper.text(element)
        end
      end

      class AwaitingShipmentTab < FilterTab
        def initialize(param)
          super(param, 0)
        end

        def count
          element_helper.text(browser.div(css: "div#left-filter-panel-targetEl>table[style*=left]>tbody>tr>td>div[class*=widget]>div[class=sdc-badge]")).to_i
        end
      end

      class ShippedTab < FilterTab
        def initialize(param)
          super(param, 1)
        end
      end

      class CanceledTab < FilterTab
        def initialize(param)
          super(param, 2)
        end
      end

      class OnHoldTab < FilterTab
        def initialize(param)
          super(param, 3)
        end
      end

      class FilterPanel < Browser::Modal
        attr_reader :search_orders_modal, :search_results, :awaiting_shipment, :shipped, :canceled, :on_hold

        def initialize(param)
          super(param)
          @awaiting_shipment = AwaitingShipmentTab.new(param)
          @shipped = ShippedTab.new(param)
          @canceled = CanceledTab.new(param)
          @on_hold = OnHoldTab.new(param)
          @search_orders_modal = SearchOrders.new(param)
          @menu_item = FilterMenuItem.new(param)
          @search_results = SearchResults.new(param)
        end

        def search_orders(str)
          search_orders_modal.search(str)
        end

        def selected_filter
          return awaiting_shipment.text if awaiting_shipment.selected?
          return shipped.text if shipped.selected?
          return canceled.text if canceled.selected?
          return on_hold.text if on_hold.selected?
          "At least one filter should have been selected.".should eql "Unable to return selected_filter text."
        end

        def collapse_panel

        end

        def expand_panel

        end
      end
    end
  end
end