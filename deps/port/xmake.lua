add_rules("mode.debug", "mode.release")
set_languages("c14")

target("sndfilter")
    set_kind("$(kind)")
    set_encodings("utf-8")
    add_includedirs("src")
    add_headerfiles("src/(*.h)")
    add_files("src/*.c")
