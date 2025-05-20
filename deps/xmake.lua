package("sndfilter")
    set_homepage("https://github.com/velipso/sndfilter")
    set_description("Algorithms for sound filters, like reverb, dynamic range compression, lowpass, highpass, notch, etc")
    set_license("0-bsd")

    add_urls("https://github.com/velipso/sndfilter.git")

    add_includedirs("src")

    on_install(function(package)
        os.cp(path.join(package:scriptdir(), "port", "xmake.lua"), "xmake.lua")
        import("package.tools.xmake").install(package)
    end)

    on_test(function(package)
        assert(package:has_cfuncs("sf_snd_new", {includes = "snd.h"}))
    end)
