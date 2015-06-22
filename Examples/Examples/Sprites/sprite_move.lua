

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprite move" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , 100 , center_y , 1 ) 
		-- Sprite will be located at 100 , center_y of the window #1 and displayed on the window #1.

	      print( "Sprite's initial position at:" , sprite:getPos() )
	      
    local function move_sprite( _table )
        
        local loops = _table[2]  
        if loops > 1 then 
           
           sprite:move( 1 , 0 ) -- move 1 pixel to the left. 

        else

           print( "Actual sprite's position:" , sprite:getPos() )
           print( "Distance walked:" , sprite:getWalked() )

           sprite:resetToStart() -- reset position to 100 , center_y.

           print( "Reseting to start position at:" , sprite:getPosition() ) -- getPos and getPosition are the same methods! 

        end  

    end 

    _TIMERS:new( 1/200 , move_sprite , 200 ) 

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 