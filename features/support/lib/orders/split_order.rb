module Stamps
  module Orders
    module Toolbar
      class SplitOrderModal < Browser::Base
        attr_reader :window_title

        def initialize(param)
          super

          @window_title=StampsField.new(browser.div(css: "div[id^=splitorderwindow-][id$=innerCt]"))

        end

        def original_order_id
          id=StampsField.new(browser.div(css: "div[id^=splitorderwindow-][id$=targetEl]>div>div"))
          /\d+/.match(id.text).to_s
        end

        def new_order_id
          StampsTextbox.new(browser.text_field(css: "div[id^=splitorderwindow-][class*=dialogue-content]>div>div>div>div>div>div>div>div>div>div>div>input"))
        end

        def present?
          window_title.present?
        end


      #  def item_id item_number
      #    ((StampsField.new(browser.div(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")))[item_number*3]).text
       # end

      #  def item_description item_number
      #    ((StampsField.new(browser.div(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")))[item_number*3 + 1]).text
       # end

       # def item_qty item_number
       #   ((StampsField.new(browser.div(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")))[item_number*3 + 2]).text
       # end

        def item(number)
          SplitItemDetails.new(param, number)
        end

        def confirm_order_split
          confirm.click
          sleep 5
        end

        def confirm
          StampsField.new(browser.span(text: "Confirm"))
        end

        class SplitItemDetails < Browser::Base
          attr_reader :index, :original_item_qty, :original_item_id, :original_item_description, :new_item_qty
          def initialize(param, number)
            super(param)
            @index=number
            inc_btn=browser.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index]
            dec_btn=browser.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index]

            @original_item_id=(StampsField.new(browser.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3 + 1])).text
            @original_item_description=(StampsField.new(browser.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3])).text
            @original_item_qty=(StampsField.new(browser.labels(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index*3 + 2])).text
            @new_item_qty=StampsTextbox.new(browser.text_fields(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>div>input")[@index])
          end

        end


      end

    end
  end
end
