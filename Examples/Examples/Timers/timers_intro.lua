


local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Timers intro" )
	_WINDOWS[1]:init() 

    local t = _TIMERS -- for use ease. 

    local options = { extra_delay = 0 , tag = "tempo" , data = { "hi" , score = 45 } }
    local function time_counter( table )
        
        local info = table[1]:giveInfo() 
        local loops = table[2]
        local seconds = info.loops.max - loops + 1 ;

        print( "Seconds passed: "..seconds )

        if seconds == info.loops.max then 
           print( "Custom data: "..info.info.data.score , "\nTimer tag: "..info.info.tag )
        end 
    end 

    t:new( 1 , time_counter , 10 , options ) -- call the function "time_counter" every 1 seconds 10 times.  
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 


