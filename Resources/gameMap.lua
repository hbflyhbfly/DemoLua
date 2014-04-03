--module("GameMap", package.preload)
local gameMap = {}
function gameMap:newBaseMap(mapName,mapID)
	local  objMap = {
		_m_pMap = mapName,
		_m_ID = mapID
	}
	function objMap:deleteMap()
		self._m_pMap = nil
		self._m_ID = nil
		-- body
	end
	function objMap:showMap()
		if nil ~= self._m_pMap and nil ~= self._m_ID then
			print("map's name:"..objMap._m_pMap.."---".."map's id:"..objMap._m_ID)
		end
	end
	return objMap
end

function gameMap:newCollisionMap(mapName,mapID)
	-- body
	local objMap = self:newBaseMap(mapName,mapID)
	objMap._m_collisions = {}
	function objMap:buildCollision( collisionName,posX,posY )
		self._m_collisions[#self._m_collisions+1] = {_m_name = collisionName,_m_posX = posX,_m_posY = posY}
		--print(self._m_collisions[#self._m_collisions+1]._m_name)
	end
	function objMap:deleteCollisionMap()
		-- body
		self:deleteMap()
		objMap._m_collisions = nil
	end
	function objMap:showMap()
		-- body
		if nil ~= self._m_collisions then
			for i=1,#self._m_collisions do
				print("collisionname'sname:"..self._m_collisions[i]._m_name.."---".."collisionname'posX:"..self._m_collisions[i]._m_posX.."---".."collisionname'posX:"..self._m_collisions[i]._m_posY)
			end
		end
	end
	return objMap
end

return gameMap