module Stamps
  class StampsDotCom < Browser::StampsModal
    def navigation_bar
      (cache[:navigation_bar].nil?||!cache[:navigation_bar].present?)?cache[:navigation_bar]=Navigation::NavigationBar.new(param):cache[:navigation_bar]
    end

    def orders
      (cache[:orders].nil?)?cache[:orders]=WebOrders.new(param):cache[:orders]
    end

    def mail
      (cache[:mail].nil?)?cache[:mail]=WebMail.new(param):cache[:mail]
    end

    private
    def cache
      @cache ||= {}
    end
  end
end
