module Stamps
  module Orders
    module SplitOrder
      module WindowTitle
        def window_title #the window title is used the verify that the modal has appeared
          StampsField.new(driver.div(css: "div[id^=splitorderwindow-][id$=innerCt]"))
        end
      end

      class Modal < WebApps::Base
        include WindowTitle


        def new_order_id #The default text in the New Order ID field, usually the existing orders ID with -1 appended to the end
          (cache[:new_order_id].nil? || !cache[:new_order_id].present?) ? cache[:new_order_id] = StampsTextbox.new(driver.text_field(css: "div[id^=splitorderwindow-][class*=dialogue-content]>div>div>div>div>div>div>div>div>div>div>div>input")) : cache[:new_order_id]
        end

        def confirm #the Confirm button in the Split Order Modal
          (cache[:confirm].nil? || !cache[:confirm].present?) ? cache[:confirm] = StampsField.new(driver.span(text: "Confirm")) : cache[:confirm]
        end

        def id #the id of the original order, as shown in the Split Order Modal window title
          (cache[:id].nil? || !cache[:id].present?) ? cache[:id] = StampsField.new(driver.div(css: "div[id^=splitorderwindow-][id$=targetEl]>div>div")) : cache[:id]
        end

        def original_order_id #the id of the original order, formatted to remove all other text
          /\d+/.match(id.text).to_s
        end

        def present?
          window_title.present?
        end

        def item(number) #instantiate an object that represents the item details in the Split Order Modal
          SplitItemDetails.new(param, number)
        end

        def confirm_order_split #click the Confirm button
          confirm.click
          sleep 5
        end



        class SplitItemDetails < WebApps::Base

          attr_reader :index
          def initialize(param, number)
            super(param)
            @index = number
          end

          def inc_btn #button to increment the value of the associated field in the item details form (identified by its index)
            driver.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=up]")[@index]
          end

          def dec_btn #button to dencrement the value of the associated field in the item details form (identified by its index)
            driver.divs(css: "div[id^=singlesplitorderitem-][id$=-targetEl]>div>div>div>div>div[class*=down]")[@index]
          end

          def original_item_id #id for each item that is listed in original order (identified by its index)
            StampsField.new(driver.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index * 3 + 1]).text
          end

          def original_item_description #description for each item that is listed in original order (identified by its index)
            StampsField.new(driver.divs(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index * 3]).text

          end

          def original_item_qty #quantity for each item that is listed in original order (identified by its index)
            StampsField.new(driver.labels(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>label")[@index * 3 + 2]).text
          end

          def new_item_qty #description for each item that is listed in original order (identified by its index)
            StampsTextbox.new(driver.text_fields(css: "div[id^=singlesplitorderitem-][id$=targetEl]>div>div>div>div>input")[@index])
          end
        end


      end
    end
  end
end
