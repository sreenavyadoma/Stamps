module Stamps
  class StampsDotCom < Browser::StampsModal
    def apps
      @apps ||= {}
    end

    def navigation_bar
      apps[:navigation_bar] = Navigation::NavigationBar.new(param) if apps[:navigation_bar].nil? || !apps[:navigation_bar].present?
      apps[:navigation_bar]
    end

    def orders
      apps[:orders] = WebOrders.new(param) if apps[:orders].nil?
      apps[:orders]
    end

    def mail
      apps[:mail] = WebMail.new(param) if apps[:mail].nil?
      apps[:mail]
    end
  end
end
