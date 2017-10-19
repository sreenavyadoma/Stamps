module Stamps
  module Orders
    module AutomationRules
      #todo-kaushal find all element

      module AddCriteria
        def add_criteria_link
          @add_criteria_link = browser.span(text: '') if @add_criteria_link.nil? || !@add_criteria_link.present?
          @add_criteria_link
        end

        def first_dropdown
          @first_dropdown = browser.span(text: '') if @first_dropdown.nil? || !@first_dropdown.present?
          @first_dropdown
        end

        def second_dropdown
          @second_dropdown = browser.span(text: '') if @second_dropdown.nil? || !@second_dropdown.present?
          @second_dropdown
        end

        def third_dropdown
          @third_dropdown = browser.span(text: '') if @third_dropdown.nil? || !@third_dropdown.present?
          @third_dropdown
        end
      end

      module AddAction
        def add_action_link
          @add_action_link = browser.span(text: '') if @add_action_link.nil? || !@add_action_link.present?
          @add_action_link
        end

        def first_dropdown
          @first_dropdown = browser.span(text: '') if @first_dropdown.nil? || !@first_dropdown.present?
          @first_dropdown
        end

        def second_dropdown
          @second_dropdown = browser.span(text: '') if @second_dropdown.nil? || !@second_dropdown.present?
          @second_dropdown
        end
      end

      class AutomationRulesModal < Browser::StampsModal

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

        def rule_names
          @rule_names = StampsElement.new(browser.div text: "") if @rule_names.nil? || !@rule_names.present?
          @rule_names
        end

        def active_rule
          @active_rule = StampsElement.new(browser.div text: "") if @active_rule.nil? || !@active_rule.present?
          @active_rule
        end

        def done_btn
          @done_btn = StampsElement.new(browser.div text: "") if @done_btn.nil? || !@done_btn.present?
          @done_btn
        end
      end

      class NewRuleModal < Browser::StampsModal
#        include AddCriteria
 #       include AddAction

        def rule_name
          @rule_name = browser.span(text: '') if @rule_name.nil? || !@rule_name.present?
          @rule_name
        end

        def check_box
          @check_box = browser.span(text: '') if @check_box.nil? || !@check_box.present?
          @check_box
        end

        def close
          @close = browser.span(text: '') if @close.nil? || !@close.present?
          @close
        end

        def every_actions_radio_btn
          @every_actions_radio_btn = StampsElement.new(browser.div text: "") if @every_actions_radio_btn.nil? || !@every_actions_radio_btn.present?
          @every_actions_radio_btn
        end

        def specific_actions_radio_btn
          @specific_actions_radio_btn = StampsElement.new(browser.div text: "") if @specific_actions_radio_btn.nil? || !@specific_actions_radio_btn.present?
          @specific_actions_radio_btn
        end

        def present?
          rule_name.present?
        end

        def save_rule_btn
          @save_rule_btn = StampsElement.new(browser.div text: "") if @save_rule_btn.nil? || !@save_rule_btn.present?
          @save_rule_btn
        end
      end

      class EditRuleModal < Browser::StampsModal
        include AddCriteria
        include AddAction

        def rule_name_edit
          @rule_name = StampsElement.new(browser.span(text: '')) if @rule_name.nil? || !@rule_name.present?
          @rule_name
        end

        def check_box
          @check_box = browser.span(text: '') if @check_box.nil? || !@check_box.present?
          @check_box
        end

        def close
          @close = browser.span(text: '') if @close.nil? || !@close.present?
          @close
        end

        def every_actions_radio_btn
          @every_actions_radio_btn = StampsElement.new(browser.div text: "") if @every_actions_radio_btn.nil? || !@every_actions_radio_btn.present?
          @every_actions_radio_btn
        end

        def specific_actions_radio_btn
          @specific_actions_radio_btn = StampsElement.new(browser.div text: "") if @specific_actions_radio_btn.nil? || !@specific_actions_radio_btn.present?
          @specific_actions_radio_btn
        end

        def present?
          rule_name.present?
        end

        def save_rule_btn
          @save_rule_btn = StampsElement.new(browser.div text: "") if @save_rule_btn.nil? || !@save_rule_btn.present?
          @save_rule_btn
        end
      end

      class DeleteRuleModal < Browser::StampsModal

        def header
          @header = browser.span(text: '') if @header.nil? || !@header.present?
          @header
        end

        def close
          @close = browser.span(text: '') if @close.nil? || !@close.present?
          @close
        end

        def present?
          header.present?
        end

        def delete_btn
          @delete_btn = StampsElement.new(browser.div text: "") if @delete_btn.nil? || !@delete_btn.present?
          @delete_btn
        end

        def cancel_btn
          @cancel_btn = StampsElement.new(browser.div text: "") if @cancel_btn.nil? || !@cancel_btn.present?
          @cancel_btn
        end
      end
    end
  end
end