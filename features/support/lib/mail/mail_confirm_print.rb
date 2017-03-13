# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class MailConfirmPrint < Browser::StampsBrowserElement
        attr_accessor :window_title, :do_not_prompt, :continue_btn

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.span(text: "Confirm Print")
          @continue_btn = StampsElement.new browser.span(text: "Continue")
          @do_not_prompt = StampsCheckbox.new browser.span(css: "div[id^=dialoguemodal-][id$=-targetEl]>div>div>div>span"),
                             browser.div(css: "div[id^=dialoguemodal-][id$=-targetEl]>div[class*=checkbox]"), "class", "checked"
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.safely_wait_until_present(*args)
        end

        def continue
          10.times do
            continue_btn.safe_click
            sleep(0.125)
            break unless collapse_button.present?
          end
        end
      end

      class PleaseWait < Browser::StampsBrowserElement
        attr_accessor :window_title, :paragraph, :ok_btn

        def initialize(param)
          super(param)
          @window_title = StampsElement.new(browser.div(css: "div[class*=resizable]>div[class*='draggable']>div>div>div>div"))
          @paragraph = StampsElement.new(browser.div(css: "div[class*=resizable]>div[id^=dialoguemodal-][id$=-body]>div>div"))
          @ok_btn = StampsElement.new(browser.span(css: "div[class*=resizable]>div[class*='panel-docked-bottom']>div>div>div>a>span>span>span[id$=btnInnerEl]"))
        end

        def present?
          window_title.safe_text.eql("Please Wait")
        end

        def ok
          10.times do
            ok_btn.safe_click
            break unless present?
          end
        end
      end
    end
  end
end

