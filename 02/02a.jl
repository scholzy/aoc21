#!/usr/bin/env julia

function main()
    f = split.(readlines("input"))

    depth = 0
    position = 0
    for i in range(1, length(f))
        direction = f[i][1]
        amount = parse(Int, f[i][2])
        if direction == "forward"
            position += amount
        elseif direction == "down"
            depth += amount
        elseif direction == "up"
            depth -= amount
        end
    end

    print(depth * position)
end
