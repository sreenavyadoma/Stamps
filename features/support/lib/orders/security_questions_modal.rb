module Stamps
  module Orders
    module Authentication
      class SecurityQuestionsSuccess < Browser::StampsModal
        def cont_btn
          @cont_btn = StampsElement.new( browser.span(text: "Continue")) if @cont_btn.nil? || !@cont_btn.present?
          @cont_btn
        end

        def window_title
          @window_title = StampsElement.new( browser.div(text: "Security Questions")) if @window_title.nil? || !@window_title.present?
          @window_title
        end

        def security_que_successfully_msg
          @security_que_successfully_msg = StampsElement.new( browser.div(text: "Security questions and answers have been successfully set.")) if @security_que_successfully_msg.nil? || !@security_que_successfully_msg.present?
          @security_que_successfully_msg
        end

        def first_security_question
          @first_security_question = SecurityFirstQuestion.new(param) if @first_security_question.nil? || !@first_security_question.present?
          @first_security_question
        end

        def second_security_question
          @second_security_question = SecuritySecondQuestion.new(param) if @second_security_question.nil? || !@second_security_question.present?
          @second_security_question
        end

        def body
          @body = StampsElement.new( browser.div(css: "div[class*='app-window'][class*='window-closable']>div[id$=body]>div>div>div>div>label")) if @body.nil? || !@body.present?
          @body
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
          @drop_down = StampsElement.new(browser.divs(css: "div[id^=combo-][id$=-trigger-picker]")[0]) if @drop_down.nil? || !@drop_down.present?
          @drop_down
        end

        def text_box
          @text_box = StampsElement.new(browser.divs(css: "input[placeholder='<Please Select>']")[0]) if @text_box.nil? || !@text_box.present?
          @text_box
        end

        def select(str)
          drop_down.click
          selection = StampsElement.new(browser.lis(text: str).first)

          5.times do
            drop_down.click unless selection.present?
            selection.scroll_into_view
            selection.click
          end
        end

        def first_security_answer
          @first_security_answer = StampsTextBox.new(browser.text_field(css: "input[data-errorqtip*='Security answer is required']")) if @first_security_answer.nil? || !@first_security_answer.present?
          @first_security_answer
        end
      end

      class SecuritySecondQuestion < Browser::StampsModal
        def drop_down
          @drop_down = StampsElement.new(browser.divs(css: "div[id^=combo-][id$=-trigger-picker]")[1]) if @drop_down.nil? || !@drop_down.present?
          @drop_down
        end

        def text_box
          @text_box = StampsElement.new(browser.divs(css: "input[placeholder='<Please Select>']")[1]) if @text_box.nil? || !@text_box.present?
          @text_box
        end

        def select(str)
          drop_down.click
          selection = StampsElement.new(browser.lis(text: str).last)

          1.times do
            drop_down.click unless selection.present?
            selection.scroll_into_view
            selection.click
          end
        end

        def second_security_answer
          @second_security_answer = StampsTextBox.new(browser.text_field(css: "input[data-errorqtip*='Security answer is required']")) if @second_security_answer.nil? || !@second_security_answer.present?
          @second_security_answer
        end
      end
    end
  end
end