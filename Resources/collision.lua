require "header"
local _visibleSize = CCDirector:sharedDirector():getWinSize()

local PAR_TABLE = 
    {  
        INTERVAL_COLLISION = 150,  
        WIDTH_COLLISION = 50,  
    }  
    local t = newConst(PAR_TABLE) 
CollisionLayer = {}
CollisionLayer._m_barPies = {}
function CollisionLayer:createCollisionLayer()

    local layer = CCLayer:create()
    local count = 1
    --local _runer = CCSprite:createWithSpriteFrame(cache:spriteFrameByName("down_bar.png"))
    return layer
end
return CollisionLayer