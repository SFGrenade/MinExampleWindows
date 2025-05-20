package("sndfilter")
    set_homepage("https://github.com/velipso/sndfilter")
    set_description("Algorithms for sound filters, like reverb, dynamic range compression, lowpass, highpass, notch, etc")
    set_license("0-bsd")

    add_urls("https://github.com/velipso/sndfilter.git")

    add_includedirs("src")

    on_install(function(package)
        io.writefile("xmake.lua", [[
            add_rules("mode.debug", "mode.release")
            set_languages("c14")
            target("sndfilter")
                set_kind("$(kind)")
                set_encodings("utf-8")
                add_includedirs("src")
                add_headerfiles("src/(*.h)")
                add_files("src/*.c")
                remove_files("src/main.c")
        ]])
        import("package.tools.xmake").install(package)
    end)

    on_test(function(package)
        assert(package:has_cfuncs("sf_snd_new", {includes = "snd.h"}))
    end)
