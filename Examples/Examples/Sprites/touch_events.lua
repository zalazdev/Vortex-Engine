


local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Touch events" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.
    
    local str = "Touch the big box for rotate, touch the smallest for reset.\n".."If you touch inside the bounding box\nthe sprite will rotate."

    local text = { string = str , font = "C:\\Windows\\Fonts\\arial.ttf" , size = 20 }
    local info = display.new_text( text , 10 , 50 )

    print( "Hey! If you keep pressed the mouse button and make circles inside the\nbounding box the crate will rotate continuously" )

	local sprite = display.new_sprite( "my_image.png" , center_x , center_y , 1 ) 
		-- Sprite will be located at the center of the window #1 and displayed on the window #1.

		  sprite:setAnchor( 0.5 , 0.5 ) 
	      -- set the anchor point to the medium of the sprite. ( Now the center of the sprite will be located at center_x , center_y ).
	      
    local function rotate_me( self )
        
        self:rotate( 10 ) 

    end 
    
    sprite:addEvent( "touch" , rotate_me )


    local box = display.new_sprite( "bounding_box.png" , center_x , center_y , 1 )
          box:setAnchor( 0.5 , 0.5 )


    local small_box = display.new_sprite( "my_image.png" , center_x + 100 , center_y , 1 )
          small_box:setScale( 0.4 , 0.4 ) -- reduce the size. 

          local function reset()
              sprite:setRotation( 0 )
          end  
          small_box:addEvent( "touch" , reset )

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 