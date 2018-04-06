local ball = {}

ball.position_x = 300
ball.position_y = 300
ball.speed_x = 300
ball.speed_y = 300
ball.radius = 10

function ball.rebound(shift_ball_x, shift_ball_y)
    local min_shift = math.min(math.abs(shift_ball_x), math.abs(shift_ball_y))
    if min_shift == math.abs(shift_ball_x) then shift_ball_y = 0 else shift_ball_x = 0 end
    
    ball.position_x = ball.position_x + shift_ball_x
    ball.position_y = ball.position_y + shift_ball_y
    
    if shift_ball_x ~= 0 then
        ball.speed_x = -ball.speed_x
    end
    if shift_ball_y ~= 0 then
        ball.speed_y = -ball.speed_y
    end
end

function ball.reposition()
    ball.position_x = 300
    ball.position_y = 300
end

function ball.update(dt)
    ball.position_x = ball.position_x + ball.speed_x * dt
    ball.position_y = ball.position_y + ball.speed_y * dt
end

function ball.draw()
    local segments_in_circle = 16
    love.graphics.circle("line", ball.position_x, ball.position_y, ball.radius, segments_in_circle)
end

return ball