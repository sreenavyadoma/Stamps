module Stamps
  module Orders
    module Authentication
      class SecurityQuestionsSuccess < Browser::StampsModal

      end

      class SecurityQuestions < Browser::StampsModal
        def first_security_question
          drop_down = browser.divs(css: "div[class^=x-trigger-index-0]")[0]
          text_box = browser.text_fields(css: "input[placeholder='<Please Select>']")[0]
          @first_security_question ||= StampsDropDown.new(text_box, drop_down, :div)
        end

        def first_security_answer
          @first_security_answer ||= StampsTextBox.new(browser.text_fields(css: "input[type=password][name^=textfield-][name$=-inputEl]")[0])
        end

        def second_security_question
          drop_down = browser.divs(css: "div[class^=x-trigger-index-0]")[1]
          text_box = browser.text_fields(css: "input[placeholder='<Please Select>']")[1]
          @first_security_question ||= StampsDropDown.new(text_box, drop_down, :div)
        end

        def second_security_answer
          @second_security_answer ||= StampsTextBox.new(browser.text_fields(css: "input[type=password][name^=textfield-][name$=-inputEl]")[1])
        end

        def continue
          cont_btn = browser.span(text: "Continue")

        end
      end
    end
  end
end