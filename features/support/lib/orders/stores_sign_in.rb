module Stamps
  module Orders
    class LearnMoreModal < WebApps::Base
      attr_reader :title, :msg_container, :next_button, :cancel_button, :learn_button, :close_button

      def initialize(param)
        super
        @title=StampsField.new driver.div(text: 'Learn More')
        @msg_container=StampsField.new driver.div(id: 'sdc-window-tutorial-innerCt')
        @close_button=StampsField.new driver.span(text: 'Close')
        @cancel_button=StampsField.new driver.img(css: 'img[class$=x-tool-close]')
        @learn_button=StampsField.new driver.span(text: 'Learn More')
      end

      def present?
        title.present?
      end

      def wait_until_present(*args)
        title.wait_until_present(*args)
      end

      def cancel
        cancel_button.click_while_present
      end

      def message
        msg_container.text
      end

      def close
        log.info message
        close_button.click_while_present
      end
    end

    class ImportFromStoresModal < WebApps::Base
      attr_reader :title, :msg_container, :next_button, :close_button, :learn_more

      def initialize(param)
        super
        @title=StampsField.new driver.div(text: 'Import from Stores')
        @msg_container=StampsField.new driver.div(id: 'sdc-window-tutorial-innerCt')
        @next_button=StampsField.new driver.span(text: 'Next')
        @close_button=StampsField.new driver.img(css: 'img[class$=x-tool-close]')
        @learn_more=LearnMoreModal.new(param)
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
          log.info message
          next_button.click
          return learn_more if learn_more.present?
        end
      end
    end

    class ImportFromCsvModal < WebApps::Base
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_stores

      def initialize(param)
        super
        @title=StampsField.new driver.div(text: 'Import from CSV')
        @msg_container=StampsField.new driver.div(id: 'sdc-window-tutorial-innerCt')
        @next_button=StampsField.new driver.span(text: 'Next')
        @close_button=StampsField.new driver.img(css: 'img[class$=x-tool-close]')
        @import_from_stores=ImportFromStoresModal.new(param)
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
          log.info message
          next_button.click
          return import_from_stores if import_from_stores.present?
        end
      end
    end

    class AddManualOrderModal < WebApps::Base
      attr_reader :title, :msg_container, :next_button, :close_button, :import_from_csv

      def initialize(param)
        super
        @title=StampsField.new driver.div(text: 'Add Manual Order')
        @msg_container=StampsField.new driver.div(id: 'sdc-window-tutorial-innerCt')
        @next_button=StampsField.new driver.span(text: 'Next')
        @close_button=StampsField.new driver.img(css: 'img[class$=x-tool-close]')
        @import_from_csv=ImportFromCsvModal.new(param)
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
          log.info message
          next_button.click
          return import_from_csv if import_from_csv.present?
        end
      end
    end
  end
end
