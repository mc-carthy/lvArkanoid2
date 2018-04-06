local walls = {}

walls.wall_thickness = 20
walls.current_level_walls = {}

function walls.new_wall(position_x, position_y, width, height)
    return {
        position_x = position_x,
        position_y = position_y,
        width = width,
        height = height
    }
end

function walls.construct_walls()
    local left_wall = walls.new_wall(
        0,
        0,
        walls.wall_thickness,
        love.graphics.getHeight()
    )
    local right_wall = walls.new_wall(
        love.graphics.getWidth() - walls.wall_thickness,
        0,
        walls.wall_thickness,
        love.graphics.getHeight()
    )
    local top_wall = walls.new_wall(
        0,
        0,
        love.graphics.getWidth(),
        walls.wall_thickness
    )
    local bottom_wall = walls.new_wall(
        0,
        love.graphics.getHeight() - walls.wall_thickness,
        love.graphics.getWidth(),
        walls.wall_thickness
    )
    walls.current_level_walls['left'] = left_wall
    walls.current_level_walls['right'] = right_wall
    walls.current_level_walls['top'] = top_wall
    walls.current_level_walls['bottom'] = bottom_wall
end

function walls.update_wall(dt, single_wall)

end

function walls.update(dt)
    for _, w in pairs(walls.current_level_walls) do
        walls.update_wall(dt, w)
    end
end

function walls.draw_wall(single_wall)
    love.graphics.rectangle("line", single_wall.position_x, single_wall.position_y, single_wall.width, single_wall.height)
end

function walls.draw()
    for _, w in pairs(walls.current_level_walls) do
        walls.draw_wall(w)
    end
end

return walls