set_project( "CursedMod" )

set_version( "0.0.1", { build = "%Y%m%d", soname = true } )

set_warnings( "allextra" )

add_rules( "mode.debug", "mode.release", "mode.releasedbg", "mode.minsizerel" )

set_languages( "c++20" )

if is_plat( "windows" ) then
    add_cxflags( "/permissive-" )
    add_cxflags( "/Zc:__cplusplus" )
    add_cxflags( "/Zc:preprocessor" )

    add_defines("_CRT_SECURE_NO_WARNINGS")
else
end

-- maybe this helps for the ci?
set_policy( "build.across_targets_in_parallel", false )

add_requires( "sndfilter" )

--add_requireconfs( "**", "*.**", { system = false } )
add_requireconfs( "*", { configs = { shared = get_config( "kind" ) == "shared" } } )

target( "CursedModNative" )
    set_kind( "binary" )

    set_default( true )
    set_group( "EXES" )

    add_packages( "sndfilter" )

    add_includedirs( "src" )

    add_files( "src/*.cpp" )
