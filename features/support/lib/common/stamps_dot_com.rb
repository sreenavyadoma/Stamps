module Stamps
  class StampsDotCom < WebApps::Base
    def navigation_bar
      @navigation ||= Navigation::NavigationBar.new(param)
    end

    def orders
      @orders ||= Orders::WebOrders.new(param)
    end

    def mail
      @mail ||= Mail::WebMail.new(param)
    end

    def common_modals
      @common ||= WebApps::Base.new(param).extend(Stamps::Common::Modals)
    end

    def rating
      @rating ||= Rating.new(param)
    end
  end
end