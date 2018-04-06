local ball = require('src.ball')
local bricks = require('src.bricks')

local levels = {}

levels.sequence = {}
levels.current_level = 1
levels.sequence[1] = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1 },
    { 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1 },
    { 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0 },
    { 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0 },
    { 1, 0, 1, 0, 1, 1, 1, 0, 0, 1, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}

levels.sequence[2] = {
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
    { 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1 },
    { 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0 },
    { 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0 },
    { 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 },
    { 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 1 },
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}
levels.stringSequence = {}
levels.stringSequence[1] = [[
___________

# # ### # #
# # #   # #
### ##   # 
# # #    # 
# # ###  # 
___________
]]

levels.stringSequence[2] = [[
___________

##  # # ###
# # # # #  
###  #  ## 
# #  #  #  
###  #  ###
___________
]]

function levels.switch_to_next_level(bricks)
    if bricks.no_more_bricks then
        if levels.current_level < #levels.sequence then
            levels.current_level = levels.current_level + 1
            bricks.construct_level_from_string(levels.stringSequence[levels.current_level])
            ball.reposition()
        else
            levels.gamefinished = true
        end
    end
end

return levels