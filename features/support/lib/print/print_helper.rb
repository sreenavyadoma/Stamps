module Stamps
  module Print
    def postage
      Print::PrintPostage.new param, @scenario_name
    end
    #
  end
end