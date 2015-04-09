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

end

function Bag:registerSystem( name )

end

function Bag:update( dt )

end

function Bag:draw(  )

	for i,system in ipairs( self.systems['draw'] ) do

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