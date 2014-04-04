BackGroundLayer = {}

function BackGroundLayer:createBackgroundLayer()
	-- body
    local speed = 1
    local _visibleSize = CCDirector:sharedDirector():getWinSize()
    --print(_visibleSize)
	local _backGroundLayer = CCLayer:create()
	local _parallaxNode = CCParallaxNode:create() 
	--local _parallaxNode = CCNode:create() 
	local textureCache = CCTextureCache:sharedTextureCache()
	local spriteCache = CCSpriteFrameCache:sharedSpriteFrameCache();
	local bgLayer1 = CCSprite:createWithTexture(textureCache:textureForKey("move_mg_2.png"))
	local bgLayer1_1 = CCSprite:createWithTexture(textureCache:textureForKey("move_mg_1.png"))
	local bgLayer3 = CCSprite:createWithTexture(textureCache:textureForKey("move_mg_3.png"))
	local bgLayer4 = CCSprite:createWithTexture(textureCache:textureForKey("move_mg_4.png"))
	local bg_objects = require ("BGManager")
	--print(#bg_objects)
	local bgLayer1Size = bgLayer1:boundingBox().size;
	bgLayer1:setScaleX(_visibleSize.width/bgLayer1Size.width)
	bgLayer1:setAnchorPoint(ccp(0,1))
	bgLayer1:setPosition(ccp(_visibleSize.width,_visibleSize.height))
	_parallaxNode:addChild(bgLayer1, 0, ccp(0.2,0.2), ccp(0,_visibleSize.height));
	--_parallaxNode:addChild(bgLayer1)

	local bgLayer1_1Size = bgLayer1_1:boundingBox().size;
	bgLayer1_1:setScaleX(_visibleSize.width/bgLayer1_1Size.width)
	bgLayer1_1:setAnchorPoint(ccp(0,1))
	bgLayer1_1:setPosition(ccp(_visibleSize.width,_visibleSize.height-bgLayer1_1Size.height-30))
	--_parallaxNode:addChild(bgLayer1_1)
	_parallaxNode:addChild(bgLayer1_1, 0, ccp(0.2,0.2), ccp(0,_visibleSize.height-bgLayer1_1Size.height-30));

    local bgLayer3Size = bgLayer3:boundingBox().size;
	bgLayer3:setScaleX(_visibleSize.width/bgLayer3Size.width)
	bgLayer3:setAnchorPoint(ccp(0,1))
	bgLayer3:setPosition(ccp(_visibleSize.width,_visibleSize.height-bgLayer3Size.height))
	--_parallaxNode:addChild(bgLayer3)
	_parallaxNode:addChild(bgLayer3, 0, ccp(1,1), ccp(0,_visibleSize.height-bgLayer3Size.height));

    local bgLayer4Size = bgLayer4:boundingBox().size;
	local scaleX = _visibleSize.width/bgLayer4Size.width
	bgLayer4:setScaleX(scaleX)
 	bgLayer4:setPosition(ccp(bgLayer3Size.width*scaleX+bgLayer3Size.width*scaleX,_visibleSize.height-bgLayer3Size.height))
	--_parallaxNode:addChild(bgLayer4)
	_parallaxNode:addChild(bgLayer4, 0, ccp(1,1), ccp(bgLayer3Size.width*scaleX,_visibleSize.height-bgLayer4Size.height));
	local bgObjects = CCArray:create()
	bgObjects:addObject(bgLayer1)
	local move1 = CCMoveBy:create(0.16,ccp(-3, 0));
    _parallaxNode:runAction(CCRepeatForever:create(move1));

    local _ground = CCSprite:createWithSpriteFrame(spriteCache:spriteFrameByName("ground.png"))
    local groundSize = _ground:boundingBox().size
    _ground:setAnchorPoint(ccp(0,0))
    _ground:setScale(_visibleSize.width/groundSize.width)
    _ground:setPosition(ccp(0,200-groundSize.height))
    _backGroundLayer:addChild(_parallaxNode)
    _backGroundLayer:addChild(_ground)
	return _backGroundLayer
end

return BackGroundLayer