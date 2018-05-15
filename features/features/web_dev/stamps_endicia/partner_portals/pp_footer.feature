Feature: PP-MVP: Footer

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_footer
  Scenario: PP: Footer Validation
    Then PP: expect footer to exists
    Then PP: expect Copyright Stamps.com Inc link exists