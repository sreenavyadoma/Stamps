module Stamps
  module Orders
    module OrdersSettings

      module StoresTabViewToolbar
        def add_btn
          (cache[:add_btn].nil? || !cache[:add_btn].present?) ? cache[:add_btn] = StampsField.new(driver.span(css: "[id=addStoreButton-btnIconEl]")) : cache[:add_btn]
        end

        def edit_btn
          (cache[:edit_btn].nil? || !cache[:edit_btn].present?) ? cache[:edit_btn] = StampsField.new(driver.a(css: "[class*=sdc-managestoreswindow-editbtn]")) : cache[:edit_btn]
        end

        def delete_btn
          (cache[:delete_btn].nil? || !cache[:delete_btn].present?) ? cache[:delete_btn] = StampsField.new(driver.a(css: "[class*=sdc-managestoreswindow-deletebtn]")) : cache[:delete_btn]
        end

        def marketplace_window_title
          (cache[:marketplace_window_title].nil? || !cache[:marketplace_window_title].present?) ? cache[:marketplace_window_title] = WebApps::Base.new(
              param).extend(Orders::Stores::MarketPlaceWindowTitle) : cache[:marketplace_window_title]
        end

        def store_settings_window_title
          (cache[:store_settings_window_title].nil? || !cache[:store_settings_window_title].present?) ? cache[:store_settings_window_title] = WebApps::Base.new(
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
            sleep 5
            break if delete_store_confirm_modal.present?
            delete_btn.click
          end
        end

        def delete_store_confirm_modal
          cache[:delete_store_confirm_modal].nil? || !cache[:delete_store_confirm_modal].present? ? cache[:delete_store_confirm_modal] = DeleteStoreConfirm.new(param) : cache[:delete_store_confirm_modal]
        end

        class DeleteStoreConfirm < WebApps::Base
          #assign({})

          def present?
            delete_store_text.present?
          end

          def confirm_delete_btn
            (cache[:confirm_delete_btn].nil? || !cache[:confirm_delete_btn].present?) ? cache[:confirm_delete_btn] = StampsField.new(driver.a(css: "div[id=deleteStoreButton]>div>div>div[class*=x-autocontainer-outerCt]>div[class*=x-autocontainer-innerCt]>a:nth-child(1)")) : cache[:confirm_delete_btn]
          end

          def cancel_delete_btn
            (cache[:cancel_btn].nil? || !cache[:cancel_btn].present?) ? cache[:cancel_btn] = StampsField.new(driver.span text: "Cancel") : cache[:cancel_btn]
          end

          def delete_store_text
            (cache[:delete_store_text].nil? || !cache[:delete_store_text].present?) ? cache[:delete_store_text] = StampsField.new(driver.div(css: "[id*=deleteStoreButton]")) : cache[:delete_store_text]
          end

          def confirm_delete
            20.times do
              break if !present?
              confirm_delete_btn.click
            end
          end

          def cancel_delete
            20.times do
              break if !present?
              cancel_delete_btn.click
            end
          end

        end
      end


      module StoresTabViewBottom
        def done
          StampsField.new(driver.span(text: "Done"))
        end
      end

      class StoresTabView < WebApps::Base
        include StoresTabViewToolbar
        include StoresTabViewBottom



        def present?
          add_btn.present?
        end

        def store_name (store)
          StampsField.new(driver.div(text: store))
        end

        def select_store(store)
          sleep 5
          20.times do
            store_name(store).click
            return store_name(store).text if store_name(store).field.parent.parent.parent.parent.attribute_value('class').include?('selected')
          end
          nil
        end


      end

    end
  end
end