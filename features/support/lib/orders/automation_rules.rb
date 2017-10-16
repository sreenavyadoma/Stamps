module Stamps
  module Orders
    module AutomationRules
      #todo-kaushal find all element

      class AutomationRules < Browser::StampsModal

        def add
          @add = browser.span(text: '') if @add.nil? || !@add.present?
          @add
        end

        def edit
          @edit = browser.span(text: '') if @edit.nil? || !@edit.present?
          @edit
        end

        def delete
          @delete = browser.span(text: '') if @delete.nil? || !@delete.present?
          @delete
        end

        def header
          @header = StampsElement.new(browser.div text: "") if @header.nil? || !@header.present?
          @header
        end

        def description
          @description = StampsElement.new(browser.div text: "") if @description.nil? || !@description.present?
          @description
        end

        def present?
          header.present?
        end
      end
    end
  end
end