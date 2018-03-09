module Stamps
  module Orders
    class PageStyles < WebApps::Base
      def general
        General.new(param)
      end
    end

    class General < WebApps::Base

      class Links < WebApps::Base
        def color
          field=driver.link css: "a[rel=WebBatch]"
          field.wait_until_present 6
          style=field.style "color"
          style
        end

        def padding

        end

        def background_color

        end
      end

      class NavigationHeader < WebApps::Base
        def height
          field=driver.div class: "navbar-inner"
          field.wait_until_present 5
          field.style "height"
        end

        def background_color
          field=driver.div class: "navbar-inner"
          field.wait_until_present 5
          style=field.style "background-color"
          style
        end
      end

      class Fonts < WebApps::Base
        def font_family
          driver.body.style "font-family"
        end

        def font_size
          driver.body.div.style "font-size"
        end

        def color
          body_color=driver.body.style "color"
          color_arr=body_color.scan /\d/
          temp=""
          color_arr.each{|field| temp=temp + field}
          temp
        end
      end

      class Tooltip < WebApps::Base
        def width
          field=driver.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 6
          field.style "border-width"
        end

        def border_radius
          field=driver.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 5
          field.style "padding"
        end

        def border_style
          field=driver.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 5
          field.style "border-style"
        end
      end

      def fonts
        Fonts.new(param)
      end

      def tooltip
        Tooltip.new(param)
      end

      def navigation_header
        @navigation_header=NavigationHeader.new(param)
      end

      def links
        @links=Links.new(param)
      end
    end
  end
end