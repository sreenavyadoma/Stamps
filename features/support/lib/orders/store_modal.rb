module Stamps
  module Orders
    class StoreModal < Browser::StampsModal


      def search_by_name name

      end

      def present?
        browser.div(text: "Orders Settings").present?
      end
    end
  end
end
