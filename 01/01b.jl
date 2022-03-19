#!/usr/bin/env julia

# The code for 01b is identical but needs a 3-point sliding sum, which
# I've adapted from SO code for a moving average.
#   https://stackoverflow.com/questions/59562325/moving-average-in-julia
moving_sum(vs,n) = [sum(@view vs[i:(i+n-1)]) for i in 1:(length(vs)-(n-1))]

function main()
    f_int = parse.(Int, readlines("input"))
    f_sum = moving_sum(f_int, 3)

    # `hold` will contain the previous depth
    # `counter' the number of times the depth increases
    hold = 0
    counter = 0

    for i in range(1, length(f_sum))
        val = f_sum[i]

        # There's no depth before the first one
        if i > 1
            if val > hold
                counter += 1
            end
        end
        hold = val
    end

    print(counter)
end

main()
