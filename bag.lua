local Class = require "3rd-party.hump.class"

local Bag = Class{}

function Bag:init(  )
	self.entityCount = 0
end

function Bag:addEntity( entity )

end

function Bag:addSystem( name )

end

function Bag:registerComponent( component, system )
	self.components[ component.name ] = component
	self.systems
end

function Bag:update( dt )

end

function Bag:draw(  )

end	

function Bag:getEntityCount(  )
	return self.entityCount
end

function Bag:newID(  )
	return self.entityCount + 1
end

return Bag