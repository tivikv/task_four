class CargoCar < Car

  attr_reader :vol, :selected_vol

  def initialize (vol)
    @vol = vol
    @selected_vol = 0
  end

  def take_vol
    if @vol - @selected_vol > 0
      @selected_vol += 1
    end
  end

  def free_vol
    @vol - @selected_vol
  end

end
