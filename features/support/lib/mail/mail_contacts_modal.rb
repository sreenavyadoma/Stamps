module Stamps
  module Mail
    class MailSearchContactsModal < Browser::Base
      attr_accessor :window_title, :x_btn

      def initialize(param)
        super
        @window_title=StampsField.new(browser.div(text: 'Search Contacts'))
        @x_btn=StampsField.new(browser.img(css: "img[class*='x-tool-img x-tool-close']"))

      end


      #iframe to access elements in contacts modal
      def contacts_frame
        browser.iframe(css: "iframe[src*='/addressbook/modal.aspx']")
      end

      #button to search for contacts in modal
      def search_button
        contacts_frame.div(class: "searchButton")
      end

      #contact info is entered into this modal for searching
      def search_field
        contacts_frame.text_field(class: "searchInput")
      end

      #method to close the contacts modal
      def close
        x_btn.click_while_present
      end

      def wait_until_present(*args)
        window_title.wait_until_present(args[0])
      end

      #confirm the contacts modal is present by checking that the modal window title appears
      def present?
        window_title.present?
      end

      #method to enter the contact info in the search field and click the search button
      def search str
        search_field.set str
        search_button.click
        sleep 1
      end

      # button to select a contact from the contacts modal sot that it appears as the mailpiece the delivery address
      def select_button
        contacts_frame.span(text: "Select")
      end

      #method to select a contact from the list in the contacts modal based on the contact's "last name, first name" text
      def select contact
        (contacts_frame.div(text: contact)).click
        select_button.click
        sleep 1
      end

      def contact_name contact
        (contacts_frame.div(text: contact))
      end

    end

  end
end