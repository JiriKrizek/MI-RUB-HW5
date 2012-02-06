# Given several segments of line (int the X axis) with coordinates [Li,Ri]. 
# You are to choose the minimal amount of them, such they would completely cover 
# the segment [0,M].

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

    # vzdalenost bereme az od nuly
    a>=0 ? @len = @b - @a : @len = @b
  end
end



def get_blank_line
  blank = $stdin.readline.chomp

  unless blank.empty?
    puts "Error: Empty line expected"
    exit
  end
end

def get_m
    m = $stdin.readline.chomp.to_i
    unless m >=1 && m <=5000
      puts "Error: m must be between 1 and 5000"
      exit
    end
    m
end

def get_integer(line)
  integers=line.chomp.split(' ')
    unless integers.size == 2
      print "Error: interval can have only two values, you entered #{integers.size}"
      exit
    end

    begin
      a = Integer(integers[0])
      b = Integer(integers[1])
      fail ArgumentError if a>50000 || b>50000
      interval = Interval.new(a,b)
    rescue ArgumentError
      print "Error: interval value is invalid"
      exit
    end
    interval
end

def get_test_cases
  test_cases = $stdin.readline.chomp.to_i

  unless test_cases > 0
    puts "Error: you must insert value > 0"
    exit
  end  
  test_cases
end

def reduction(hash)
  reducted = Hash.new

  stop = 0
  hash.each_pair do |start,interval|
    next if start<stop
    stop = interval.b
    reducted[start]=interval
  end

  reducted
end

test_cases = get_test_cases
get_blank_line

for i in 1..test_cases
  intervals = Hash.new

  puts "Test case #{i}, enter m:"
  m = get_m
  dest_interval = Interval.new(m)
  puts "dest interval is [0-#{m}]"
  
  while(line = $stdin.readline.chomp)
    if(line == "0 0")
      get_blank_line unless i==test_cases
      break
    end
    
    interval=get_integer(line)
    interval.a>=0 ? starts_at = interval.a : starts_at = 0

    if intervals.key?(starts_at)
      # Replace interval with longer interval
      intervals[starts_at] = interval if intervals[starts_at].len < interval.len 
    else
      intervals[starts_at] = interval
    end
    p intervals
  end
    sorted=Hash[intervals.sort]
    p reduction(sorted)
end
