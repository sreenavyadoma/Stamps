module Stamps
  class StampsDotCom < Browser::Base


    def navigation_bar
      cache[:navigation].nil? ? cache[:navigation] = Navigation::NavigationBar.new(param) : cache[:navigation]
    end

    def orders
      cache[:orders].nil? ? cache[:orders] = WebOrders.new(param) : cache[:orders]
    end

    def mail
      cache[:mail].nil? ? cache[:mail] = WebMail.new(param) : cache[:mail]
    end

    def common_modals
      cache[:shared_modals] = Stamps::Browser::Base.new(param).extend(Stamps::Common::Modals) if cache[:shared_modals].nil?
      cache[:shared_modals]
    end
  end
end

