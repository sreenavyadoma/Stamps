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
        field = @browser.link :css => "a[data-qtip*='Configure your settings']"
        browser_helper.wait_until_present field
        field.style "border-width"
      end
      
      def padding
        field = @browser.link :css => "a[data-qtip*='Configure your settings']"
        browser_helper.wait_until_present field
        field.style "padding"
      end

      def border_style
        field = @browser.link :css => "a[data-qtip*='Configure your settings']"
        browser_helper.wait_until_present field
        field.style "border-style"
      end
    end

    def fonts
      @fonts ||= Fonts.new @browser
    end

    def tooltip
      @tooltip ||= Tooltip.new @browser
    end

  end
end