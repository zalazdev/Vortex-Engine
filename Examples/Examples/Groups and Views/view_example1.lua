





local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Sprites events" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

	local sprite = display.new_sprite( "my_image.png" , 300 , 300 , 1 ) 
	      sprite:setAnchor( 0.5 , 0.5 ) -- set Sprite's center as it's coordinates and rotation axis.
	      sprite:setColorOnly( 255 , 0 , 0 ) -- red

	local view = display.new_view( center_y , center_y , 300 , 300 )
	--set the view at the center of the window, an set it size 300 width 300 height. 

	 --[[  
     The center of the view ( center_x  ,center_y ) will define where the center of the rectangle ( 300 , 300 ) will be.
     The relative size of the objects will depend on the view's size. the formula will be 
     sprite_width = sprite_width * window_width / view_width.
     sprite_height = sprite_height * window_height / view_height. 

     Bigger the view smaller the sprite relative size and viceversa.


	 ]]


	local group_1 = _GROUPS:new( "mySprites" , { sprite } , 1 )
		  group_1:setView( view ) -- set the group view.

		   --[[  
           The view will only affect the sprite inside the group, with this you can set multiples views in different groups.
           Single (not-grouped) sprite can't have own views. 
		   ]]

    _EVENTS.usingWindow = _WINDOWS[1] 
    -- _EVENTS.usingView = view 

     --[[ 
     we set this both parameters to get the position of the touch according to the view. 
     if you want get the window position of the touch only set _EVENTS.usingView = nil  
      ]]

    local function _touch()
      print( _MOUSE.x , _MOUSE.y )
      sprite:setPos( _MOUSE.x , _MOUSE.y )
    end 

    Runtime:addEvent( "touch" , _touch )

    --[[
    As you can see the original window's touch positions is 
    At the left-upper corner is 0,0
    At the left-bottom corner is 0,600
    At the right-upper corner is 600,0
    At the right-bottom corner is 600,600

    But setting this 
    _EVENTS.usingWindow = _WINDOWS[1] 
    _EVENTS.usingView = view 

    The touch will show the views position ( this is helpul for know where its (x,y) position in the view )
    At the left-upper corner is 150,150 ( view_center_x - ( view_width/2 ) ) , ( view_center_y - ( view_height/2 ) )
    At the left-bottom corner is 150,450 ( view_center_x - ( view_width/2 ) ) , ( view_center_y + ( view_height/2 ) )
    At the right-upper corner is 450,150 ( view_center_x + ( view_width/2 ) ) , ( view_center_y - ( view_height/2 ) )
    At the right-bottom corner is 450,450 ( view_center_x + ( view_width/2 ) ) , ( view_center_y + ( view_height/2 ) )

    This coordinates obvious will change rotating the view, zooming IN/OUT, move X/Y offset, changing the viewport, the center...etc...
    ]]

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 














