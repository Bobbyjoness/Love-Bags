--[[
The MIT License (MIT)

Copyright (c) 2015 Bobbyjoness

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
--]]

local System = { }

System.__index = System

local function new()
	return setmetatable( {}, System )
end

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

		for ii,reqC in pairs(self.handlesReq) do

			if entC.name == reqC then

				numReq = numReq + 1

			end

		end

	end

	if numReq == #self.handlesReq then

		if #self.handlesOne > 1 then

			for i,entC in pairs( entComponets ) do

				for ii,oneC in ipairs(self.handlesOne ) do

					if entC.name == oneC then

						self.entities[entity:getID()] = entity

					end

				end

			end

		else 

			self.entities[entity:getID()] = entity

		end

	end

end

function System:checkEntities( entities )

	for i,ent in ipairs( entities ) do

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

return setmetatable( {new = new},
{__call = function( _,... ) return new(...) end})