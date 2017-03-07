# encoding: utf-8
module Stamps
  module Mail
    module PrintModal
      class ConfirmPrintCheckbox < Browser::StampsBrowserElement
        def check
          browser.checkbox(name: 'dismissConfirm').set
          browser.checkbox(name: 'dismissConfirm').set
        end

        def uncheck
          browser.checkbox(name: 'dismissConfirm').clear
          browser.checkbox(name: 'dismissConfirm').clear
        end
      end

      class PrintModalConfirmPrint < Browser::StampsBrowserElement
        attr_accessor :window_title, :collapse_button

        def initialize(param)
          super(param)
          @window_title = StampsElement.new browser.span(text: "Confirm Print")
          @collapse_button = StampsElement.new browser.a(id: "sdc-undefinedwindow-continuebtn")
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.safely_wait_until_present(*args)
        end

        def continue
          sleep(0.35)
          6.times do
            collapse_button.safe_click
            sleep(0.35)
            break unless collapse_button.present?
          end
        end
      end
    end
  end
end

