require '../lib/testcase.rb'

class Parser
  def parseInput
    @test_cases = get_test_cases
    @DEBUG=false
    get_blank_line

    @all_cases = Array.new

    for i in 1..@test_cases
      intervals = Hash.new

      puts "Test case #{i}, enter m:" if @DEBUG
      m = get_m
      dest_interval = Interval.new(m)
      puts "dest interval is [0-#{m}]" if @DEBUG
      
      while(line = $stdin.readline.chomp)
        if(line == "0 0")
          get_blank_line unless i==@test_cases
          break
        end
        
        interval=get_integer(line)
        # Interval starts before 0? -> trim for hashmap
        interval.a>=0 ? starts_at = interval.a : starts_at = 0

        if intervals.key?(starts_at)
          # Replace interval with longer interval
          intervals[starts_at] = interval if intervals[starts_at].len < interval.len 
        else
          # insert to hashmap if not >=m
          intervals[starts_at] = interval if starts_at < m
        end
        p intervals if @DEBUG
      end
      sorted_intervals=Hash[intervals.sort]
      @all_cases << TestCase.new(sorted_intervals, m)
    end    
    @all_cases
  end

private
  # Scan for blank line or print error
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


  
end