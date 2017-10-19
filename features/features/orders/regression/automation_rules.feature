@automation_rule
Feature: Validate Automation Rule Tab

  Background:
    Given a valid user is signed in to Web Apps

  @automation_rule_content
  Scenario: Validate Automation rule Tab contents
    Then open Settings Modal
    Then click Orders Settings Automation Rules tab
    Then expect Automation Rules page Add Button exists
    Then expect Automation Rules page header contain Save time with Automation Rules
    Then expect Automation Rules page paragraph contain To get started, click the Add button on the top left.
    Then Close Settings modal
    Then Sign out

  @automation_rule_add_without_criteria
  Scenario: Add new Automation rule w/o criteria
    Then open Settings Modal
    Then click Orders Settings Automation Rules tab
    Then click Automation Rules page Add Button
    Then expect New Rule modal exists
    Then set New Rule modal Rule name to First Automation Rule
    Then expect Active rule checkbox checked
    Then expect Apply actions selected
    Then click New Rule modal Add Action
    Then set New Rule modal service to etc.
    Then set New Rule modal drop-down to FCM Package
    Then click New Rule modal Save Rule button
    Then expect Automation Rules modal, Rule name is present
    Then Close Settings modal
    Then Sign out

  @automation_rule_add_with_criteria
  Scenario: Add new Automation rule with criteria
    Then open Settings Modal
    Then click Orders Settings Automation Rules tab
    Then click Automation Rules page Add Button
    Then expect New Rule modal exists
    Then set New Rule modal Rule name to First Automation Rule
    Then expect Active rule checkbox checked
    Then expect Apply actions selected
    Then click New Rule Modal specific criteria actions
    Then click New Rule Modal Add Criteria
    Then set New Rule Modal first drop-down to State
    Then set New Rule Modal second drop-down to Is Equal To
    Then set New Rule Modal third drop-down to California
    Then click New Rule modal Add Action
    Then set New Rule modal service to etc.
    Then set New Rule modal drop-down to FCM Package
    Then click New Rule modal Save Rule button
    Then expect Automation Rules modal, Rule name is present
    Then Close Settings modal
    Then Sign out

  @automation_rule_edit_w/o_criteria
  Scenario: Edit new Automation rule w/o criteria
    Then open Settings Modal
    Then click Orders Settings Automation Rules tab
    Then click Automation Rules page automation rule Name
    Then click Automation Rules page Edit Button
    Then expect Edit Rule modal exists
    Then set Edit Rule modal rule name to First Edited Automation Rule
    Then click Edit Rule modal Add Action
    Then set Edit Rule modal service to etc.
    Then set Edit Rule modal drop-down to FCM Package
    Then click Edit Rule modal Save Rule button
    Then expect Automation Rules modal, updated Rule name present
    Then click Automation Rules page automation rule Name
    Then click Automation Rules page Edit Button
    Then expect Edit Rule modal, Rule name to First Edited Automation Rule
    Then expect Edit Rule modal, service to etc.
    Then expect Edit Rule modal, drop-down to FCM Package
    Then Close Settings modal
    Then Sign out

  @automation_rule_edit_with_criteria
  Scenario: Edit new Automation rule with criteria
    Then open Settings Modal
    Then click Orders Settings Automation Rules tab
    Then click Automation Rules page automation rule Name
    Then click Automation Rules page Edit Button
    Then expect Edit Rule modal exists
    Then set Edit Rule modal rule name to First Edited Automation Rule
    Then set Edit Rule Modal first drop-down to State
    Then set Edit Rule Modal second drop-down to Is Equal To
    Then set Edit Rule Modal third drop-down to California
    Then set Edit Rule modal service to etc.
    Then set Edit Rule modal drop-down to FCM Package
    Then click Edit Rule modal Save Rule button
    Then expect Automation Rules modal, updated Rule name present
    Then click Automation Rules page automation rule Name
    Then click Automation Rules page Edit Button
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
    Then click Orders Settings Automation Rules tab
    Then click Automation Rules page automation rule Name
    Then click Automation Rules page Delete button
    Then expect Delete Automation Dialog is present
    Then expect Delete dialog header is Delete Automation Rule?
    Then expect Delete Automation Dialog, Delete button is present
    Then expect Delete Automation Dialog, Cancel button is present
    Then click Delete Automation dialog Delete button
    Then expect Automation Rules page, rule name is not present
    Then Close Settings modal
    Then Sign out