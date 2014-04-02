

function createRunerLayer()
	local _runerLayer = CCLayer:create()
	cache = CCSpriteFrameCache:sharedSpriteFrameCache()
	local _runer = CCSprite:createWithSpriteFrame(cache:spriteFrameByName("loading_01.png"))
	local actionFrames = CCArray:create()

	for i=1,10 do
		actionFrames:addObject(cache:spriteFrameByName("loading_01.png"))
	end

	local animation = CCAnimation:createWithSpriteFrames(actionFrames,0.3)
	local  animate = CCAnimate:create(animation)
	_runerLayer:runAction(CCRepeatForever:create(animate))
	_runer:setPosition(ccp(200,200))
	_runerLayer:addChild(_runer)	
	return _runerLayer
end


