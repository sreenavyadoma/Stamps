
Feature: Web Batch Styles
  Open Style Guide: http://sdcintranet/ProductAndServiceOperations/ProductManagement/Product%20Management%20Documents/Web%20Client/Style%20Guide/Web%20Client%20Style%20Guide.docx

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto40/password1

  @styles @regression
  Scenario: Font and tool tips
    Then Expect Style General Fonts font-family to include helvetica
    Then Expect Style General Fonts font-family to include arial
    Then Expect Style General Fonts font-family to include sans-serif
    Then Expect Style General Fonts font-family to include s60 sans
    Then Expect Style General Fonts Color to be 0001
    Then Expect Style General Fonts Size to be 14px
    Then Expect Style General Tooltip border width to be 1
    Then Expect Style General Tooltip border style to be solid
