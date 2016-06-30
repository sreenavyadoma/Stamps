module Stamps
  module WebReg
    include Stamps

    def registration
      Registration.new param
    end
  end
end