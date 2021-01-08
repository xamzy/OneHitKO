--[[DAMAGE FUNCTION - Checks if Player is hit, and gives damage if returns true, else if you're hit by authority it bails out]]
function t_damage()
while true do
    Wait(0)
    if PedIsHit(gPlayer,1,500) then
        PedApplyDamage(gPlayer,PlayerGetHealth()+1)
    repeat
        Wait(0)
    until not PedIsHit(gPlayer,1,500)
    elseif t_auth() then
        break
    end
 end
end

--[[DEBUG - If the player is alive and not being hit, pressed this button combo will kill you insantly / terminate script when added]]
function t_debug()
while true do
    Wait(0)
        if IsButtonPressed(10,0) and IsButtonPressed(14,0) and IsButtonPressed(8,0) then --lt leftstick b
            PedApplyDamage(gPlayer,PlayerGetHealth()+1)
        end
    end
end

--[[AUTHORITY CHECK - If the player is hit and it's an authority figure, return small damage]]
function t_auth()
    if PedGetWhoHitMeLast(authTable) then
        PedApplyDamage(gPlayer,1)
    end
end

--[[THREAD CREATION]]
function main()
    CreateThread("t_auth")
    CreateThread("t_damage")
    CreateThread("t_debug")
end

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
