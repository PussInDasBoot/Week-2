Self refers to the parent object of where it resides. If it resides within an INSTANCE method then it refers to the INSTANCE of that class. If however it resides in a CLASS method, it refers to that class. If it sits within a class definition, it also refers to that class.

If you give an instance variable writer access (eg attr_writer or attr_accessor), then if you want to change what the value that instance METHOD would do when called on an instance, then you should use "self.instance_method". This is because if you don't, Ruby will be confused when you are trying to change the value calling the instance method on the instance will do. Ruby will not recognise the instance method as that, but rather as a new local variable you are trying to describe. Eg:

class Cat
attr_accessor :color
  def initialize(color)
    @color = color
  end

  def dye(new_color)
    color = new_color
  end
end

If you gave Ruby this, Ruby would think that you are trying to define a new local variable "color" within the "dye" method. But instead what you're trying to do is when you call .dye on an instance of Cat (eg fluffy), you want to change the color of fluffy's fur to a new_color. Thus you would have to write:

def dye(new_color)
  self.color = new_color
end