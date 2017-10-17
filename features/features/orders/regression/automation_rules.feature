@automation_rule
Feature: Validate Automation Rule Tab

  Background:
    Given a valid user is signed in to Web Apps

  @automation_rule_content
  Scenario: Validate Automation rule Tab contents
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then expect Automation Rules page Add Button exists
    Then expect Automation Rules page header contain Save time with Automation Rules
    Then expect Automation Rules page paragraph contain To get started, click the Add button on the top left.
    Then Close Settings modal
    Then Sign out

  @automation_rule_add_w/o_criteria
  Scenario: Add new Automation rule w/o criteria
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then in Automation Rules page, click on Add Button
    Then expect New Rule modal exists
    Then in New Rule modal, set Rule name to First Automation Rule
    Then expect Active rule checkbox checked
    Then expect Apply actions selected
    Then in New Rule modal, click on Add Action
    Then in New Rule modal, set service to etc.
    Then in New Rule modal, set drop-down to FCM Package
    Then in New Rule modal, click on Save Rule button
    Then expect Automation Rules modal, Rule name present
    Then Close Settings modal
    Then Sign out

  @automation_rule_add_with_criteria
  Scenario: Add new Automation rule with criteria
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then in Automation Rules page, click on Add Button
    Then expect New Rule modal exists
    Then in New Rule modal, set Rule name to First Automation Rule
    Then expect Active rule checkbox checked
    Then expect Apply actions selected
    Then in New Rule Modal, click on specific criteria actions
    Then in New Rule Modal, click on Add Criteria
    Then in New Rule Modal, set first drop-down to State
    Then in New Rule Modal, set second drop-down to Is Equal To
    Then in New Rule Modal, set third drop-down to California
    Then in New Rule modal, click on Add Action
    Then in New Rule modal, set service to etc.
    Then in New Rule modal, set drop-down to FCM Package
    Then in New Rule modal, click on Save Rule button
    Then expect Automation Rules modal, Rule name present
    Then Close Settings modal
    Then Sign out

  @automation_rule_edit_w/o_criteria
  Scenario: Edit new Automation rule w/o criteria
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then in Automation Rules page, click on automation rule Name
    Then in Automation Rules page, click on Edit Button
    Then expect Edit Rule modal exists
    Then in Edit Rule modal, set Rule name to First Edited Automation Rule
    Then in Edit Rule modal, click on Add Action
    Then in Edit Rule modal, set service to etc.
    Then in Edit Rule modal, set drop-down to FCM Package
    Then in Edit Rule modal, click on Save Rule button
    Then expect Automation Rules modal, updated Rule name present
    Then in Automation Rules page, click on automation rule Name
    Then in Automation Rules page, click on Edit Button
    Then expect Edit Rule modal, Rule name to First Edited Automation Rule
    Then expect Edit Rule modal, service to etc.
    Then expect Edit Rule modal, drop-down to FCM Package
    Then Close Settings modal
    Then Sign out

  @automation_rule_edit_with_criteria
  Scenario: Edit new Automation rule with criteria
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then in Automation Rules page, click on automation rule Name
    Then in Automation Rules page, click on Edit Button
    Then expect Edit Rule modal exists
    Then in Edit Rule modal, set Rule name to First Edited Automation Rule
    Then in Edit Rule Modal, set first drop-down to State
    Then in Edit Rule Modal, set second drop-down to Is Equal To
    Then in Edit Rule Modal, set third drop-down to California
    Then in Edit Rule modal, set service to etc.
    Then in Edit Rule modal, set drop-down to FCM Package
    Then in Edit Rule modal, click on Save Rule button
    Then expect Automation Rules modal, updated Rule name present
    Then in Automation Rules page, click on automation rule Name
    Then in Automation Rules page, click on Edit Button
    Then expect Edit Rule modal, Rule name to First Edited Automation Rule
    Then expect Edit Rule modal, first drop-down to State
    Then expect Edit Rule modal, second drop-down to Is Equal To
    Then expect Edit Rule modal, third drop-down to California
    Then expect Edit Rule modal, service to etc.
    Then expect Edit Rule modal, drop-down to FCM Package
    Then Close Settings modal
    Then Sign out

  @automation_rule_delete
  Scenario: Delete Automation rule
    Then open Settings Modal
    Then in Orders Settings, click on Automation Rules tab
    Then in Automation Rules page, click on automation rule Name
    Then in Automation Rules page, click on Delete button
    Then expect Delete Automation Dialog is present
    Then expect Delete dialog header is Delete Automation Rule?
    Then expect Delete Automation Dialog, Delete button is present
    Then expect Delete Automation Dialog, Cancel button is present
    Then in Delete Automation dialog, click on Delete button
    Then expect Automation Rules page, rule name is not present
    Then Close Settings modal
    Then Sign out