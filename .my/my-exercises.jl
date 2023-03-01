# Exercise 3.1
x = 1:10^6
y = collect(x)
using BenchmarkTools: @btime
@btime sort($x);
@btime sort($y);
@edit sort(x)
@edit sort(y)

# Exercise 4.2

function dice_distribution(d1::Vector{Int64}, d2::Vector{Int64})
    sd = Dict{Int,Int}()
    for i in d1, j in d2
        s = i + j
        sd[s] = get(sd, s, 0) + 1
    end
    return sd
end

function test_dice()
    all_dice = [[1, x2, x3, x4, x5, x6]
                for x2 in 2:11
                for x3 in x2:11
                for x4 in x3:11
                for x5 in x4:11
                for x6 in x5:11]
    standard_dice = collect(1:6)
    two_standard = dice_distribution(standard_dice, standard_dice)
    for (i, d1) in enumerate(all_dice), d2 in all_dice[i:end]
        test = dice_distribution(d1, d2)
        test == two_standard && println(d1, " ", d2)
    end
end

test_dice()
# EXERCISE 7.1
using Missings: passmissing
v = ["1", "2", missing, "4"]
passmissing(parse).(Int, v)

# EXERCISE 7.2
using Dates
[Date(2021, i, 1) for i in 1:12]
Date.(2021, 1:12, 1)
Date(2021,1,1):Month(1):Date(2021,12,1) |> collect

# Negating a boolean array

arr = [true, false, false, true]
.!arr

### Comparison guaranteeing Boolean result
isless(1, missing)
isless(missing, 1)

# Exercise 7.3

using HTTP
using JSON3
query = "https://api.nbp.pl/api/exchangerates/rates/a/usd/2020-06-01/2020-06-30/?format=json"
response = HTTP.get(query)
json = JSON3.read(response.body)
json.rates
dates = [x.effectiveDate for x in json.rates]
rates = [x.mid for x in json.rates]
