module Print

  class PrintObject < Stamps::Browser::BrowserObject
  end

  class PostageHelper
    include Singleton
    include DataMagic

  end

end