module Stamps
  module Orders
    module OrdersSettings

      class TempCache < Base::Base
        #assign({})
      end

      module StoresTabViewToolbar
        def add_btn
          (cache[:add_btn].nil? || !cache[:add_btn].present?) ? cache[:add_btn] = StampsField.new(browser.span(css: "[id=addStoreButton-btnIconEl]")) : cache[:add_btn]
        end

        def edit_btn
          (cache[:edit_btn].nil? || !cache[:edit_btn].present?) ? cache[:edit_btn] = StampsField.new(browser.a(css: "[class*=sdc-managestoreswindow-editbtn]")) : cache[:edit_btn]
        end

        def delete_btn
          (cache[:delete_btn].nil? || !cache[:delete_btn].present?) ? cache[:delete_btn] = StampsField.new(browser.span text: "Delete") : cache[:delete_btn]
        end

        def marketplace_window_title
          (cache[:marketplace_window_title].nil? || !cache[:marketplace_window_title].present?) ? cache[:marketplace_window_title] = TempCache.new(
              param).extend(Orders::Stores::MarketPlaceWindowTitle) : cache[:marketplace_window_title]
        end

        def store_settings_window_title
          (cache[:store_settings_window_title].nil? || !cache[:store_settings_window_title].present?) ? cache[:store_settings_window_title] = TempCache.new(
              param).extend(Orders::Stores::StoreSettingsWindowTitle) : cache[:store_settings_window_title]
        end

        def add
          20.times do
            return marketplace_window_title.window_title.text if marketplace_window_title.window_title.present?
            add_btn.click
          end
          nil
        end

        def edit
          20.times do
            return store_settings_window_title.window_title.text if store_settings_window_title.window_title.present?
            edit_btn.click
            sleep(2)
          end
          nil
        end

        def reconnect

        end

        def delete
          20.times do
            break if delete_store_confirm_modal.present?
            delete_btn.click
          end
        end

        def delete_store_confirm_modal
          cache[:delete_store_confirm_modal].nil? || !cache[:delete_store_confirm_modal].present? ? cache[:delete_store_confirm_modal] = DeleteStoreConfirm.new(param) : cache[:delete_store_confirm_modal]
        end

        class DeleteStoreConfirm < Base::BaseCache
          assign({})

          def present?
            delete_store_text.present?
          end

          def delete_btn
            (cache[:delete_btn].nil? || !cache[:delete_btn].present?) ? cache[:delete_btn] = StampsField.new(browser.div(css: "div[id=deleteStoreButton]>div>div>div[class*=x-autocontainer-outerCt]>div[class*=x-autocontainer-innerCt]>a:nth-child(1)")) : cache[:delete_btn]
          end

          def cancel_btn
            (cache[:cancel_btn].nil? || !cache[:cancel_btn].present?) ? cache[:cancel_btn] = StampsField.new(browser.span text: "Cancel") : cache[:cancel_btn]
          end

          def delete_store_text
            (cache[:delete_store_text].nil? || !cache[:delete_store_text].present?) ? cache[:delete_store_text] = StampsField.new(browser.div(css: "[id*=deleteStoreButton]")) : cache[:delete_store_text]
          end

          def confirm_delete
            20.times do
              break if !present?
              delete_btn.click
            end
          end

          def cancel_delete
            20.times do
              break if !present?
              cancel_btn.click
            end
          end

        end
      end


      module StoresTabViewBottom
      end

      class StoresTabView < Browser::Base
        include StoresTabViewToolbar
        include StoresTabViewBottom

        #assign({})

        def present?
          add_btn.present?
        end

        def select_store(store)
          field = StampsField.new(browser.div(text: store))
          20.times do
            field.click
            return field.text if field.field.parent.parent.parent.parent.attribute_value('class').include?('selected')
          end
          nil
        end
      end

    end
  end
end