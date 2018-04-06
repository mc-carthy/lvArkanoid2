local ball = require('src.ball')
local bricks = require('src.bricks')
local collisions = require('src.collisions')
local levels = require('src.levels')
local platform = require('src.platform')
local walls = require('src.walls')

function love.load()
    bricks.construct_level_from_string(levels.stringSequence[levels.current_level])
    walls.construct_walls()
end

function love.update(dt)
    ball.update(dt)
    platform.update(dt)
    bricks.update(dt)
    walls.update(dt)
    collisions.resolve_collisions(dt)
    levels.switch_to_next_level(bricks)
end

function love.draw()
    ball.draw()
    platform.draw()
    bricks.draw()
    walls.draw()
    if levels.gamefinished then
        love.graphics.printf("Congratulations!\n" .. "You have finished the game!", 300, 250, 200, "center")
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end