module Stamps

  module SdcMail

    class SdcMailLandingPage < SdcPage
      page_url { |env| "https://print#{env}.stamps.com/webpostage/default2.aspx" }
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

      def envelope
        @envelope ||= Envelope.new
      end
    end
  end
end