
module Stamps
  module Registration
    class SecurityFirstQuestion < Browser::StampsModal

      def element
        StampsTextBox.new(browser.spans(css: "button[title='1ST QUESTION']>span[class*=filter-option]"))
      end

      def select(str)
        selection = StampsElement.new(browser.spans(text: str).first)
        15.times do
          return element.text if element.text.include?(str)
          element.click unless selection.present?
          selection.click
        end
        expect(selection.text).to include(str)
      end
    end

    class SecuritySecondQuestion < Browser::StampsModal

      def element
        StampsTextBox.new(browser.spans(css: "button[title='2ND QUESTION']>span[class*=filter-option]"))
      end

      def select(str)
        selection = StampsElement.new(browser.spans(text: str).last)
        15.times do
          return element.text if element.text.include?(str)
          element.click unless selection.present?
          selection.click
        end
        expect(element.text).to include(str)
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
        @first_answer = StampsTextBox.new(browser.text_field(class: "li[id=newsecretquestions]>div>div>div>div>div>input[id=secretAnswer1]"))
        @second_question = SecuritySecondQuestion.new(param)
        @second_answer = StampsTextBox.new(browser.text_field(class: "li[id=newsecretquestions]>div>div>div>div>div>input[id=secretAnswer2]"))
        @get_started = StampsElement.new(browser.button(id: "li[id=pagination]>div>div>button[id=startPrinting]"))
      end

      def get_started_btn
        get_started.click
      end
    end
  end
end


