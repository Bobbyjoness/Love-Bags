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

local Bag = {}

Bag.__index = Bag

local function new()
	return setmetatable( {}, Bag )
end

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

return setmetatable( {new = new},
{__call = function( _,... ) return new(...) end})