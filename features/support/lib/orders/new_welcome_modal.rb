module Stamps
  module Orders
    module Authentication
      class NewWelcomeModal < Browser::Base
        attr_reader :title, :msg_container, :next_button, :close_button, :add_manual_order

        def initialize(param)
          super
          @title = StampsField.new(browser.div(text: 'Welcome!'))
          @msg_container = StampsField.new(browser.div(id: 'sdc-window-tutorial-innerCt'))
          @next_button = StampsField.new(browser.span(text: 'Next'))
          @close_button = StampsField.new(browser.img(css: 'img[class$=x-tool-close]'))
          @add_manual_order = AddManualOrderModal.new(param)
        end

        def present?
          title.present?
        end

        def wait_until_present(*args)
          title.wait_until_present(*args)
        end

        def close
          close_button.click_while_present
        end

        def message
          msg_container.text
        end

        def next
          10.times do
            next_button.click
            return add_manual_order if add_manual_order.present?
          end
        end
      end
    end
  end
end

