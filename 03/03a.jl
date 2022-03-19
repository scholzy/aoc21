#!/usr/bin/env julia

function main()
    f = readlines("input")

    # f comes as a Vector of String. I want a Matrix of Char
    f_mat = hcat(collect.(f)...)

    word_size = length(f[1])
    num_words = length(f)

    gamma = zeros(Int64, word_size)
    epsilon = zeros(Int64, word_size)

    for i in range(1, word_size)
        num_ones = sum(parse.(Int64, f_mat[i, :]))
        if num_ones > (num_words / 2)
            gamma[i] = 1
        else
            epsilon[i] = 1
        end
    end

    bit2char(x) = Char('0' + x)
    g = String(bit2char.(gamma))
    e = String(bit2char.(epsilon))

    print(parse(Int64, g, base=2) * parse(Int64, e, base=2))
end

main()
