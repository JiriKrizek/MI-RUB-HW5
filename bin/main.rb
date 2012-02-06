# Given several segments of line (int the X axis) with coordinates [Li,Ri]. 
# You are to choose the minimal amount of them, such they would completely cover 
# the segment [0,M].

require '../lib/interval.rb'
require '../lib/parser.rb'
require '../lib/solver.rb'


p = Parser.new
all_cases = p.parseInput

solver = Solver.new
solver.solve(all_cases)