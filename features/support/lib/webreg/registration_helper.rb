module WebReg
  include Stamps

  def registration
    Registration.new @browser
  end
end