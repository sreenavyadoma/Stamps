module Stamps
  module Orders
    module LeftPanel
      class CollapseButton < Browser::StampsModal
        attr_reader :button, :tooltip_element

        def initialize(param)
          super
          @button = StampsElement.new(browser.span css: "span[id^=menuitem-][id$=-textEl]")
          @tooltip_element = StampsElement.new(browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.click
              sleep(0.35)
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
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class ExpandButton < Browser::StampsModal
        attr_reader :button, :tooltip_element

        def initialize(param)
          super
          @button = StampsElement.new(browser.img css: 'img[class*=tool-expand-right]')
          @tooltip_element = StampsElement.new(browser.div id: 'ext-quicktips-tip-innerCt')
        end

        def click
          10.times do
            begin
              button.click
              sleep(0.35)
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
            sleep(0.35)
            if tooltip_element.present?
              logger.info tooltip_element.text
              return tooltip_element.text
            end
          end
        end
      end

      class FilterMenuItem < Browser::StampsModal
        attr_reader :collapse, :expand

        def initialize(param)
          super
          @collapse = CollapseButton.new(param)
          @expand = ExpandButton.new(param)
        end
      end

      class SearchResults < Browser::StampsModal
        attr_reader :label, :remove_button, :count_label

        def initialize(param)
          super
          @label = StampsElement.new browser.div(text: "Search Results")
          @remove_button = StampsElement.new browser.a(css: "a[data-qtip=Remove]")
          @count_label = StampsElement.new browser.div(css: "div[id=left-filter-panel-targetEl]>table>tbody>tr>td:nth-child(3)>div>div")
        end

        def present?
          label.present?
        end

        def remove
          remove_button.click_while_present
        end

        def count
          expect("Test Error: Check your test flow.").to be "Search Results is not present on Left Filter Panel.Did you forget to do a search first?" unless present?
          count_label.text
        end
      end

      class SearchOrders < Browser::StampsModal
        attr_reader :textbox, :search_button, :search_results

        def initialize(param)
          super
          @textbox = StampsTextBox.new browser.text_field(css: "input[placeholder='Search Orders']")
          @search_button = StampsElement.new browser.div(css: "div[id^=textfield-][id$=-trigger-search]")
          @search_results = SearchResults.new(param)
        end

        def present?
          search_button.present?
        end

        def search str
          20.times do
            textbox.set str
            search_button.click
            search_button.click
            search_button.click
            if str.include? '@'
              search_button.click
              textbox.set str
              search_button.click
              search_button.click
              sleep(0.35)
              search_button.click
              search_button.click
              sleep(0.35)
              search_button.click
              search_button.click
              sleep(0.35)
            end
            return search_results if search_results.present?
          end
          expect(search_results.present?).to be(true)
        end
      end

      module FilterTabHelper
        attr_accessor :element, :panel_name
        def selected?
          begin
            element.parent.parent.parent.parent.attribute_value("class").include?('selected')
          rescue
            false
          end
        end

        def text
          StampsElement.new(element).text
        end

        def select
          tab = StampsElement.new(element)
          40.times do
            tab.double_click
            tab.click
            sleep(0.25)
            break if selected?
          end
          expect(selected?).to be(true), "Unable to select Filter Panel: #{panel_name}"
          logger.info "Selected Filter Panel: #{panel_name}"
        end
      end

      class AwaitingShipmentTab < Browser::StampsModal
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Awaiting Shipment"
          @element = browser.divs(text: @panel_name).first
        end

        def count
          StampsElement.new(browser.div(css: "div#left-filter-panel-targetEl>table[style*=left]>tbody>tr>td>div[class*=widget]>div[class=sdc-badge]")).text.to_i
        end
      end

      class ShippedTab < Browser::StampsModal
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Shipped"
          @element = browser.divs(text: @panel_name).first
        end
      end

      class CanceledTab < Browser::StampsModal
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Canceled"
          @element = browser.divs(text: @panel_name).first
        end
      end

      class OnHoldTab < Browser::StampsModal
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "On Hold"
          @element = browser.divs(text: @panel_name).first
        end
      end

      class FilterPanel < Browser::StampsModal
        attr_reader :search_orders_modal, :search_results, :awaiting_shipment, :shipped, :canceled, :on_hold

        def initialize(param)
          super
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
          20.times do
            sleep(0.25)
            return awaiting_shipment.text if awaiting_shipment.selected?
            return shipped.text if shipped.selected?
            return canceled.text if canceled.selected?
            return on_hold.text if on_hold.selected?
          end
          expect("At least one filter should have been selected.").to eql "Unable to return selected_filter text."
        end

        def collapse_panel

        end

        def expand_panel

        end
      end
    end
  end
end