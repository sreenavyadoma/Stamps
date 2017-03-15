module Stamps
  class Google < Browser::StampsBrowserElement
    attr_accessor :text_box, :search_btn, :url

    def initialize(param)
      super(param)
      @text_box =  StampsTextbox.new(browser.text_field(:name => "q"))
      @search_btn = StampsElement.new(browser.button(:name, 'btnG'))
      @url = "www.google.com"
    end

    def load_page
      logger.message "Visit: #{url}"
      browser.goto url
    end

    def search_text(str)
      # 1 populate textbox
      text_box.wait_until_present(3)
      text_box.set(str)
      search_btn.wait_until_present(3)
      #2 click search button
      search_btn.safe_click
    end

    def validate_result
          expect(browser.title).to eq("Google")
      end
    end
end