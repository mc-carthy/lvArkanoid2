local bricks = {}

bricks.rows = 8
bricks.columns = 11
bricks.top_left_position_x = 70
bricks.top_left_position_y = 50
bricks.brick_width = 50
bricks.brick_height= 30
bricks.horizontal_distance = 10
bricks.vertical_distance = 15
bricks.current_level_bricks = {}

function bricks.construct_level(level_bricks_arrangement)
    bricks.no_more_bricks = false
    for rowIndex, row in ipairs(level_bricks_arrangement) do
        for colIndex, bricktype in ipairs(row) do
            if bricktype == 1 then
                local new_brick_position_x = bricks.top_left_position_x + (colIndex - 1) * (bricks.brick_width + bricks.horizontal_distance)
                local new_brick_position_y = bricks.top_left_position_y + (rowIndex - 1) * (bricks.brick_height + bricks.vertical_distance)
                local new_brick = bricks.new_brick(new_brick_position_x, new_brick_position_y)
                bricks.add_to_current_level_bricks(new_brick)
            end
        end
    end
end

function bricks.construct_level_from_string(level_bricks_arrangement)
    bricks.no_more_bricks = false
    local rowIndex = 0
    for row in level_bricks_arrangement:gmatch('(.-)\n') do
        rowIndex = rowIndex + 1
        local colIndex = 0
        for bricktype in row:gmatch('.') do
            colIndex = colIndex + 1
            if bricktype == '#' then
                local new_brick_position_x = bricks.top_left_position_x + (colIndex - 1) * (bricks.brick_width + bricks.horizontal_distance)
                local new_brick_position_y = bricks.top_left_position_y + (rowIndex - 1) * (bricks.brick_height + bricks.vertical_distance)
                local new_brick = bricks.new_brick(new_brick_position_x, new_brick_position_y)
                bricks.add_to_current_level_bricks(new_brick)
            end
        end
    end
end

function bricks.new_brick(position_x, position_y, width, height)
    return {
        position_x = position_x,
        position_y = position_y,
        width = width or bricks.brick_width,
        height = height or bricks.brick_height,
    }
end

function bricks.add_to_current_level_bricks(brick)
    table.insert(bricks.current_level_bricks, brick)
end

function bricks.brick_hit_by_ball(i, brick, shift_ball_x, shift_ball_y)
    table.remove(bricks.current_level_bricks, i)
end

function bricks.update_brick(single_brick)

end

function bricks.draw_brick(single_brick)
    love.graphics.rectangle("line", single_brick.position_x, single_brick.position_y, single_brick.width, single_brick.height)
end

function bricks.update()
    if #bricks.current_level_bricks <= 0 then
        bricks.no_more_bricks = true
    else
        for _, brick in pairs(bricks.current_level_bricks) do
            bricks.update_brick(brick)
        end
    end
end

function bricks.draw()
    for _, brick in pairs(bricks.current_level_bricks) do
        bricks.draw_brick(brick)
    end
end

return bricks