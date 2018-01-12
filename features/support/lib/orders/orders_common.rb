module Stamps
  module Orders
    module Common
      module Service
        ##
        # This class keeps track of Service floating bound list # (service list
        # of values) in the DOM. The problem we have is that service drop down
        # list of values are not named properly, this class keeps track of
        # bulk update form and order details form service list of values.
        # This class is shared between BulkUpdate and OrderDetails.
        class FloatingBoundList < BaseCache
          @@hash={}
          class << self
            def set(key, val)
              @@hash[key.to_sym]=val
            end

            def get(key)
              @@hash[key.to_sym]
            end

            def has_key?(key)
              @@hash.has_key?(key.to_sym)
            end

            def keys
              @@hash.keys
            end

            def values
              @@hash.values
            end
          end

          def set(key, val)
            self.class.set(key, val)
          end

          def get(key)
            self.class.get(key)
          end

          def has_key?(key)
            self.class.has_key?(key.to_sym)
          end

          def keys
            self.class.keys
          end

          def values
            self.class.values
          end
        end

        class Base < FloatingBoundList
          BULK_UPDATE=:bulk_update
          ORDER_DETAILS=:single_order

          def bulk_update_first_load
            set(BULK_UPDATE, 0) if get(BULK_UPDATE).nil? && get(ORDER_DETAILS).nil?
          end

          def bulk_update_lov(str)
            set(BULK_UPDATE, values.max + 1) if get(BULK_UPDATE).nil? && !get(ORDER_DETAILS).nil? && lov_count(str)==1
          end

          def order_details_first_load
            set(ORDER_DETAILS, 0) if get(ORDER_DETAILS).nil? && get(BULK_UPDATE).nil?
          end

          def order_details_lov(str)
            set(ORDER_DETAILS, values.max + 1) if get(ORDER_DETAILS).nil? && !get(BULK_UPDATE).nil? && lov_count(str)==1
          end

          def selection_field(form, str)
            if form == BULK_UPDATE
              bulk_update_first_load
              bulk_update_lov(str)
            elsif form == ORDER_DETAILS
              order_details_first_load
              order_details_lov(str)
              nil
            end
            StampsField.new(browser.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text")[get(form)])
          end

          def lov_count(str)
            browser.tds(css: "li##{data_for(:orders_services, {})[str]} td.x-boundlist-item-text").size
          end
        end
      end
    end
  end
end


