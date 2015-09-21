module Batch

  class PageStyles < BatchObject
    def general
      @general ||= General.new @browser
    end
  end

  class General < BatchObject

    class Fonts < BatchObject
      def font_family
        @browser.body.style "font-family"
      end

      def font_size
        @browser.body.div.style "font-size"
      end

      def color
        body_color = @browser.body.style "color"
        color_arr = body_color.scan /\d/
        temp = ""
        color_arr.each{|element| temp = temp + element}
        temp
      end
    end

    class Tooltip < BatchObject
      def width
        @browser.link :css => "a[data-qtip*='Configure your settings']"
      end
    end

    def fonts
      @fonts ||= Fonts.new @browser
    end

    def tooltip
      @fonts ||= Tooltip.new @browser
    end

  end
end