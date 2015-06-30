module Batch

  #
  # Navigation bar containing Sign-in, etc
  #
  class NavigationBar < BrowserField
    private
    def username_field
      @browser.span(:id => 'userNameText')
    end

    def sign_out_link
      @browser.link :id => "signOutLink"
    end

    public

    def sign_out
      begin
        2.times { #todo must hover over signout link
          field_helper.click username_field, "userNameText" unless sign_out_link.present?
          field_helper.click sign_out_link, "signOutLink"
          sign_in_button_field.wait_until_present(3)
          break field_helper.field_present?  sign_in_button_field
        }
      rescue
        #ignore
      end
    end

    def username
      username_field.when_present.text
    end

    def wait_until_present(timeout)
      username_field.wait_until_present(timeout)
    end

    def present?
      field_helper.field_present?  username_field
    end

  end
end