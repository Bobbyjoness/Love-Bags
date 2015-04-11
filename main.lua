local Engine = require ("bag")

local Entity = require ("entity")

local System = require ("system")

--Components are tables. Components can also have consructors

local engine = Engine(  )

local dog = Entity( "dog" )

local cat = Entity( "cat" )

local function posComponent( x, y )

	return { name = "pos", x = x, y =y }

end

local function recComponent( width, height, type )

	return { name = "rectangle", width = width, height = height, type = type or "fill" }

end

local function circleComponent( radius, type )

	return { name = "circle", radius = radius, type = type or "fill" }

end

local function colorComponent( r, g, b, a )

	return { name = "color", color = { r, g, b, a } }

end




dog:addComponent( posComponent( 10, 10 ) )

dog:addComponent( recComponent( 100, 100 ) )

dog:addComponent( colorComponent( 255, 0, 0, 255 ) )


cat:addComponent( posComponent( 150, 100 ) )

cat:addComponent( circleComponent( 10 ) )

cat:addComponent( colorComponent( 0, 0, 255, 255 ) )





local renderShapeSystem = System( "render", "draw" )

renderShapeSystem:setHandles( { "pos" , "color" }, { "rectangle", "circle" } )

function renderShapeSystem:draw( )

	for i,ent in pairs(self.entities) do

		comp = ent:getAllComponents( )

		love.graphics.setColor(comp['color'].color)

		if comp['rectangle'] then

			love.graphics.rectangle( comp["rectangle"].type, comp['pos'].x, comp['pos'].y, comp['rectangle'].width, comp['rectangle'].height )

		elseif comp['circle'] then	
			
			love.graphics.circle( comp['circle'].type, comp["pos"].x, comp["pos"].y, comp["circle"].radius )

		end

	end

end

local renderUpdateSystem = System( "logic", "update" )

renderUpdateSystem:setHandles( { "pos" }, { } )


function renderUpdateSystem:update( dt )

	for i,ent in pairs(self.entities) do

		comp = ent:getAllComponents( )

		comp['pos'].x = comp['pos'].x + 1*dt

	end

end

engine:registerSystem( renderShapeSystem )

engine:addEntity( dog )

engine:addEntity( cat )

engine:registerSystem( renderUpdateSystem )


function love.load()

end

function love.update( dt )

	engine:update( dt )

end

function love.draw()

	love.graphics.print("FPS :"..love.timer.getFPS())

	engine:draw(  )

end