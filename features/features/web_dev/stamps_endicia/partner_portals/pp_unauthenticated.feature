Feature: PP-MVP: Unauthenticated

  Background:
    Given PP: A valid user is signed into Partner Portal

  @pp_unauthenticated
  Scenario: PP: Unauthenticated Validation

    Then PP: de-authenticate user
    Then PP: expect user is redirect to the login page
