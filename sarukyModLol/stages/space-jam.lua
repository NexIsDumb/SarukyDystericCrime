-- Script entirely made by Nex_isDumb
local X = -500
local Y = -750
local scale = 1  -- Bruh after testings 1 was the best one

local defZoom
function onCreatePost()
	defZoom = getProperty('defaultCamZoom')

	makeLuaSprite('lsd', 'spaceJam#3/SPACE1', X - 100, Y + 400)
	setScrollFactor('lsd', 0.3, 0.3)
	scaleObject('lsd', scale + 0.5, scale + 0.5)
	addLuaSprite('lsd')

	if not lowQuality then
		makeLuaSprite('planet', 'spaceJam#3/PLAN2', X + 1000, Y + 600)
		setScrollFactor('planet', 0.4, 0.4)
		scaleObject('planet', scale - 0.1, scale - 0.1)
		addLuaSprite('planet')

		makeLuaSprite('earth', 'spaceJam#3/EARTH3', X, Y + 500)
		setScrollFactor('earth', 0.5, 0.5)
		scaleObject('earth', scale, scale)
		addLuaSprite('earth')

		makeLuaSprite('fog', 'spaceJam#3/ORANG4', X, Y + 50)
		setScrollFactor('fog', 0.6, 0.6)
		scaleObject('fog', scale + 0.5, scale + 0.5)
		addLuaSprite('fog')
	end

	makeLuaSprite('lebron', 'spaceJam#3/GROUND5', X, Y - 100)
	setScrollFactor('lebron', 1, 1)
	scaleObject('lebron', scale + 0.7, scale + 0.7)
	addLuaSprite('lebron')

	makeLuaSprite('wall', 'spaceJam#3/BLUR7', X, Y)
	setScrollFactor('wall', 0.9, 0.8)
	scaleObject('wall', scale + 0.8, scale + 0.8)
	addLuaSprite('wall', true)

	setProperty('camFollowPos.x', 800)
end

function onUpdatePost()
	local zoomshit = getProperty('camGame.zoom') / 0.75
	setProperty('wall.x', (X - 400) + (200 * zoomshit))
	setProperty('wall.y', (Y - 200) + (200 * zoomshit))
	setProperty('wall.scale.x', zoomshit + scale)
	setProperty('wall.scale.y', zoomshit + scale - 0.3)
end

function onEvent(name, value1)  -- Shut up I did this here
	if name == "Jam Zoom" then
		if value1 == "0" then setProperty('defaultCamZoom', defZoom)
		else setProperty('defaultCamZoom', 0.9) end
	end
end