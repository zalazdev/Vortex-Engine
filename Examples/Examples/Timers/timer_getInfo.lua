

local function load_test()

  _WINDOWS[1]:construct( 600 , 600 , "Timers getInfo" )
  _WINDOWS[1]:init() 

    local t = _TIMERS -- for use ease. 
    
    local txt_params = { string = "Hidden message: " , size = 20 }
    
    local my_info = { score = 45 , player_name = "Jean" }
    local options = { extra_delay = 0.5 , tag = "tempo" , data = my_info }
    
    print( "Leyend:" )
    print( "id = number ( only disponible when calling from _TIMERS:getInfo() )" )
    print( "Tag = tag named by the programmer" )
    print( "D = delay ; AD = actual delay ; ED = extra delay" )
    print( "OL = original (max) loops ; AL = actual (current countdown) loop" )
    print( "S = status" )

    local function time_counter( timer_data )
        timer_data[1]:getInfo() 
    end 

    t:new( 1 , time_counter , 5 , options ) -- call the function "time_counter" every 1 seconds 10 times.  
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 
