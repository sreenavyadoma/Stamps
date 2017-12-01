module Stamps
  module Mail
    class MailSearchContactsModal < Browser::StampsModal
      attr_accessor :window_title, :x_btn

      def initialize(param)
        super
        @window_title=StampsField.new(browser.div(text: 'Search Contacts'))
        @x_btn=StampsField.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))

        #src="/addressbook/modal.aspx"
      end

      def myframe
        browser.iframe(css: "iframe[src*='/addressbook/modal.aspx']")
      end

      def search_button
        myframe.div(class: "searchButton")
        #StampsField.new(myframe.input(css: "div[class*='searchButton']"))
      end

      def search_field
        myframe.text_field(class: "searchInput")
       # StampsTextbox.new(myframe.input(css: "input[class*='searchInput']"))
      end

      def close
        x_btn.click_while_present
      end

      def wait_until_present(*args)
        window_title.wait_until_present(args[0])
      end

      def present?
        window_title.present?
      end

      def search str
        search_field.set str
        search_button.click
        sleep 1
      end

      def select_button
        myframe.span(text: "Select")
      end

      def select contact
        (myframe.div(text: contact)).click
        select_button.click
        sleep 1
      end
    end

  end
end