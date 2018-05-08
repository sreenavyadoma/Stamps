@pp_dashboard_page_validation
Feature: PP-MVP: Login Page

  Background:
    Given PP: A valid user is signed into Partner Portal

  Scenario: PP: Login Page Validation
    Then PP: expect dashboard page header exist
    Then PP: expect dashboard page the Left Panel exist
    Then PP: expect dashboard page the Footer exist
    Then PP: expect dashboard page the Contract drop-down does not exist
    Then PP: expect dashboard page the Last updated on field to be present

    # Preffered Rates Qualified Postage $
    And PP: expect dashboard page the Preferred Rates Qualified Postage $ Chart to exist
    And PP: expect dashboard page the Preferred Rates Qualified Postage Chart $ has X-axix to be labeled with month abbreviations
    And PP: expect dashboard page the Preferred Rates Qualified Postage Chart $ Y-axis to start at 0
    And PP: expect dashboard page the Preferred Rates Qualified Postage Chart $ legends to exist
    And PP: expect dashboard page the Preferred Rates Qualified Postage Chart $ Units of Representation to be in USD ($).
