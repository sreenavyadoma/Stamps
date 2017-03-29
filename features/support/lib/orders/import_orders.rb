module Stamps
  module Orders
    class SuccessModal < Browser::StampsModal
      def window_title
        element_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=_header-innerCt]")
      end

      def present?
        browser.div(text: "Success").present?
      end

      def wait_until_present
          (browser.div(text: "Success")).wait_until_present(120)
      end

      def message
        box = StampsTextbox.new browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
        box.text
      end

      def ok
        button = StampsElement.new(browser.spans(text: "OK").last)
        5.times do
          button.click
          break unless button.present?
        end
      end
    end

    class ImportOrders < Browser::StampsModal
      attr_reader :title

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.div(text: "Import Orders")
      end

      def present?
        title.present?
      end

      def filename_label
        element_helper.text browser.label(id: "fileNameLabel")
      end

      def text_box
        StampsTextbox.new browser.text_field(id: "files-inputEl")
      end

      def import
        success = SuccessModal.new(param)
        button = StampsElement.new browser.span(text: "Import")
        server_error = Orders::Stores::ServerError.new(param)

        button.click
        begin_time = Time.now

        if server_error.present?
          error_str = server_error.message
          logger.info error_str
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
        button = StampsElement.new browser.span(text: "Cancel")
        5.times do
          button.click
          button.click
          button.click
          button.click
          break unless present?
        end
      end

      def select_csv_file
        button = StampsElement.new browser.span(text: "Select CSV File")
        open_file = Windows::OpenFile.new
        10.times do
          button.element.parent.click
          button.send_keys(:enter)
          sleep(2)
          return open_file if open_file.present?
        end
      end

      def download_sample_file
        element_helper.click browser.a(text: "Download sample file")
      end
    end
  end
end