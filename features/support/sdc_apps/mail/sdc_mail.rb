module Stamps
  module CommonNavigation
    def mail

    end

    def orders

    end

    def contacts

    end

    def history

    end
  end

  module Mail
    class SignInLink < SdcPageObject
      # usr element

      def sign_in_with(usr, pw)

      end
    end

    class SdcMail
      include CommonNavigation

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def sign_in_link
        # sign-in modal
      end

      def print_form

      end

      def toolbar

      end

      def status_bar

      end
    end
  end
end