function t_damage()
    while true do
        Wait(0)
        if PedGetWhoHitMeLast(authTable) then
         return
        elseif not PedGetWhoHitMeLast(authTable) and PedIsHit(gPlayer,1,500) then
            PedApplyDamage(gPlayer,PlayerGetHealth()+1)
        repeat
            Wait(0)
        until not PedIsHit(gPlayer,1,500)
        end
    end
end

--[[DEBUG - If the player is alive and not being hit, pressed this button combo will kill you insantly]]
function t_debug()
while true do
    Wait(0)
        if IsButtonPressed(10,0) and IsButtonPressed(14,0) and IsButtonPressed(8,0) then --lt leftstick b
             PedApplyDamage(gPlayer,PlayerGetHealth()+1)
        end
    end
end
    
--[[THREAD CREATION]]
function main()
    CreateThread("t_damage")
    CreateThread("t_debug")
end
    
--[[TABLE]]
authTable = {
    "49",--prefect
    "50",--prefect
    "51",--prefect
    "52",--prefect
    "53",--teacher
    "54",--teacher
    "55",--teacher
    "56",--teacher
    "57",--teacher
    "58",--teacher
    "59",--teacher
    "60",--teacher
    "61",--teacher
    "62",--teacher
    "63",--teacher
    "64",--teacher
    "65",--teacher
    "106",--teacher
    "126",--teacher
    "129",--teacher
    "151",--teacher
    "221",--teacher
    "229",--teacher
    "248",--teacher
    "249",--teacher
    "83",--cop
    "97",--cop
    "234",--cop
    "238",--cop
    "46", --gurney
}

--[[files used:
linuxohko.lua
STimeCycle.lua
(named 1hp.lur in files)]]
