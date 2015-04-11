local Class = require "3rd-party.hump.class"

local Bag = Class{}


function Bag:init(  )

	self.entityCount = 0

	self.IDCounter = 0

	self.entities = {}

	self.systems = {}

	self.systems['draw'] = {}

	self.systems['update'] = {}

end

function Bag:addEntity( entity )

	self.entityCount = self.entityCount + 1

	self.entities[self.entityCount] = entity

	self.IDCounter = self.IDCounter + 1

	entity:setID( self.IDCounter )

	print(#self.systems)

	for i, system in ipairs(self.systems) do

		print("dhd")

		system:checkEntity( entity )

	end

end

function Bag:registerSystem( system )

	system:checkEntities( self.entities )

	self.systems[system.type][system.name] = system

	self.systems[#self.systems + 1] = system

end

function Bag:update( dt )

	for i, system in pairs( self.systems['update'] ) do

		system:update( dt )

	end

end

function Bag:draw(  )

	for i,system in pairs( self.systems['draw'] ) do

		system:draw(  )

	end

end	

function Bag:getEntityCount(  )

	return self.entityCount

end

function Bag:newID(  )

	return self.entityCount + 1

end

return Bag