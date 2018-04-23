module Stamps

  module SdcMail
    class SignInLink < SdcPage
      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }


    end

    class << self

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