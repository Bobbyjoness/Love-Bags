local Class = require "3rd-party.hump.class"

local Entity = Class{}

function Entity:init( Bag, name )

	self.id         = Bag:newID( )

	self.name       = name

	self.components = { }

end

function Entity:addComponent( component ) 

	self.components[ component.name ] = component

end

function Entity:serialize( )	

end

function Entity:getID( )

	return self.id

end

function Entity:destroy()

end

function Entity:getComponents(  )

end

function Entity:removeComponents( )

end

return Entity 