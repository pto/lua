-- Produce a pseudo-random number with a standard normal (Gaussian) distribution
function normal ()
    local x, y = math.random(), math.random()
    local radius = math.sqrt(-2.0 * math.log(x))
    local angle = 2.0 * math.pi * y
    return radius * math.cos(angle)
end


function square (x)
    return x * x
end

-- Calculate mean and standard deviation of n calls to normal()
function result (n)
    local a = {}
    local sum, min, max = 0, math.maxinteger, math.mininteger
    for i = 0, n-1 do
        a[i] = normal()
        sum = sum + a[i]
        if a[i] < min then
            min = a[i]
        end
        if a[i] > max then
            max = a[i]
        end
    end

    local mean = sum/n
    local diffsum = 0
    for i = 0, n-1 do
        diffsum = diffsum + square(a[i]-mean)
    end

    print("min is", min)
    print("max is", max)
    print("mean is", mean)
    print("standard deviation is", math.sqrt(diffsum/(n-1)))
end


