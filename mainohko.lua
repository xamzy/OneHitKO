function t_damage()

    --while this function is active, do the following
    while true do 
        Wait(0)
        
    --if the player is hit, but the faction is not in the authority table (to allow busts) then apply the player's health as damage + 1
    if PedIsHit(gPlayer,1,500) and not checkTable(PedGetFaction(PedGetWhoHitMeLast(gPlayer))) then 
        PedApplyDamage(gPlayer,PlayerGetHealth()+1)

    --repeat wait until the player is not being registered as hit, to avoid multi-deaths
    repeat
        Wait(0)
    until not PedIsHit(gPlayer,1,500)

    --else, if player has been set the "falling" animation and also taken damage, then apply the players' health as damage + 1
    elseif node and PlayerGetHealth() < healthvalue then 
        PedApplyDamage(gPlayer,PlayerGetHealth()+1)

    --repeat wait until the player's health is more than the health value set at Load, to avoid multi deaths.
    repeat
        Wait(0)
    until PlayerGetHealth() >= healthvalue
    end
 end
end


function checkTable(faction)

    --for the useless indexable value in the authority table..
	for _, value in ipairs(authTable) do

    --check if the value of the faction is equal to the faction value in the auth table; if yes, return true and allow busting
		if value == faction then
			return true
		end
	end

    --otherwise return false and allow damage
	return false
end 	
    

function main()

    --validates thread of t_damage() 
    local thread

    --stores the current health value in a variable upon Load
    healthvalue = PlayerGetHealth()

    --sets a name for this action node anim of falling.
    node = PedSetActionNode(gPlayer,"/Global/Player/JumpActions/Jump/Falling/Fall/Falling","Act/Player.act") --PedSetActionNode(gPlayer,"/Global/Player/JumpActions/Jump/Falling","Act/Player.act") -- both of these work, if the one i'm using starts bugging out, i'll swap it. just let me know.
    while true do

    --if Gym Is Burning is the currently active mission, and the thread of t_damage() is active...
        if MissionActiveSpecific("5_04") then
            if thread then

    --terminate the thread and set its value to nil [due to a bug with the mission.]
                TerminateThread(thread)
                thread = nil
            end

    --else, if the thread is not running and the player is NOT in Gym Is Burning, then name the thread and recreate it.
        elseif not thread then
            thread = CreateThread("t_damage")
        end
    --TextPrintString("thread: "..(thread and "active" or "disabled"),0,2)
        Wait(0)
    end
end
    

authTable = {
    0,--prefect
    7,--police
    8--teacher
}


--[[
amzy (myself) - Main Project Lead and Developer

LohaTronsRS - Co-Developer and Inspiration/Support
]]
