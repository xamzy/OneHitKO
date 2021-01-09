function t_damage()
    while true do
        Wait(0)
		if PedIsHit(gPlayer,1,500) and not checkTable(PedGetFaction(PedGetWhoHitMeLast(gPlayer))) then
            PedApplyDamage(gPlayer,PlayerGetHealth()+1)
			repeat
				Wait(0)
			until not PedIsHit(gPlayer,1,500)
		end
    end
end

function checkTable(faction)
	for _, value in ipairs(authTable) do
		if value == faction then
			return true
		end
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
    local thread
    while true do
        if MissionActiveSpecific("5_04") then
            if thread then
                TerminateThread(thread)
                thread = nil
            end
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

Derpy54320 - Code Suggestion
]]
