module Stamps
  module Orders
    module Authentication
      class SecurityQuestionsSuccess < Browser::StampsModal
        attr_accessor :cont_btn, :window_title, :body, :first_security_question, :first_security_answer, :second_security_question, :second_security_answer
        def initialize(param)
          super
          @cont_btn = StampsElement.new( browser.span(text: "Continue"))
          @window_title = StampsElement.new( browser.div(text: "Security Questions"))
          @body = StampsElement.new( browser.div(css: "div[class*='app-window'][class*='window-closable']>div[id$=body]>div>div>div>div>label"))
          @first_security_question = SecurityFirstQuestion.new(param)
          @first_security_answer = StampsTextBox.new(browser.text_fields(css: "input[type=password][name^=textfield-][name$=-inputEl]")[0])
          @second_security_question = SecuritySecondQuestion.new(param)
          @second_security_answer = StampsTextBox.new(browser.text_fields(css: "input[type=password][name^=textfield-][name$=-inputEl]")[1])
        end

        def present?
          window_title.present?
        end

        def wait_until_present(*args)
          window_title.wait_until_present(*args)
        end

        def text
          body.text
        end

        def continue
          cont_btn.click_while_present(30)
          sleep(3)
        end
      end

      class SecurityFirstQuestion < Browser::StampsModal
        def drop_down
          StampsElement.new(browser.div(css: "div[id^='container-'][id$='-targetEl']>div>div>div>div[id^='combo-'][id$='-trigger-picker']"))
        end

        def select(str)
          selection = StampsElement.new(browser.lis(text: str).first)
          30.times do
            drop_down.click unless selection.present?
            selection.scroll_into_view
            selection.click
          end
        end
      end

      class SecuritySecondQuestion < Browser::StampsModal
        def drop_down
          StampsElement.new(browser.div(css: "div[id^='container-'][id$='-targetEl']>div>div>div>div[id^='combo-'][id$='-trigger-picker']"))
        end

        def select(str)
          selection = StampsElement.new(browser.spans(text: str).last)
          15.times do
            drop_down.click unless selection.present?
            selection.scroll_into_view
            selection.click
          end
        end
      end
    end
  end
end