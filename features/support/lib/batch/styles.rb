module Batch

  class PageStyles < BatchObject
    def general
      @general ||= General.new @browser
    end
  end

  class General < BatchObject

    class Links < BatchObject
      def color
        field = @browser.link :css => "a[rel=WebBatch]"
        browser_helper.wait_until_present field
        style = field.style "color"
        style
      end

      def padding

      end

      def background_color

      end
    end

    class NavigationHeader < BatchObject
      def height
        field = @browser.div :class => "navbar-inner"
        browser_helper.wait_until_present field
        field.style "height"
      end

      def background_color
        field = @browser.div :class => "navbar-inner"
        browser_helper.wait_until_present field
        style = field.style "background-color"
        style
      end
    end

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
        field = @browser.link :css => "a[dev-qtip*='Configure your settings']"
        browser_helper.wait_until_present field
        field.style "border-width"
      end
      
      def border_radius
        field = @browser.link :css => "a[dev-qtip*='Configure your settings']"
        browser_helper.wait_until_present field
        field.style "padding"
      end

      def border_style
        field = @browser.link :css => "a[dev-qtip*='Configure your settings']"
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

    def navigation_header
      @navigation_header = NavigationHeader.new @browser
    end

    def links
      @links = Links.new @browser
    end

  end
end