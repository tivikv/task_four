class Car
  #include Company
  attr_reader :type, :number

  NUMBER_FORMAT = /\.d/i

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  def validate?
    validate!
  rescue
    false
  end

  protected
  def validate!
    raise "Номер вагона не указан" if number.nil?
    raise "Номер вагона не должен быть меньше 3-х символов" if number.length < 3
    raise "Некорректный номер вагона" if number !~ NUMBER_FORMAT
  end

end
