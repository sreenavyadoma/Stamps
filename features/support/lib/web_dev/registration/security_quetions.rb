
module Stamps
  module Registration
    class SecurityFirstQuestion < Browser::StampsModal

      def element
        StampsElement.new(browser.span(css: "button[title*='1ST QUESTION']>span[class*=filter-option]"))
      end

      def select(str)
        begin
          element.click
          selection = StampsElement.new(browser.lis(css: "li[id='newsecretquestions']>div>div>div>div>div>div>div>ul>li>a>span[class=text]")[3])
          15.times do
            begin
              element.click unless selection.present?
              selection.scroll_into_view
              selection.click
            end
          end
        expect(selection.text).to include(str)
        end
      end
    end

    class SecuritySecondQuestion < Browser::StampsModal

      def drop_down
        StampsElement.new(browser.span(css: "button[title*='2ND QUESTION']>span[class*=filter-option]"))
      end

      def select(str)
        begin
          drop_down.click
          selection = StampsElement.new(browser.lis(css: "li[id='newsecretquestions']>div>div>div>div>div>div>div>ul>li>a>span[class=text]")[15])
          15.times do
            begin
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
            end
          end
          expect(selection.text).to include(str)
        end
      end

      def present?
        browser.h1(text: "Congratulations on your new account!").present?
      end
    end

    class SecurityQuestionsRegistration < Browser::StampsModal
      attr_reader :first_question, :first_answer, :second_question, :second_answer, :get_started

      def initialize(param)
        super
        @first_question = SecurityFirstQuestion.new(param)
        @first_answer = StampsTextBox.new(browser.text_field(id: 'secretAnswer1'))
        @second_question = SecuritySecondQuestion.new(param)
        @second_answer = StampsTextBox.new(browser.text_field(id: 'secretAnswer2'))
        @get_started = StampsElement.new(browser.button(id: "li[id=pagination]>div>div>button[id=startPrinting]"))
      end

      def get_started_btn
        get_started.click
      end
    end
  end
end


