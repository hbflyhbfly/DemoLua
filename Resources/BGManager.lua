local backGrounds = {
	xuedi = 1,
	shamo = 2
}
local backGroundObjects = {
	yuncai = {ID = 1,ratioX = 0,ratioY = 0,offsetX = 0,offsetY = 0},
	haimian = {ID = 2,ratioX = 0,ratioY = 0,offsetX = 0,offsetY = 0}
}
local BackGround = {}
function BackGround:createBackGround(bgName)
	-- body
		local objBG = {
		_m_BG_name = bgName,
		_m_ID = backGrounds[bgName],
		_m_BG_objects = {}
	}
	print(bgName..objBG._m_ID)
	function objBG:buildBG(bgObjectName)
		-- body
		
		self._m_BG_objects[#self._m_BG_objects+1] = backGroundObjects[bgObjectName]
		print(backGroundObjects[bgObjectName].ratioX)
	end
	function objBG:deleteMap()
		self._m_BGName = nil
		self._m_ID = nil
		_m_BG_objects = nil
		-- body
	end
	function objBG:showMap()
		if nil ~= self._m_BG_name and nil ~= self._m_ID then
			print("sdsddsd")
			print("map's name:"..self._m_BG_name.."---".."map's id:"..self._m_ID)
		end
		if nil ~= self._m_BG_objects then
			print("?")
			for i=1,#self._m_BG_objects do
				print(">")
				for j=1,#(self._m_BG_objects[i]) do
					print("<")
				print("collisionname'sname:"..self._m_BG_objects[i][j].ID)
				end
			end
		end
	end
	return objBG
end
local b = BackGround:createBackGround("xuedi")
b:buildBG("yuncai")
b:showMap()

