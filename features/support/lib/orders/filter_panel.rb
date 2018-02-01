module Stamps
  module Orders
    module LeftPanel
      class CollapseButton < Browser::BaseCache
        #assign({})

        def button
          cache[:button] = StampsField.new(browser.span css: "span[id^=button-][id$=-btnIconEl]") if cache[:button].nil? || !cache[:button].present?
          cache[:button]
        end

        def tooltip_field
          cache[:tooltip_field] = StampsField.new(browser.div id: 'ext-quicktips-tip-innerCt') if cache[:tooltip_field].nil? || !cache[:tooltip_field].present?
          cache[:tooltip_field]
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
          button.field.hover
          button.field.hover
          15.times do
            button.field.hover
            sleep(0.35)
            if tooltip_field.present?
              logger.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      class ExpandButton < Browser::BaseCache
        #assign({})

        def button
          cache[:button].nil? || !cache[:button].present? ? cache[:button] = StampsField.new(browser.img(css: 'img[class*=tool-expand-right]')) : cache[:button]
        end

        def tooltip_field
          cache[:tooltip_field] = StampsField.new(browser.div(id: 'ext-quicktips-tip-innerCt')) if cache[:tooltip_field].nil? || !cache[:tooltip_field].present?
          cache[:tooltip_field]
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
          button.field.hover
          button.field.hover
          15.times do
            button.field.hover
            sleep(0.35)
            if tooltip_field.present?
              logger.info tooltip_field.text
              return tooltip_field.text
            end
          end
        end
      end

      class FilterMenuItem < Browser::BaseCache
        #assign({})

        def collapse
          cache[:collapse].nil? ? cache[:collapse] = CollapseButton.new(param) : cache[:collapse]
        end

        def expand
          cache[:expand].nil? ? cache[:expand] = ExpandButton.new(param) : cache[:expand]
        end
      end

      class SearchResults < Browser::BaseCache
        #assign({})

        def label
          cache[:label].nil? || !cache[:label].present? ? cache[:label] = StampsField.new(browser.div(text: "Search Results")) : cache[:label]
        end

        def remove_button
          cache[:remove_button] = StampsField.new(browser.a(css: "a[data-qtip=Remove]")) if cache[:remove_button].nil? || !cache[:remove_button].present?
          cache[:remove_button]
        end

        def count_label
          if cache[:count_label].nil? || !cache[:count_label].present?
            cache[:count_label] = StampsField.new(browser.div(css: "div[id=left-filter-panel-targetEl]>table>tbody>tr>td:nth-child(3)>div>div"))
          end
          cache[:count_label]
        end

        def present?
          label.present?
        end

        def wait_while_present(*args)
          remove_button.wait_while_present(*args)
        end

        def remove
          remove_button.click_while_present
        end

        def count
          count_label.text.to_i
        end
      end

      class SearchOrders < Browser::BaseCache
        #assign({})

        attr_reader :textbox, :search_button, :search_results

        def initialize(param)
          super
          @textbox = StampsTextbox.new browser.text_field(css: "[placeholder='Search Orders']")
          @search_button = StampsField.new browser.div(css: "[id^=textfield-][id$=-trigger-search]")
          @search_results = SearchResults.new(param)
        end

        def textbox
          cache[:textbox] = StampsTextbox.new(browser.text_field(css: "[placeholder='Search Orders']")) if cache[:textbox].nil? || !cache[:textbox].present?
          cache[:textbox]
        end

        def search_button
          if cache[:search_button].nil? || !cache[:search_button].present?
            cache[:search_button] = StampsField.new(browser.div(css: "[id^=textfield-][id$=-trigger-search]"))
          end
          cache[:search_button]
        end

        def search_results
          cache[:search_results].nil? ? cache[:search_results] = SearchResults.new(param) : cache[:search_results]
        end

        def present?
          search_button.present?
        end
      end

      module FilterTabHelper
        attr_accessor :field, :panel_name
        def selected?
          begin
            field.parent.parent.parent.parent.attribute_value("class").include?('selected')
          rescue
            false
          end
        end

        def field
          browser.divs(text: panel_name).first
        end

        def text
          StampsField.new(field).text
        end

        def select
          tab = StampsField.new(field)
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

      class AwaitingShipmentTab < Browser::BaseCache
        #assign({})
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Awaiting Shipment"
        end

        def count
          StampsField.new(browser.div(css: "div#left-filter-panel-targetEl>table[style*=left]>tbody>tr>td>div[class*=widget]>div[class=sdc-badge]")).text.to_i
        end
      end

      class ShippedTab < Browser::BaseCache
        #assign({})
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Shipped"
        end
      end

      class CanceledTab < Browser::BaseCache
        #assign({})
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "Canceled"
        end
      end

      class OnHoldTab < Browser::BaseCache
        #assign({})
        include FilterTabHelper
        def initialize(param)
          super
          @panel_name = "On Hold"
        end
      end

      class FilterPanel < Browser::BaseCache
        #assign({})

        def search_orders
          cache[:search_orders].nil? ? cache[:search_orders] = SearchOrders.new(param) : cache[:search_orders]
        end

        def search_results
          cache[:search_results].nil? ? cache[:search_results] = SearchResults.new(param) : cache[:search_results]
        end

        def awaiting_shipment
          cache[:awaiting_shipment].nil? ? cache[:awaiting_shipment] = AwaitingShipmentTab.new(param) : cache[:awaiting_shipment]
        end

        def shipped
          cache[:shipped].nil? ? cache[:shipped] = ShippedTab.new(param) : cache[:shipped]
        end

        def canceled
          cache[:canceled].nil? ? cache[:canceled] = CanceledTab.new(param) : cache[:canceled]
        end

        def on_hold
          cache[:on_hold].nil? ? cache[:on_hold] = OnHoldTab.new(param) : cache[:on_hold]
        end

        def menu_item
          cache[:menu_item].nil? ? cache[:menu_item] = FilterMenuItem.new(param) : cache[:menu_item]
        end

        def selected_filter
          20.times do
            sleep(0.05)
            return awaiting_shipment.text if awaiting_shipment.selected?
            sleep(0.05)
            return shipped.text if shipped.selected?
            sleep(0.05)
            return canceled.text if canceled.selected?
            sleep(0.05)
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