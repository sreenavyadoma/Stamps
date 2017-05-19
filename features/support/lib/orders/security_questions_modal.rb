module Stamps
  module Orders
    module Authentication
      class SecurityQuestionsSuccess < Browser::StampsModal
        attr_accessor :cont_btn, :window_title, :body
        def initialize(param)
          super
          @cont_btn = StampsElement.new( browser.span(text: "Continue"))
          @window_title = StampsElement.new( browser.span(text: "Security Questions"))
          @body = StampsElement.new( browser.div(css: "div[class*='app-window'][class*='window-closable']>div[id$=body]>span>div"))
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

      class SecurityQuestions < Browser::StampsModal
        attr_accessor :cont_btn, :success_modal
        def initialize(param)
          super
          @cont_btn = StampsElement.new( browser.span(text: "Continue"))
          @success_modal = SecurityQuestionsSuccess.new(param)
        end

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
          20.times do
            cont_btn.click
            return success_modal if success_modal.present?
          end
        end
      end
    end
  end
end