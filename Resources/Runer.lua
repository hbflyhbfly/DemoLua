
--local RunerLayer = {}
local cache = CCSpriteFrameCache:sharedSpriteFrameCache()

function createRunerLayer()
	local _runerLayer = CCLayer:create()
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
	--_runerLayer:addChild(_runer)	
	CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("jujian_a0.png","jujian_a0.plist","jujian_a.ExportJson")
	CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("jujian_a1.png","jujian_a1.plist","jujian_a.ExportJson")
	armature = CCArmature:create("jujian_a")
	armature:setPosition(ccp(400,200))
	armature:getAnimation():play("dengdai")
	armature:setScale(0.5)
	_runerLayer:addChild(armature)
	return _runerLayer
end
function changeAnimate(animateName)
	-- body
	armature:getAnimation():play(animateName)
	print("action :"..animateName)

end
--return RunerLayer

