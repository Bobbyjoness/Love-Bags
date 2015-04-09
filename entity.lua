local Class = require "3rd-party.hump.class"

local Entity = Class{}

function Entity:init( name )

	self.name       = name

	self.components = { }

end

function Entity:addComponent( component ) 

	self.components[ component.name ] = component

end

function Entity:serialize( )	

end

function Entity:setID( id )

	if id then

		self.id = id

	end

end

function Entity:getID( )

	if self.id then

		return self.id

	end

end

function Entity:destroy()

end

function Entity:getComponent( name )

	return self.components[name] 

end

function Entity:removeComponent( )

	self.components[name] = nil

end

function Entity:getAllComponents( )

	return self.components

end

return Entity 