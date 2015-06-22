

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprites events" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , center_x , center_y , 1 ) -- Sprite will be located at the center of the window #1 and displayed on the window #1.
	      sprite.my_id = 15 
	      sprite:setAnchor( 0.5 , 0.5 ) -- set Sprite's center as it's coordinates and rotation axis.

	  print( "Make silly things with the mouse/keyboard like touching etc." )

	  local function touch( self )
         print( "Sprite touched , id:" , self.my_id )
	  end 
	  sprite:addEvent( "touch" , touch ) -- Sprite's bounding box touched.

	  local function mouse_status( self )

	  	 local b = _MOUSE:getButton() 
	  	 local s = _MOUSE:getStatus() 

         print( "Mouse button: "..b , "satus: "..s )

	  end 
	  sprite:addEvent( "mouseStatus" , mouse_status ) -- Button pressed and status.

	  local function mouse_screen( self )
	  	 print( "The mouse is inside the window: " , _MOUSE:getMouseScreen() )
	  end
	  sprite:addEvent( "mouseScreen" , mouse_screen ) -- Mouse inside/outside screen.
      
      local function key_event( self )
      	 local k = _KEYBOARD 
         print( "Key pressed: "..k:getKey() , "Status: "..k:getStatus() )
      end
      sprite:addEvent( "keyPressed" , key_event ) -- Any key was pressed.
      sprite:addEvent( "keyReleased" , key_event ) -- Any key was released.
      sprite:addEvent( "keyIsPressed" , key_event ) -- Any key is being pressed.

      local function onRuntime( self )
      	  self:rotate( 1 )
      end
      sprite:addEvent( "enterFrame" , onRuntime )

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 