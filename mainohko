function main()
    --CreateThread("T_falldamage") - eh; maybe.
    CreateThread("T_damage")
    --CreateThread("T_terminate") - if i wish to eventually toggle on and off or give the runners the ability to should the mod break mid run.
    --CreateThread("T_grapples") - this is in regards to a bug relating to grapples. will be possibly utilised when i fix it.
end

prefectTable = {
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
}

function T_damage()
TextPrintString("Welcome to OneHitKO by amzy",2,1)
while true do
    Wait(0)
    if PedIsHit(gPlayer,1,500) then
        PedApplyDamage(gPlayer,PlayerGetHealth()+1)
        repeat
            Wait(0)
        until not PedIsHit(gPlayer,1,500)
    elseif PedGetWhoHitMeLast(prefectTable) then
        return
        end
    end
    Wait(0)
end
