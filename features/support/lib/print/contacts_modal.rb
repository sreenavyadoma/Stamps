module Stamps
  module Print
    module Postage
      class ContactsModal < Print::Postage::PrintObject
        def close
          browser_helper.safe_click (browser.img :css => "img[class*='x-tool-img x-tool-close']")
        end

        def view_contacts

          frame1 = browser.iframe(:css => 'iframe[class*=sdc-addressbookiframe]')
          frame1.a(:text => 'View Contacts').click

          sleep 3
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
          BrowserElement.new (browser.span :text => "Search Contacts")
        end

        def search
          Search.new param
        end

        def search_by_group
          SearchByGroup.new param
        end

        def search_by_cost_code
          SearchByCostCode.new param
        end

        def view_contacts_page

        end

        def view_by
          ViewBy.new param
        end

      end

      class Search < Print::Postage::PrintObject

      end

      class SearchByGroup < Print::Postage::PrintObject

      end

      class SearchByCostCode < Print::Postage::PrintObject

      end

      class ViewBy < Print::Postage::PrintObject

      end


    end
  end
end