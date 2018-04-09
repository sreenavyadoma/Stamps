Feature: Login Page

    Background:
        Given Start test driver
#        Given PP: user's Status = Active
#        Given PP: Partner user's partner account Status = Active
#        Given PP: Partner user's partner contract Status = Active

    @sdc_endicia_pp_log_in
    Scenario: All conditions are true
        Then PP: A user navigates to the login page
#        Then PP: email field shows placeholder "Email"
#        Then PP: password field shows placeholder "Password"
#        Then PP: user clicks "Log In"
#        Then PP: expect email shows error message "This field is required.
#        Then PP: expect Password shows error message "This field is required."
#        Then PP: user enters invalid email pattern into Email
#        Then PP: user blur off Email
#        Then PP: expect email field shows error message "Valid email requested"
#        Then PP: user enters invalid value into Password
#        Then PP: user blurs off Password
#        Then PP: password shows error message "Field value should have at least 8 characters"
#        Then PP: password shows error message "Field value should include at least 1 number"
#        Then PP: password shows error message "Field value should include at least 1 letter"
#        Then PP: user enters same valid value into Email and Password
#        Then PP: user blurs off Password
#        Then PP: password shows error message "Field value should not be the same as EMAIL"
#        Then PP: user enters valid Email/Password combination
#        Then PP: user clicks "Log In"
#        Then PP: website redirects user to Dashboard Page
#        Then PP: website records login event in Audit Records

