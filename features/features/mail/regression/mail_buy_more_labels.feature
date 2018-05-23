Feature: Validate Buy more labels link

  Background:
    Given a valid user is signed in to Web Apps

  @mail_buy_more_labels
  Scenario: Buy more labels link

    Then select Print On Stamps
    Then click on buy more labels link
    Then expect buy more labels link NetStamps home button exists

    Then sign out
