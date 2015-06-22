

local function load_test()

  _WINDOWS[1]:construct( 600 , 600 , "Timers giveInfo" )
  _WINDOWS[1]:init() 

    local t = _TIMERS -- for use ease. 
    
    local txt_params = { string = "Hidden message: " , size = 20 }
    
    local my_info = { score = 45 , player_name = "Jean" }
    local options = { extra_delay = 0.5 , tag = "tempo" , data = my_info }

    local function time_counter( timer_data )
        
        local _data = timer_data[1]:giveInfo() 

        print( "Timer info:" )
        print( "Total loops: ".._data.loops.max , "Actual loops: ".._data.loops.actual )
        print( "Delay original: ".._data.delay.original , "actual: ".._data.delay.actual , "extra: ".._data.delay.extra )
        print( "tag: ".._data.info.tag , "data (player name): ".._data.info.data.player_name , "status: ".._data.info.status )
        print( "-----------------------" )
        
    end 

    t:new( 1 , time_counter , 5 , options ) -- call the function "time_counter" every 1 seconds 10 times.  
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 
