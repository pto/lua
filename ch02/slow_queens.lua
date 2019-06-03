N = 8    -- board size
count = 0
solutions = 0

-- check whether position (n,c) is free from attacks
function isplaceok (a, n, c)
    count = count + 1
    for i = 1, n - 1 do   -- for each queen already placed
        if (a[i] == c) or                -- same column?
            (a[i] - i == c - n) or        -- same diagonal?
            (a[i] + i == c + n) then      -- same diagonal?
            return false            -- place can be attacked
        end
    end
    return true    -- no attacks; place is OK
end

-- print a board
function printsolution (a)
    solutions = solutions + 1
    for i = 1, N do      -- for each row
        for j = 1, N do    -- and for each column
            -- write "X" or "-" plus a space
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

-- check all permutations of array a starting at position low+1
function permute (a, low)
    if low == N then
        if checkarray(a) then
            printsolution(a)
        end
    else
        for k, v in pairs(a) do
            if k > low then
                a[low+1], a[k] = a[k], a[low+1]
                permute(a, low+1, n, f)
                a[low+1], a[k] = a[k], a[low+1]
            end
        end
    end
end

function checkarray (a)
    for r = 1, N do
        if not isplaceok(a, r, a[r]) then
            return false
        end
    end
    return true
end

-- run the program
permute({1, 2, 3, 4, 5, 6, 7, 8}, 0)
print("isplaceok count:", count)
print("solutions count:", solutions)
