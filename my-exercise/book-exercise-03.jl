# Exercise 3.1
x = 1:10^6
y = collect(x)
using BenchmarkTools: @btime
@btime sort($x);
@btime sort($y);
@edit sort(x)
@edit sort(y)
