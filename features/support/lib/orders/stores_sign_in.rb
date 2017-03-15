module Stamps
  module Orders
    class LearnMoreModal < Browser::StampsBrowserElement
      attr_reader :title, :msg_container, :next_button, :cancel_button, :learn_button, :close_button

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Learn More')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @close_button = StampsElement.new browser.span(text: 'Close')
        @cancel_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_button = StampsElement.new browser.span(text: 'Learn More')
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
      end

      def cancel
        cancel_button.click_while_present
      end

      def message
        msg_container.text
      end

      def close
        logger.message message
        close_button.click_while_present
      end
    end

    class ImportFromStoresModal < Browser::StampsBrowserElement
      attr_reader :title, :msg_container, :next_button, :close_button, :learn_more

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Import from Stores')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @learn_more = LearnMoreModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
      end

      def close
        close_button.click_while_present
      end

      def message
        msg_container.text
      end

      def next
        10.times do
          logger.message message
          next_button.safe_click
          return learn_more if learn_more.present?
        end
      end
    end

    class ImportFromCsvModal < Browser::StampsBrowserElement
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_stores

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Import from CSV')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_stores = ImportFromStoresModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
      end

      def close
        close_button.click_while_present
      end

      def message
        msg_container.text
      end

      def next
        10.times do
          logger.message message
          next_button.safe_click
          return import_from_stores if import_from_stores.present?
        end
      end
    end

    class AddManualOrderModal < Browser::StampsBrowserElement
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_csv

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: 'Add Manual Order')
        @msg_container = StampsElement.new browser.div(id: 'sdc-window-tutorial-innerCt')
        @next_button = StampsElement.new browser.span(text: 'Next')
        @close_button = StampsElement.new browser.img(css: 'img[class$=x-tool-close]')
        @import_from_csv = ImportFromCsvModal.new(param)
      end

      def present?
        title.present?
      end

      def wait_until_present *args
        title.safely_wait_until_present *args
      end

      def close
        close_button.click_while_present
      end

      def message
        msg_container.text
      end

      def next
        10.times do
          logger.message message
          next_button.safe_click
          return import_from_csv if import_from_csv.present?
        end
      end
    end
  end
end
