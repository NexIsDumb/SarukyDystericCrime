-- Script entirely made by Nex_isDumb
function onCreatePost()
    if not lowQuality then
        loadGraphic('healthBarBG', 'ui/healthBarPla')
        addHaxeLibrary('FlxBar', 'flixel.ui')
        addHaxeLibrary('Std')
        runHaxeCode([[
            game.remove(game.healthBarBG);
            game.healthBar.createImageEmptyBar(Paths.image('ui/healthBarOpp'), 0xFFFFFFFF);
            game.healthBar.createImageFilledBar(Paths.image('ui/healthBarPla'), 0xFFFFFFFF);
            game.healthBar.barWidth = Std.int(game.healthBarBG.width);
            game.healthBar.barHeight = Std.int(game.healthBarBG.height);
        ]])
        setProperty('healthBar.antialiasing', getProperty('healthBarBG.antialiasing'))
        screenCenter('healthBar')  -- I'll do it on both axes
        setProperty('healthBar.y', getProperty('healthBar.y') + (downscroll and - 280 or 280))
        setProperty('iconP2.y', getProperty('iconP2.y') - 5)
    end
    setProperty('dad.danceEveryNumBeats', 2)

    if isStoryMode and not seenCutscene then  -- Cutscene
        addHaxeLibrary('CutsceneHandler')
        addHaxeLibrary('PauseSubState')
        runHaxeCode([[
            // Imma do now the cutscene lol
            var cutsceneHandler:CutsceneHandler = new CutsceneHandler();
            cutsceneHandler.endTime = 17;
            cutsceneHandler.music = 'monke';
            game.camHUD.visible = false;
            FlxG.camera.zoom *= 1.5;

            var tv:FlxSprite = new FlxSprite().loadGraphic(Paths.image('ui/beep'));
            tv.scrollFactor.set(0.01, 0.01);
            tv.scale.set(4.5, 4.5);
            tv.screenCenter();
            tv.visible = false;
            cutsceneHandler.push(tv);
            game.add(tv);

            game.triggerEventNote('Change Character', 'dad', 'saruwave-cutscene');
            game.triggerEventNote('Change Character', 'gf', 'clusterfucks-cutscene');

            cutsceneHandler.timer(0.1, function()
			{
                game.dad.playAnim('drink', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(3.9, function()
			{
                game.dad.playAnim('explosion 1', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(5.9, function()
			{
                game.dad.playAnim('throw', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(6.5, function()
			{
                game.dad.playAnim('explosion 2', true);
                game.dad.specialAnim = true;

                game.gf.playAnim('explosion', true);
                game.gf.specialAnim = true;
            });

            cutsceneHandler.timer(7, function() tv.visible = true);

            cutsceneHandler.timer(7.4, function()
			{
                tv.visible = false;

                game.dad.playAnim('giggle', true);
                game.dad.specialAnim = true;

                game.gf.playAnim('giggle', true);
                game.gf.specialAnim = true;
            });

            cutsceneHandler.timer(8, function()
			{
                game.moveCamera(false);
            });

            cutsceneHandler.timer(9.2, function()
            {
                game.boyfriend.playAnim('singUP', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(9.4, function()
            {
                game.moveCamera(true);
            });

            cutsceneHandler.timer(9.8, function()
            {
                game.dad.playAnim('look', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(10.8, function()
            {
                game.dad.playAnim('mic', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(11.3, function()
            {
                game.moveCamera(false);
            });

            cutsceneHandler.timer(11.95, function()
            {
                game.boyfriend.playAnim('singUP', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(12.35, function()
            {
                game.boyfriend.playAnim('singRIGHT', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(12.55, function()
            {
                game.boyfriend.playAnim('singDOWN', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(13, function()
            {
                game.moveCamera(true);
            });

            cutsceneHandler.timer(13.5, function()
            {
                game.dad.playAnim('blink', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.finishCallback = function()
            {
                PauseSubState.restartSong();  // SHUT UP ILL USE THIS FIX OTHERWHISE THERES A BUG THAT IF I DELAY THE COUNTDOWN THE SPECIAL NOTES WONT WORK AAAAAA
            }
        ]])
    end
end

local xx = 689.5
local yy = 449.07
local xx2 = 1684.5
local yy2 = 467.5
local ofs = 35
function onUpdate()  -- Kinda copied from hotline cause I wanted to be fast LOL
    if not mustHitSection then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos', xx - ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos', xx + ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos', xx, yy - ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos', xx, yy + ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos', xx - ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos', xx + ofs, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos', xx, yy - ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos', xx, yy + ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos', xx, yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos', xx, yy)
        end
    else
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos', xx2 - ofs, yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
        end
    end
end

function onUpdatePost()
    if not lowQuality then
        setProperty('iconP1.x', getProperty('healthBar.width') * 1.37)
        setProperty('iconP2.x', getProperty('healthBar.width') * 0.4)

        if getProperty('healthBar.percent') < 15 then
            setProperty('iconP1.animation.curAnim.curFrame', 1)
        else
            setProperty('iconP1.animation.curAnim.curFrame', 0)
        end
        
        if getProperty('healthBar.percent') > 85 then
            setProperty('iconP2.animation.curAnim.curFrame', 1)
        else
            setProperty('iconP2.animation.curAnim.curFrame', 0)
        end
    end
end

function onStartCountdown()
    if isStoryMode and not seenCutscene then
        return Function_Stop
    end
end