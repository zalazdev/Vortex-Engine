

Option "with-minify"

Output "vortex_engine_v1.dll"

if GetOption "with-minify" then
    
    -- loaders 
	Module "init_engine"
	Module "loader"

    -- dependencies  
	Module "math_import" 
	Module "lua_enum"
	Module "lua_extension"
	Module "lua_zip"
	Module "cifrado_hash"
	Module "cifrado_ukey"
	Module "save_table"
	Module "save_system"
	Module "save_system2"
	Module "spr_events_lib"
	Module "physics_aux"
	Module "wise_render_lib"
	Module "animation_lib"

	-- core lib
	Module "fps_lib" 
	Module "events_lib" 
	Module "runtime_lib" 
	Module "keyboard_lib" 
	Module "sprite_lib"  
	Module "text_lib" 
	Module "texture_lib" 
	Module "window_lib"  
	Module "timers_lib" 
	Module "groups_lib" 
	Module "view_lib" 
	Module "draw_lib" 
	Module "transition_lib" 
	Module "physics_lib" 
	Module "vision_lib" 
	Module "particle_system" 
	
end