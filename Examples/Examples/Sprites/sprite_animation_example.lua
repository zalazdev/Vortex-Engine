

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprite animation example" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.
  
  local txt_params = { string = "Press the arrows key to start/change the animation!" , size = 15 }
  local my_text = display.new_text( txt_params , 65 , 100 , 1 )

	local sprite = display.new_sprite( "sprite_sheet.png" , center_x , center_y , 1 ) 
        sprite:setAnchor( 0.5 , 0.5 )
    		-- spriterite will be located at the center of the window #1 and dispritelayed on the window #1.

  local onStart = function( params ) print( "Animation: "..params.name.." started" ) end
  local onCancel = function( params ) print( "Animation: "..params.name.." cancelled/stopped" ) end

    local _down = { name = "down" , delay = 0.2 , loops = -1 , start_delay = 0.1 , 
                   [1] = { 32 , 0 , 32 , 32 } , 
                   [2] = { 64 , 0 , 32 , 32 } ,
                   [3] = { 32 , 0 , 32 , 32 } ,  
                   [4] = { 0 , 0 , 32 , 32 } , 

                   onStart = onStart ,
                   onCancel = onCancel   
                 }
    sprite:setAnimation( _down ) 

     --[[  
        name = identifier (required)
        delay = time passed between frames/mask (required) ( in seconds)
        loops = repetitions (using -1 will repeat forever) (default = 1)
        start_delay = delay before the animation start. (default 0.1) (in seconds)
        onStart/onComplete/onCancel/onPause/onResume = listener (functions) ( default = none ) 
        when the animation is complete/cancelled/paused/started if there is a lsitener will be called whit a table as a params.
     ]]

    local _up = { name = "up" , delay = 0.2 , loops = -1 , start_delay = 0.1 , 
                   [1] = { 32 , 96 , 32 , 32 } , 
                   [2] = { 64 , 96 , 32 , 32 } ,
                   [3] = { 32 , 96 , 32 , 32 } ,  
                   [4] = { 0 , 96 , 32 , 32 } ,

                   onStart = onStart ,
                   onCancel = onCancel   
                 }
    sprite:setAnimation( _up )

    local _left = { name = "left" , delay = 0.2 , loops = -1 , start_delay = 0.1 , 
                   [1] = { 32 , 32 , 32 , 32 } , 
                   [2] = { 64 , 32 , 32 , 32 } ,
                   [3] = { 32 , 32 , 32 , 32 } ,  
                   [4] = { 0 , 32 , 32 , 32 } , 

                   onStart = onStart ,
                   onCancel = onCancel  
                 }
    sprite:setAnimation( _left )

    local _right = { name = "right" , delay = 0.2 , loops = -1 , start_delay = 0.1 , 
                   [1] = { 32 , 64 , 32 , 32 } , 
                   [2] = { 64 , 64 , 32 , 32 } ,
                   [3] = { 32 , 64 , 32 , 32 } ,  
                   [4] = { 0 , 64 , 32 , 32 } ,

                   onStart = onStart ,
                   onCancel = onCancel   
                 }
    sprite:setAnimation( _right )  


    local function set_animation( self )

         local n = self:getLastAnimation()

         if _KEYBOARD:getKey() == "Left" then 

            if n ~= "left" then -- avoid to restart the animation.
               self:play( "left" , true ) -- we pass true as second parameter to activate the onCancel callback of the previous animation.
            end

         elseif _KEYBOARD:getKey() == "Right" then 
       
            if n ~= "right" then -- avoid to restart the animation.
               self:play( "right" , true )
            end

         elseif _KEYBOARD:getKey() == "Up" then

            if n ~= "up" then -- avoid to restart the animation.
               self:play( "up" , true )
            end

         elseif _KEYBOARD:getKey() == "Down" then 

            if n ~= "down" then -- avoid to restart the animation.
               self:play( "down" , true )
            end

         end

    end 

    sprite:addEvent( "keyPressed" , set_animation ) 
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 