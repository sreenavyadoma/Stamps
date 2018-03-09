module Stamps
  module Orders
    class SuccessModal < WebApps::Base
      def window_title
        StampsField.new(driver.div(css: "div[id^=dialoguemodal-][id$=_header-innerCt]")).text
      end

      def present?
        driver.div(text: "Success").present?
      end

      def wait_until_present
          (driver.div(text: "Success")).wait_until_present(120)
      end

      def message
        StampsTextbox.new driver.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]").text
      end

      def ok
        button = StampsField.new(driver.spans(text: "OK").last)
        5.times do
          button.click
          break unless button.present?
        end
      end
    end

    class ImportOrders < WebApps::Base
      attr_reader :title

      def initialize(param)
        super
        @title = StampsField.new driver.div(text: "Import Orders")
      end

      def present?
        title.present?
      end

      def filename_label
        StampsField.new(driver.label(id: "fileNameLabel")).text
      end

      def textbox
        StampsTextbox.new driver.text_field(id: "files-inputEl")
      end

      def import
        success = SuccessModal.new(param)
        button = StampsField.new driver.span(text: "Import")
        server_error = Orders::Stores::ServerError.new(param)

        button.click
        begin_time = Time.now

        if server_error.present?
          error_str = server_error.message
          log.info error_str
          server_error.ok
          expect("Server Error: \n#{error_str}").to eql ""
        end

        success.wait_until_present
        end_time = Time.now
        import_time = end_time - begin_time # in seconds
        import_time if success.present?
      end

      def confirm_success
        success = SuccessModal.new(param)
        success if success.present?
      end

      def cancel
        button = StampsField.new driver.span(text: "Cancel")
        5.times do
          button.click
          button.click
          button.click
          button.click
          break unless present?
        end
      end

      def select_csv_file
        button = StampsField.new driver.span(text: "Select CSV File")
        open_file = Windows::OpenFile.new(param.driver)
        10.times do
          button.field.parent.click
          button.click
          sleep(2)
          return open_file if open_file.present?
        end
      end

      def download_sample_file
        StampsField.new(driver.a(text: "Download sample file")).click
      end
    end
  end
end