
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
