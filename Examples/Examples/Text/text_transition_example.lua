

local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Text transitions" )
	_WINDOWS[1]:init() 

  -- You can apply transitios to the sprites too.

    local my_txt = display.new_text( { string = "Hi there!" , font = "arial.ttf" , size = 20  , append = true } , 50 , 50 , 1 )
          my_txt:setColorOnly( 0 , 255 , 0 )  -- color green.  
          my_txt:setFont( "Castelar.ttf" , true )  -- Font Castellar (if exist).
    
    local onStart = function() print( "Animation started" ) end
    local onCancel = function() print( "Animation finished/cancelled" ) end
    local onLoop = function( _t ) print( "Loop number: " .. _t.actual_loop ) end 
    local onPause = function() print( "Animation paused" ) end
    local onResume = function() print( "Animation resumed" ) end

    local t_params = { 

     time = 4 , x = 100 , y = 100 , alpha = 50 , rotation = 180 , loops = 2 , blink = true , delay = 0 , 
     onStart = onStart , onCancel = onCancel , onLoop = onLoop , onPause = onPause , onResume = onResume 
    
     }

      --[[  
       time = duration (required).
       delay = delay the animation "X" seconds. ( default = 0 ) 
       x , y = final position will result in my_txt:move( x * loops , y * loops ). (default = 0)
       alpha = increase o diminish the alpha ( must be a positive value between 0 and 100 ). ( default = obj:getAlpha() )
       rotation = final rotation will result in my_txt:rotate( rotation * loops ). (default = 0)
       loops = final loop. ( default = 1 ).
       blink = ( bool true o false ) if true at the beginning of the next loop the object will recover it original alpha. ( default = false )
       onStart = listener called when the animation start (beginnig of loop #1)
       onLoop = listener called when start the 2nd or laters loops.
       onCancel = listener called when animation is cancelled/finished.
       onPause/onResume = listener called when the animation is paused/resumed. 
       ** All listener are optionals. 
       ** All listener returns a table -> 
          { target = object that owns the animation , animation = the animation object , actual_loop = the current loop }
       ** Note, if the delay haven't finished and you pause the animation, the pause won't have effect.
      ]]

    local trans = transition:new( my_txt , t_params )
    trans:manage( "pause" )
    trans:manage( "resume" )
      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 