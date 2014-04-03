
local RunerLayer = {}
function RunerLayer:createRunerLayer()
	local _runerLayer = CCLayer:create()
	cache = CCSpriteFrameCache:sharedSpriteFrameCache()
	local _runer = CCSprite:createWithSpriteFrame(cache:spriteFrameByName("loading_01.png"))
	local actionFrames = CCArray:create()

	for i=1,12 do
		actionFrames:addObject(cache:spriteFrameByName(string.format("loading_%02d.png",i)))
		--print(string.format("loading_%02d.png",i))
	end

	local _animation = CCAnimation:createWithSpriteFrames(actionFrames,0.05)
	local  _animate = CCAnimate:create(_animation)
	_runer:runAction(CCRepeatForever:create(_animate))
	_runer:setScale(0.5)
	_runer:setPosition(ccp(200,200))
	_runerLayer:addChild(_runer)	
	return _runerLayer
end
return RunerLayer

