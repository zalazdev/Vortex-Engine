

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprite move softly" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , center_x , center_y , 1 ) 
        sprite:setAnchor( 0.5 , 0.5 )
    		-- Sprite will be located at the center of the window #1 and displayed on the window #1.

	      print( "Sprite's initial position at:" , sprite:getPos() )

        print( "Press up/down/left/right to move!!!" )

    local function move_sprite( self )

           if _KEYBOARD:isThisPressed( "Left" ) then 
              
              self:move( -2 , 0 )

           elseif _KEYBOARD:isThisPressed( "Right" ) then 

              self:move( 2 , 0 )

           elseif _KEYBOARD:isThisPressed( "Up" ) then

              self:move( 0 , -2 ) 

           elseif _KEYBOARD:isThisPressed( "Down" ) then 

              self:move( 0 , 2 )

           end

    end 

    sprite:addEvent( "enterFrame" , move_sprite ) 

    _TIMERS:new( 5 , function( s ) s[1]:giveInfo().info.data:removeEvent( "enterFrame" , move_sprite ) end , 1 , { data = sprite } )   

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 