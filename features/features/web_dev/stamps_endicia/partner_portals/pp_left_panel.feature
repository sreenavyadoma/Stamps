@pp_left_panel
Feature: PP-MVP: Left Panel

  Background:
    Given Start test driver

  Scenario: PP: Left Panel Validation

  #Validate sidebar on an unauthenticated page
    Then PP: A user navigates to the login page
    Then PP: expect left panel