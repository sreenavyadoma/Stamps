module Stamps
  module Mail
    module MailModals

#todo-Kaushal Incomplete printing error
      module PrintIncompleteFields

        module IncFeldsWindowTitle
          def window_title
            (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.div(text: "Incomplete Fields")):cache[:window_title]
          end
        end

        class PrintIncompleteFields < Browser::StampsModal
          include IncFeldsWindowTitle
          def present?
            window_title.present?
          end

          def warning_message
            (cache[:warning_message].nil?||!cache[:warning_message].present?)?cache[:warning_message]=StampsField.new(browser.div(css: "div[class*='sdc-warning dialogue']>div")):cache[:warning_message]
          end
        end
      end


      def mail_modals
        (cache[:mail_modals].nil?||!cache[:mail_modals].present?)?cache[:mail_modals]=PrintIncompleteFields.new(param):cache[:mail_modals]
      end
    end
  end
end
