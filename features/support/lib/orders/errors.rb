module Stamps
  module Orders
    module OrdersRuntimeError
      class ServerError < Browser::Base
        def present?
          StampsField.new(browser.div(text: /Server Error/)).present?
        end

        def message
          StampsField.new(browser.divs(css: "div[id^=dialoguemodal-][id$=-body][class*=sdc-warning]>div>div").last).text
        end

        def ok
          button = StampsField.new(browser.spans(text: "OK").last)
          20.times do
            button.click
            sleep(0.025)
            break unless present?
          end
        end
      end

      class PrintingError < StandardError
        attr_reader :object
        def initialize(object)
          @object = object
        end
      end

      class OrderError < Browser::Base
        def window_title
          StampsField.new(browser.div(text: 'Order Error'))
        end

        def present?
          window_title.present?
        end

        def ok
          ok_btn = StampsField.new(browser.span(text: 'OK'))
          5.times {
            ok_btn.click
            break unless ok_btn.present?
          }
        end

        def error_message
          (StampsField.new(browser.div(css: "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"))).text
        end
      end

      class IncompleteOrderError < Browser::Base

        def wait_until_present(*args) #added wait_until_present to class
          window_title.wait_until_present(*args)
        end

        def error_message_label
          browser.div css: "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
        end

        def window_title
          return StampsField.new browser.div(text: 'Incomplete Order') #Changed text from Order Error to Incomplete Order
          nil
        end

        def ok
          ok_btn = StampsField.new browser.span(text: "OK")
          10.times{
            ok_btn.click
            break unless ok_btn.present?
          }
        end

        def error_message
          StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")).text
        end

        def present?
          browser.div(text: "Incomplete Order").present?
        end

        #todo-Rob fix this OrdersPrintModal.new(param)
        def continue
          5.times{
            begin
              continue_button.click
              break unless continue_button.present?
            rescue
              # ignore
            end
          }
          OrdersPrintModal.new(param)
        end

        def cancel
          cancel_button = StampsField.new(browser.span(text: "Cancel"))
          5.times{
            begin
              cancel_button.click
              break unless cancel_button.present?
            rescue
              # ignore
            end
          }
        end

        def close_window
          StampsField.new(window_title).click_while_present
        end

      end

      class RatingError < Browser::Base

        def ok_button
          StampsField.new(browser.span(text: 'OK'))
        end

        def wait_until_present
          begin
            ok_button.wait_until_present
          rescue
            # ignore
          end
          self
        end

        def present?
          ok_button.present?
        end

        def OK
          5.times {
            ok_button.click
            break unless present?
          }
        end

        def error_message
          StampsField.new(browser.p(css: 'div[class=x-autocontainer-innerCt]>p:nth-child(1)')).text
        end

      end
    end
  end
end