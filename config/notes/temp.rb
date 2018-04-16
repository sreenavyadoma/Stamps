
module TestMethods
  class << self
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def assign(thing)
        @thing=thing
      end

      def thing
        @thing
      end
    end
  end
end

class Parent
  include TestMethods

  def thing
    self.class.thing
  end
end

class Daughter < Parent
  

  def add(name, value)
    thing[name]=value
  end

  def list
    thing.each{ |blah| p blah}
  end
end

class School < Parent

end

daughter = Daughter.new
p Daughter.thing
p daughter.thing
p daughter.list
#daughter.add(:one, 1)
#daughter.add(:two, 2)
p daughter.list


son._page_object
daughter.thing
son = Son.new

p son._page_object


module TestMethods
  class << self
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def assign(thing)
        @thing=thing
      end

      def thing
        @thing
      end
    end
  end
end

class Parent
  include TestMethods
end


class Daughter < Parent
  assign(['my', 'things'])

  def add(something)
    thing.insert(something)
  end

  def list
    thing.each{ |blah| p blah}
  end

  def thing
    self.class.thing
  end
end

daughter = Daughter.new
p Daughter.thing
p daughter.thing
p daughter.list
daughter.add('array')
p daughter.list


son.thing
daughter.thing
son = Son.new

p son._page_object




      def xxxxxxxx
        yyyyyyyyyyyyyyyyyyyyy if @xxxxxxxx.nil?||!@xxxxxxxx.present?
        @xxxxxxxx
      end




