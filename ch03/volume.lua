-- Volume of a right circular cone, given the height and the angle (in degrees)
-- between a generatrix and the axis.
function volume (height, angle)
    local radius = height/math.tan(angle*math.pi/180)
    return math.pi*radius*radius*height/3.0
end
