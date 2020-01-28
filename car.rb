class Car

  include Company

  attr_reader :type, :number

  def initialize(number, type)
    @number = number
    @type = type
  end

end
