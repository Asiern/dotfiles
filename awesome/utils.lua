-- Standard awesome library
local gears = require("gears")

local utils = {}

utils.rounded_rect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

return utils
