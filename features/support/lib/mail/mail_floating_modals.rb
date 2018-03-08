module Stamps
  module Mail
    module MailModals

#todo-Kaushal Incomplete printing error
      module PrintIncompleteFields

        module IncFeldsWindowTitle
          def window_title
            StampsField.new(browser.div(text: 'Incomplete Fields'))
          end
        end

        class PrintIncompleteFields < WebApps::Base
          include IncFeldsWindowTitle
          def present?
            window_title.present?
          end

          def warning_message
            cache[:warning_message].nil? || !cache[:warning_message].present? ? cache[:warning_message] = StampsField.new(browser.div(css: "div[class*='sdc-warning dialogue']>div")) : cache[:warning_message]
          end
        end
      end


      def mail_modals
        cache[:mail_modals].nil? || !cache[:mail_modals].present? ? cache[:mail_modals] = PrintIncompleteFields.new(param) : cache[:mail_modals]
      end
    end
  end
end
