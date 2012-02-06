class Interval
  attr_reader :a, :b, :len

  def initialize(ending, start=0)
    if(start <= ending) 
      @a = start
      @b = ending
    else
      @a = ending
      @b = start
    end

    # length of interval is counted only in interval 0..inf
    a>=0 ? @len = @b - @a : @len = @b
  end

  
end

