
local function createRunerLayer()
	local _runerLayer = CCLayer:create()
	local _cache = CCSpriteFrameCache:sharedSpriteFrameCache()
	local _runer = CCSprite:spriteWithSpriteFrame(_cache:spriteFrameByName("loading_01.png"))
	_runer:setPosition(ccp(200,200))
	_runerLayer:addChild(_runer)	
	return _runerLayer
end
