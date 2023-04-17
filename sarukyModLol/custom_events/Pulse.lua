-- Script entirely made by Nex_isDumb
function onCreate()
    makeLuaSprite('daPulse', 'ui/pulse', 0, 0)  -- VM Reference lol
	setObjectCamera('daPulse', 'hud')
	setGraphicSize('daPulse', screenWidth + 100, screenHeight + 100)
	setScrollFactor('daPulse', 0, 0)
	addLuaSprite('daPulse', false)
	setProperty('daPulse.alpha', 0)
    screenCenter('daPulse')
end

function onEvent(name, value1, value2)
	if name == 'Pulse' then
        local duration = tonumber(value1)
        local finalAlpha = tonumber(value2)
        if duration <= 0 then duration = 0.1 end
        if finalAlpha < 0 then finalAlpha = 0 end
        
        doTweenAlpha('pussy', 'daPulse', finalAlpha, duration, 'linear')
    end
end