# Given several segments of line (int the X axis) with coordinates [Li,Ri]. 
# You are to choose the minimal amount of them, such they would completely cover 
# the segment [0,M].


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

for i in 1..test_cases
  m = get_m
end
