local Class = require("3rd-party.hump.class")

local System = Class{ }

function System:init( name, type )

	self.name       = name

	self.type       = type  -- whether this is a renderer or updater System

	self.entities   = {} --list of entities that this System handles

	self.handlesReq = {} -- list of required components this System handles

	self.handlesOne = {} -- list of at least one required components

end

function System:setHandles( Req, One ) --tables for required and atleast one component respectively

	self.handlesReq = Req

	self.handlesOne = One

end

function System:setName( name )

	self.name = name

end

function System:setType( type )

	self.type = type
end

function System:getHandles( )

end

function System:checkEntity( entity ) -- Checks entity and sees if this System handles that entity.

	local entComponets = entity:getAllComponents( )

	local numReq = 0 -- number of matched required components

	for i,entC in pairs( entComponets ) do

		print(entC.name.."d")

		for ii,reqC in pairs(self.handlesReq) do

			if entC.name == reqC then

				print("g")

				numReq = numReq + 1

				print(numReq)

			end

		end

	end

	if numReq == #self.handlesReq then

		if #self.handlesOne > 1 then

			for i,entC in pairs( entComponets ) do

				for ii,oneC in ipairs(self.handlesOne ) do
					print(oneC)
					if entC.name == oneC then
						print("ss")
						self.entities[entity:getID()] = entity

					end

				end

			end

		else 
			print("d")
			self.entities[entity:getID()] = entity

		end

	end

end

function System:checkEntities( entities )
print(#entities)
	for i,ent in ipairs( entities ) do
		print("")
		self:checkEntity( ent )

	end

end

function System:removeEntity( entity )

	self.entities[entity:getID()] = nil

end

function System:removeEntities( entities )

	for i,entity in ipairs( entities ) do

		self:removeEntity( entity )

	end

end

return System