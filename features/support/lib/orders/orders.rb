module Stamps
  module Orders
    class WebOrders < Browser::BaseCache
      assign({})
      def cache
        self.class.cache
      end

      def orders_toolbar
        if cache[:orders_toolbar].nil? || !cache[:orders_toolbar].present?
          cache[:orders_toolbar] = Orders::Toolbar::OrdersToolbar.new(param)
        else
          cache[:orders_toolbar]
        end
      end

      def landing_page
        if cache[:landing_page].nil? || !cache[:landing_page].present?
          cache[:landing_page] = Orders::Authentication::OrdersLandingPage.new(param)
        else
          cache[:landing_page]
        end
      end

      def filter_panel
        if cache['filter_panel'].nil? || !cache[:filter_panel].present?
          cache[:filter_panel] = Orders::LeftPanel::FilterPanel.new(param)
        else
          cache[:filter_panel]
        end
      end

      def orders_grid
        if cache[:orders_grid].nil? || !cache[:orders_grid].present?
          cache[:orders_grid] = Orders::Grid::OrdersGrid.new(param)
        else
          cache[:orders_grid]
        end
      end

      def order_details
        if cache[:single_order].nil? || !cache[:single_order].present?
          cache[:single_order] = Orders::SingleOrder::DetailsForm.new(param)
        else
          cache[:single_order]
        end
      end

      def bulk_update
        if cache[:bulk_update].nil? || !cache[:bulk_update].present?
          cache[:bulk_update] = Orders::BulkUpdate::Form.new(param)
        else
          cache[:bulk_update]
        end
      end

      def modals
        if cache[:modals].nil? || !cache[:modals].present?
          cache[:modals] = Stamps::Browser::Base.new(param).extend(StampsOrdersModals)
        else
          cache[:modals]
        end
      end

      def marketplace
        if cache[:marketplace].nil? || !cache[:marketplace].present?
          cache[:marketplace] = Stamps::Browser::Base.new(param).extend(MarketPlaceStoreModals)
        else
          cache[:marketplace]
        end
      end

      def styles
        if cache[:styles].nil? || !cache[:styles].present?
          cache[:styles] = PageStyles.new(param)
        else
          cache[:styles]
        end
      end

      def present?
        orders_grid.present?
      end
    end
  end
end