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

    @len = @b - @a
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
    p "New: #{interval}"

    if intervals.key?(interval.a)
      # Replace interval with longer interval
      print "contains #{interval.a}"
      intervals[interval.a] = interval if intervals[interval.a].len < interval.len 
    else
      print "not contain #{interval.a}"
      intervals[interval.a] = interval
    end
    p intervals
    p Hash[intervals.sort]

  end
end
