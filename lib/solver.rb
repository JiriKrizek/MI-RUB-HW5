class Solver
  def solve(all_cases)
    arr = Array.new
    all_cases.each do |one_case|
      arr << reduction(one_case)
    end

    print_all(arr)
  end  

private
  def reduction(test_case)
    hash = test_case.hash
    m = test_case.m

    reducted = Hash.new

    stop = 0
    hash.each_pair do |start,interval|
      # behalf [0;  *M*  ]
      return reducted if(interval.a>m)

      # covers more than previous interval
      next if interval.b<=stop

      # is interval next to previous one?
      return Hash.new if(start > stop)

      stop = interval.b
      reducted[start]=interval
    end
    reducted
  end

  def print_all(array)
    start = true
    array.each do |a|
      print "\n\n" unless start
      start=false
      print "#{a.size}"
      a.each do |key,interval|
        print "\n#{interval.a} #{interval.b}"
      end
    end
  end
end
