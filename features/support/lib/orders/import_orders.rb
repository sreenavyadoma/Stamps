module Orders
  class SuccessModal < OrdersObject
    def window_title
      browser_helper.text @browser.div(text: "Success")
    end

    def present?
      browser_helper.present? @browser.div(text: "Success")
    end

    def ok
      button = StampsButton.new @browser.span(text: "OK")
      5.times do
        button.safe_click
        break unless button.present?
      end
    end
  end

  class ImportOrders < OrdersObject
    def present?
      browser_helper.present? @browser.div(text: "Import Orders")
    end

    def text_box
      StampsTextbox.new @browser.text_field(id: "files-inputEl")
    end

    def import
      success = SuccessModal.new @browser
      button = StampsButton.new @browser.span(text: "Import")
      server_error = Orders::ServerError.new @browser
      4.times do
        button.safe_click
        log.info "Success modal is #{(success.present?)?"Present":"Not Present"}"
        sleep 1
        return success if success.present?
        if server_error.present?
          error_msg = server_error.message
          log.info error_msg
          server_error.ok
          raise "Server Error: \n#{error_msg}"
        end
      end
    end

    def cancel
      button = StampsButton.new @browser.span(text: "Cancel")
      5.times do
        button.safe_click
        button.safe_click
        button.safe_click
        button.safe_click
        break unless present?
      end
    end

    def select_csv_file
      button = StampsInput.new @browser.input(id: "files-button-fileInputEl")
      open_file = Windows::OpenFile.new
      10.times do
        button.safe_click
        button.send_keys :enter
        sleep 2
        return open_file if open_file.present?
      end
    end

    def download_sample_file
      browser_helper.safe_click @browser.a(text: "Download sample file")
    end
  end
end