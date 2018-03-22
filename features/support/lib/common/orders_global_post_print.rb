# encoding: utf-8
module Stamps
  module Orders
    module GlobalPost
      module YourGlobalPostLabel

        # #AB_ORDERSAUTO_3515
        # module GlobalPostLabelModalTitle
        #   def global_post_label_title
        #     (cache[:global_post_label_title].nil?||!cache[:global_post_label_title].present?)?cache[:global_post_label_title]=StampsField.new(driver.div(css: '')):cache[:global_post_label_title]
        #   end
        # end

        # #AB_ORDERSAUTO_3515
        # module GlobalPostLabelModalBody
        #   def global_post_label_body
        #       (cache[:global_post_label_body].nil?||!cache[:global_post_label_body].present?)?cache[:global_post_label_body]=StampsField.new(driver.div(css: '')):cache[:global_post_label_body]
        #     end
        # end

        #AB_ORDERSAUTO_3515
        module WindowTitle
          def window_title
            (cache[:window_title].nil? || !cache[:window_title].present?) ? cache[:window_title] = StampsField.new(driver.div(css: '')) : cache[:window_title]
          end
        end

        module ModalElements
          def checkbox
            (cache[:checkbox].nil? || !cache[:checkbox].present?) ? cache[:checkbox] = StampsWatirCheckbox.new(driver.span(css: '')) : cache[:checkbox]
          end

          def body
            (cache[:body].nil? || !cache[:body].present?) ? cache[:body] = StampsField.new(driver.div(css: '')) : cache[:body]
          end

          def global_post_ok_btn
            (cache[:global_post_ok_btn].nil? || !cache[:global_post_ok_btn].present?) ? cache[:global_post_ok_btn] = StampsField.new(driver.div(css: '')) : cache[:global_post_ok_btn]
          end

          def global_post_x_btn
            (cache[:global_post_x_btn].nil? || !cache[:global_post_x_btn].present?) ? cache[:global_post_x_btn] = StampsField.new(driver.div(css: '')) : cache[:global_post_x_btn]
          end
        end

        class GlobalPostLabelModal < WebApps::Base
          # include GlobalPostLabelModalBody
          # include GlobalPostLabelModalCheckbox
          include WindowTitle
          include ModalElements



          def close
            StampsField.new(driver.div(css: "")) #change me
          end

          def click_ok
            StampsField.new(driver.div(css: "")) #change me
          end
        end

      end
    end
  end
end