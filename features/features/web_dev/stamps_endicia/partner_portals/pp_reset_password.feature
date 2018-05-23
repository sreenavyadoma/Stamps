@pp_reset_password
Feature: PP-MVP: Reset Password page

  Background:
    Given PP: A user navigates to the Reset Password Page

  Scenario: PP: Reset Password Page Validation
    Then PP: expect reset password page email text field exists
    Then PP: expect reset password page submit button exists
    Then PP: expect reset password page icon exists
    Then PP: expect global header exists
    Then PP: expect footer to exists

    Then PP: reset password page click on submit button
    Then PP: expect reset password page email error message index 1 to be This field is required.
    Then PP: set reset password page email to abc
    Then PP: reset password page click on submit button
    Then PP: expect reset password page email error message index 1 to be Valid email address required.
    Then PP: set reset password page email to env value
    Then PP: reset password page click on submit button
    Then PP: expect reset email sent header exists

