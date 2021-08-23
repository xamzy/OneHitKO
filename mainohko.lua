function t_damage()
    while true do
        Wait(0)
		 
		--if the Player is hit by another Ped and it's not a Ped Type in the authority Table specified in "checkTable" function then...
		if PedIsHit(gPlayer,1,500) and not checkTable(PedGetFaction(PedGetWhoHitMeLast(gPlayer))) then
			
		--...Apply Damage Points to player of their current health +1
            PedApplyDamage(gPlayer,PlayerGetHealth()+1)
		
		--repeats a wait, so it doesn't keep trying to kill you until you're no longer being counted as "hit"
			repeat
				Wait(0)
			until not PedIsHit(gPlayer,1,500)
		end
    end
end


function checkTable(faction)
	
		--for the values in authTable function, check...
	for _, value in ipairs(authTable) do
		
		--if the value is equal to the factions listed in the authTable, and if yes - return true.
		if value == faction then
			return true
		end
		
		--otherwise return false.
	end
	return false
end 	

--[[DEBUG - If the player is alive and not being hit, pressed this button combo will kill you insantly]]
--[[function t_debug()
while true do
    Wait(0)
        if IsButtonPressed(10,0) and IsButtonPressed(14,0) and IsButtonPressed(8,0) then --lt leftstick b
             PedApplyDamage(gPlayer,PlayerGetHealth()+1)
        end
    end
end]]

    
--[[THREAD ACTIVITY]]
function main()
	--names thread
    local thread
	
	--while this function is true do...
    while true do
		
	--if "Gym Is Burning" is active, then terminate the thread handling OHKO, setting it to nil
        if MissionActiveSpecific("5_04") then
            if thread then
                TerminateThread(thread)
                thread = nil
            end
			
	--else, if the thread doesn't exist, and you're not in Gym Is Burning, then create the thread, relating it to OHKO's specific damage function.		
        elseif not thread then
            thread = CreateThread("t_damage")
            --CreateThread("t_debug")
        end
        --TextPrintString("thread: "..(thread and "active" or "disabled"),0,2)
        Wait(0)
    end
end
    
--[[TABLE]]
authTable = {
    0,--prefect
    7,--police
    8--teacher
}


--[[
amzy (myself) - Main Project Lead and Developer

LohaTronsRS - Co-Developer and Inspiration/Support
]]
