

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprite keyboard" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , center_x , center_y , 1 ) 
        sprite:setAnchor( 0.5 , 0.5 )
    		-- Sprite will be located at the center of the window #1 and displayed on the window #1.

	      print( "Sprite's initial position at:" , sprite:getPos() )

        print( "Press up/down/left/right to move!!!" )
	      
    local function move_sprite( self )
        
       if _KEYBOARD:getStatus() == "isPressed" or _KEYBOARD:getStatus() == "Pressed" then -- this condition could be ommited.

           if _KEYBOARD:getKey() == "Left" then 
              
              self:move( -2 , 0 )

           elseif _KEYBOARD:getKey() == "Right" then 

              self:move( 2 , 0 )

           elseif _KEYBOARD:getKey() == "Up" then

              self:move( 0 , -2 ) 

           elseif _KEYBOARD:getKey() == "Down" then 

              self:move( 0 , 2 )

           end

        end 

    end 

    sprite:addEvent( "keyIsPressed" , move_sprite )
    sprite:addEvent( "keyPressed" , move_sprite ) 
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 