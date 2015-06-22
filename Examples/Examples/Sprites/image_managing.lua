

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Image managing" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , center_x , center_y , 1 ) 
	-- Sprite will be located at the center of the window #1 and displayed on the window #1.
	      
	      sprite:setAnchor( 0.5 , 0.5 ) 
	      -- set the anchor point to the medium of the sprite. ( Now the center of the sprite will be located at center_x , center_y ).

	      sprite:setColorOnly( 255 , 0 , 0 ) -- tint the sprite red. 

	      sprite:setAlpha( 50 ) -- set the alpha (opacity) to 50%.crate

	      -- sprite:setColor( 255 , 0 , 0 , 50 ) -- do the same but in a single call.  

	      sprite:setRotation( 20 ) -- set the sprite rotation to 20 degrees.
	      sprite:rotate( 25 ) -- add 25 degrees to the actual rotation. the final will be 45 ( 20 + 25 ). 

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 