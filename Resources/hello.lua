require "AudioEngine"
require "Runer"
require "weatherLayer"
BackGroundLayer = require "backGround"
CollisionLayer = require "collision"
-- for CCLuaEngine traceback

local _action = {
    "dengdai",
    "beizhan",
    "quabhub",
    "houtui",
    "ggg",
    "shoushang",
    "fukong",
    "bajian",
    "si",
    "gongji_c",
    "gongji_b",
    "gongji_a"
}

function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    local cclog = function(...)
        print(string.format(...))
    end

    local cache = CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile("Res.plist")
    
    CCTextureCache:sharedTextureCache():addImage("move_mg_1.png")
    CCTextureCache:sharedTextureCache():addImage("move_mg_2.png")
    CCTextureCache:sharedTextureCache():addImage("move_mg_3.png")
    CCTextureCache:sharedTextureCache():addImage("move_mg_4.png")
    CCTextureCache:sharedTextureCache():addImage("worldmap_body_0.png")
    CCTextureCache:sharedTextureCache():addImage("worldmap_body_1.png")
    CCTextureCache:sharedTextureCache():addImage("worldmap_body_2.png")
    local visibleSize = CCDirector:sharedDirector():getWinSize()
    --print(visibleSize)
    local origin = CCDirector:sharedDirector():getVisibleOrigin()

    -- create farm
    local function createHelloLayer()
        local layerHello = CCLayer:create()

        -- handing touch events
        local touchBeginPoint = nil

        local function onTouchBegan(x, y)
            cclog("onTouchBegan: %0.2f, %0.2f", x, y)
            touchBeginPoint = {x = x, y = y}
            local ranID= math.random(#_action)
            changeAnimate(_action[ranID])
            --local a = CCBProxy:create()

            -- CCTOUCHBEGAN event must return true
            return true
        end

        local function onTouchMoved(x, y)
            cclog("onTouchMoved: %0.2f, %0.2f", x, y)
            if touchBeginPoint then
                local cx, cy = createHelloLayer:getPosition()
                createHelloLayer:setPosition(cx + x - touchBeginPoint.x,
                                      cy + y - touchBeginPoint.y)
                touchBeginPoint = {x = x, y = y}
            end
        end

        local function onTouchEnded(x, y)
            cclog("onTouchEnded: %0.2f, %0.2f", x, y)
            touchBeginPoint = nil
        end

        local function onTouch(eventType, x, y)
            if eventType == "began" then   
                return onTouchBegan(x, y)
            elseif eventType == "moved" then
                return onTouchMoved(x, y)
            else
                return onTouchEnded(x, y)
            end
        end

        layerHello:registerScriptTouchHandler(onTouch)
        layerHello:setTouchEnabled(true)

        return layerHello
    end

    -- play background music, preload effect

    -- uncomment below for the BlackBerry version
    -- local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.ogg")
    local bgMusicPath = CCFileUtils:sharedFileUtils():fullPathForFilename("background.mp3")
    AudioEngine.playMusic(bgMusicPath, true)
    local effectPath = CCFileUtils:sharedFileUtils():fullPathForFilename("effect1.wav")
    AudioEngine.preloadEffect(effectPath)

    -- run
    local helloLayer = createHelloLayer()
    local sceneGame = CCScene:create()
    sceneGame:addChild(helloLayer)
    helloLayer:addChild(BackGroundLayer:createBackgroundLayer())
    helloLayer:addChild(createRunerLayer())
    helloLayer:addChild(CollisionLayer:createCollisionLayer())
    helloLayer:addChild(setSnow())
    CCDirector:sharedDirector():runWithScene(sceneGame)
end


xpcall(main, __G__TRACKBACK__)
