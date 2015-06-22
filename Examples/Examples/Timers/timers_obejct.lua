

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Timers object" )
	_WINDOWS[1]:init() 

    local t = _TIMERS -- for use ease. 
    
    local txt_params = { string = "Hidden message: " , size = 20 }

    local text_obj = display.new_text( txt_params , 10 , 250 )
          text_obj.msg_array = { "H" , "e" , "l" , "l" , "o" , " " , ":" , ")" }

    local options = { extra_delay = 0 , tag = "tempo" , data = text_obj }

    local function time_counter( timer_data )
        
        local _data = timer_data[1]:giveInfo()
        local loop = timer_data[2] 
        local field = _data.loops.max - loop + 1 ;
              
        local obj = _data.info.data 

        local str = obj:getText() .. obj.msg_array[ field ] 

              obj:setText( str )

    end 

    t:new( 1 , time_counter , #text_obj.msg_array , options ) -- call the function "time_counter" every 1 seconds 10 times.  
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 
