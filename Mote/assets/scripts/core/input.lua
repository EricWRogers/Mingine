function GetInputX(playerId)
	--check keyboard input first
	if IsKeyDown(SDL_SCANCODE_LEFT) then return -1.0
	elseif IsKeyDown(SDL_SCANCODE_RIGHT) then return 1.0 end
	
	if IsControllerAttached(playerId) == false then 
		return 0
    end

	local hat = ReadControllerHat(playerId)
	local axis_0 = ReadControllerAxis(playerId, 0)
		
    if hat == 8 then return -1.0
    elseif hat == 2 then return 1.0
    elseif math.abs(axis_0) > 0 then return axis_0 end
    
    return 0.0
end

function GetInputY(playerId)
	--check keyboard input first
	if IsKeyDown(SDL_SCANCODE_UP) then return -1.0
	elseif IsKeyDown(SDL_SCANCODE_DOWN) then return 1.0 end
	
	if IsControllerAttached(playerId) == false then 
		return 0
    end

	local hat = ReadControllerHat(playerId)
	local axis_1 = ReadControllerAxis(playerId, 1)
	
    if hat == 1 then return -1.0
    elseif hat == 4 then return 1.0
    elseif math.abs(axis_1) > 0 then return axis_1 end
    
    return 0.0
end

function GetMoveInput(playerId)
    local x = GetInputX(playerId)
    local y = GetInputY(playerId)
    
    if x == 0 and y == 0 then
        return 0, 0
    end
    
    return Normalize(x, y)
end

function GetLookInput(playerId)
    local x = ReadControllerAxis(playerId, 3)
    local y = ReadControllerAxis(playerId, 4)
    
    if x == 0 and y == 0 then
        return 0, 0
    end
    
    return Normalize(x, y)
end

