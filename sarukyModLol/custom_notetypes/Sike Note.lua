-- Script entirely made by Nex_isDumb
local angles = {90, 180, 0, -90}
local angAdder = {-90, 180, 0, 90}
local distance = 400
function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') and getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Sike Note' then
            if string.lower(difficultyName) == 'easiest' then
                setPropertyFromGroup('unspawnNotes', i, 'texture', 'ui/suca')
            end

            local id = math.random(0, 3)
            while true do
                if id == getPropertyFromGroup('unspawnNotes', i, 'noteData') then
                    id = math.random(0, 3)
                else break end
            end

            local daX = getPropertyFromGroup((getPropertyFromGroup('unspawnNotes', i, 'mustPress') and 'playerStrums' or 'opponentStrums'), id, 'x')
            setPropertyFromGroup('unspawnNotes', i, 'offsetX', getPropertyFromGroup('unspawnNotes', i, 'offsetX') + (daX - getPropertyFromGroup('unspawnNotes', i, 'x')))
            
            local angDir = angles[getPropertyFromGroup('unspawnNotes', i, 'noteData') + 1] + angAdder[id + 1]
            setPropertyFromGroup('unspawnNotes', i, 'offsetAngle', getPropertyFromGroup('unspawnNotes', i, 'offsetAngle') + angDir)
        end
    end

    if string.lower(difficultyName) == 'easiest' then
        distance = 500
    end
end

function onUpdate(elapsed)
    local lVal = math.max(0, math.min(1, elapsed * playbackRate * (string.lower(difficultyName) == 'easiest' and 14 or 27)))
    for i = 0, getProperty('notes.length') - 1 do
        if not getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'noteType') == 'Sike Note' and math.abs(getPropertyFromGroup('notes', i, 'distance')) < distance then
            setPropertyFromGroup('notes', i, 'offsetX', getPropertyFromGroup('notes', i, 'offsetX') + (0 - getPropertyFromGroup('notes', i, 'offsetX')) * lVal)
            setPropertyFromGroup('notes', i, 'offsetAngle', getPropertyFromGroup('notes', i, 'offsetAngle') + (0 - getPropertyFromGroup('notes', i, 'offsetAngle')) * lVal)
        end
    end
end

function onUpdatePost()
    for i = 0, getProperty('notes.length') - 1 do
        if getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'noteType') == 'Sike Note' then
            setPropertyFromGroup('notes', i, 'x', getPropertyFromGroup('notes', i, 'parent.x') + 35)
        end
    end
end
