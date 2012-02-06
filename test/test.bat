cat 1.txt | ruby ../bin/main.rb > 1.outn
diff 1.out 1.outn
del 1.outn

cat 2.txt | ruby ../bin/main.rb > 2.outn
diff 2.out 2.outn
del 2.outn