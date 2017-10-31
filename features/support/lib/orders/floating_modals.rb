module Stamps
  module Orders
    module FloatingPrintModals
      class TermsAndConditions < Browser::StampsModal
        def present?
          i_agree_button.present?
        end

        def wait_until_present(*args)
          i_agree_button.wait_until_present(*args)
        end

        def i_agree_button
          (cache[:i_agree].nil? || !cache[:i_agree].present?)?cache[:i_agree]=StampsInput.new(browser.iframe(css: "iframe[id^=component-]").input(class: 'acceptBtn stamps')):cache[:i_agree]
        end

        def i_agree
          15.times do
            i_agree_button.click
            break unless present?
          end
        end

        def form_body
          (cache[:form_body].nil? || !cache[:form_body].present?)?cache[:form_body]=StampsElement.new(browser.iframe(css: "iframe[id^=component-]").form.div(css: "[class=form-body]").ps[0]):cache[:form_body]
        end

        def close
          (cache[:close].nil? || !cache[:close].present?)?cache[:close]=StampsElement.new(browser.img(css: "[class*=x-tool-close]")):cache[:close]
        end

        private
        def cache
          @cache ||= {}
        end
      end

      def terms_conditions
        (@terms_conditions.nil? || !@terms_conditions.present?)?@terms_conditions=TermsAndConditions.new(param):@terms_conditions
      end
    end

    module FloatingModules

      module Printing
      end
    end
  end
end