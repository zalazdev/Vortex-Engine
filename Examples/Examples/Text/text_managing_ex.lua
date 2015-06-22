


local function load_test()

	_WINDOWS[1]:construct( 600 , 600 , "Text managing" )
	_WINDOWS[1]:init() 

    -- Remember that text inherith the same that sprites class exept sprite's masks relatives methods and Animation methods. 
    
    local txt_params = { string = "Example Text display!" , font = "arial.ttf" , size = 20  , append = true }
           --[[  
           string = the text message. (required)
           font = font name. ( default = arial.tff )
           size = size of the font. ( default = 10 )
           append = bool / string. if bool (true) will seaarch the font in the path C:\Windows\fonts\font_name.font_extension 
           if string (path) will search the font in provided_path\font_name.font_extension
           if nil or false ( default ) will search on the project's folder.
           note: You can provide the full font path in font field like:
           { string = "Hi there!" , font = "C:\\Windows\\fonts\\Castellar.ttf" , size = 20 }
           **Rember that you NEED to use double \ (\\) to express the \ character like in C or C++. 
           ]]

    local my_txt = display.new_text( txt_params , 50 , 50 , 1 )
          my_txt:setColorOnly( 0 , 255 , 0 )  -- color green.  
          my_txt:setFont( "Castelar.ttf" , true )  -- Font Castellar (if exist).

          -- the seccond parameter if the same that append, pass true or a path , otherwise pass nil, false or simply omit it.
          
          local my_font_styles = { "b" , "i" , "u" } 
          
          my_txt:setStyle( my_font_styles )
          -- r - regular (default) | b - bold | i - italic | u - underlined | s - strikethrough.   
    

      
end 

local result , err = pcall( load_test ) 

if err then 
   print( err ) -- If any error while loading , print it! 
end 