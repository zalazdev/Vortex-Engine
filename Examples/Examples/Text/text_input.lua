



local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Text input" )
	_WINDOWS[1]:init() 

    local my_txt = display.new_text( { string = "Input here!" , font = "arial.ttf" , size = 20  , append = true } , 50 , 50 , 1 )
          my_txt:setColorOnly( 0 , 255 , 0 )  -- color green.  
          my_txt:setFont( "Castelar.ttf" , true )  -- Font Castellar (if exist).

    local full_string = "" ; 
    local function getMyTxt()
         
         local user_input = _KEYBOARD:getTextEntered()

         local key_pressed = _KEYBOARD:getKey() 
          
         if key_pressed == "Return" then -- Is Enter was pressed make a new line. 

         	full_string = full_string .. "\n"

         elseif key_pressed ~= "BackSpace" then -- Is NOT BackSpace was pressed. 

           full_string = full_string .. user_input 

         else -- if BackSpace was pressed then delete a character. 

           full_string = string.sub( full_string , 1 , #full_string - 1 ) 

         end 
 
         my_txt:setText( full_string ) -- set the final string (full_string) the text value.

         print( my_txt:getText() ) -- getText method to retrive the string.  

    end 
    Runtime:addEvent( "textEntered" , getMyTxt ) -- Between frames , check for user keyboard input.

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 