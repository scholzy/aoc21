#!/usr/bin/env julia

function main()
    f = readlines("input")

    # `hold` will contain the previous depth
    # `counter' the number of times the depth increases
    hold = 0
    counter = 0

    for i in range(1, length(f))
        val = parse(Int, f[i])

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
