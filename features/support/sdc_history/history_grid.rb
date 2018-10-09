module SdcHistory

  class Grid < SdcPage
  end

  module Grid
    class << self
      def grid
        Grid.new
      end
    end
  end

end