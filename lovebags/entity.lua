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

local Entity = {}

Entity.__index = Entity

local function new()
	return setmetatable( {}, Entity )
end

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

return setmetatable( {new = new},
{__call = function( _,... ) return new(...) end})