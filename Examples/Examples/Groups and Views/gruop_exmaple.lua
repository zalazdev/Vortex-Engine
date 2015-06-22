





local function load_test()
print( package.path )
	_WINDOWS[1]:construct( 600 , 600 , "Group example 1" )
	_WINDOWS[1]:init() 

	local center_x , center_y = _WINDOWS[1]:getCenter() -- Get the current center of the windows #1.

    local function x100ID( self )
       return self.my_id * 100
    end 

	local sprite = display.new_sprite( "my_image.png" , 100 , center_y , 1 ) 
	      sprite.my_id = 10
	      sprite:setAnchor( 0.5 , 0.5 ) -- set Sprite's center as it's coordinates and rotation axis.
	      sprite:setColorOnly( 255 , 0 , 0 ) -- red
	      sprite.x100ID = x100ID 
	      function sprite:getMyID()
             print ( "ID from function: " .. self.my_id ) 
             return self.my_id 
	      end 

	local sprite2 = display.new_sprite( "my_image.png" , 250 , center_y , 1 ) 
	      sprite2.my_id = 20
	      sprite2:setAnchor( 0.5 , 0.5 ) 
	      sprite2:setColorOnly( 0 , 255 , 0 ) -- green
	      sprite2.x100ID = x100ID 
	      function sprite2:getMyID()
             print ( "ID from function: " .. self.my_id ) 
             return self.my_id 
	      end 	

	local sprite3 = display.new_sprite( "my_image.png" , 400 , center_y , 1 ) 
	      sprite3.my_id = 30
	      sprite3:setAnchor( 0.5 , 0.5 ) 
	      sprite3:setColorOnly( 0 , 0 , 255 ) -- blue
	      sprite3.x100ID = x100ID 
	      function sprite3:getMyID()
             print ( "ID from function: " .. self.my_id ) 
             return self.my_id 
	      end 

	local group_1 = _GROUPS:new( "mySprites" , { sprite , sprite2 , sprite3 } , 1 )

	--[[
     parameter 1: string ( name ) ( required ) ( cannot repeat the same name )
     parameter 2: table ( required ) ( put inside the members of the group , if want empty , put a empty table {} or pass nil )
     parameter 3: window , give the window number ( defualt = 1 ) 
	]]

	      local results = group_1:method( "getMyID" )
	      local x100IDs = group_1:method( "x100ID" )
           

           for objs = 1 , #results do
              
              for values = 1 , #results[ objs ] do 
                    
                    print( "ID from results: " .. results[ objs ][ values ] )

              end 

           end 

           for objs = 1 , #x100IDs do
              
              for values = 1 , #x100IDs[ objs ] do 
                    
                    print( "ID x100 from x100IDs table: " .. x100IDs[ objs ][ values ] )

              end 

           end 


           group_1:method( "move" , { 50 , 100 } ) -- move all obejcts in group_1 +50 (x) +100 (y) axis.
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 














