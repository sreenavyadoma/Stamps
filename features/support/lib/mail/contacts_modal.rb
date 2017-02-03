module Stamps
  module Mail
    class ContactsModal < Browser::Modal
      def close
        element_helper.safe_click (browser.img css: "img[class*='x-tool-img x-tool-close']")
      end

      def view_contacts

        frame1 = browser.iframe(css: 'iframe[class*=sdc-addressbookiframe]')
        frame1.a(text: 'View Contacts').click

        sleep(3)
      end

      def wait_until_present
        window_title.wait_until_present
      end

      def present?
        window_title.present?
      end

      def select_contact

      end

      def window_title
        StampsElement.new(browser.span text: "Search Contacts")
      end

      def search
        Search.new(param)
      end

      def search_by_group
        SearchByGroup.new(param)
      end

      def search_by_cost_code
        SearchByCostCode.new(param)
      end

      def view_contacts_page

      end

      def view_by
        ViewBy.new(param)
      end

    end

    class Search < Browser::Modal

    end

    class SearchByGroup < Browser::Modal

    end

    class SearchByCostCode < Browser::Modal

    end

    class ViewBy < Browser::Modal

    end


  end
end