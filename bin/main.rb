# Given several segments of line (int the X axis) with coordinates [Li,Ri]. 
# You are to choose the minimal amount of them, such they would completely cover 
# the segment [0,M].

class Interval
  attr_reader :m

  def initialize(interval)
    @m = interval
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
  puts "Test case #{i}, enter m:"
  m = get_m
  interval = Interval.new(m)
  puts "Interval is [0-#{m}]"
  
  while(line = $stdin.readline)
    if(line.chomp == "0 0")
      get_blank_line
      break
    end

    p "Line: #{line}"
  end
end
