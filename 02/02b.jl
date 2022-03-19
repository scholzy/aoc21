#!/usr/bin/env julia

function main()
    f = split.(readlines("input"))

    depth = 0
    position = 0
    aim = 0

    for i in range(1, length(f))
        direction = f[i][1]
        amount = parse(Int, f[i][2])
        if direction == "forward"
            position += amount
            depth += amount * aim
        elseif direction == "down"
            aim += amount
        elseif direction == "up"
            aim -= amount
        end
    end

    print(depth * position)
end
