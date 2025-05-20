package("sndfilter")
    set_homepage("https://github.com/velipso/sndfilter")
    set_description("Algorithms for sound filters, like reverb, dynamic range compression, lowpass, highpass, notch, etc")
    set_license("0-bsd")

    add_deps("meson")

    add_urls("https://github.com/velipso/sndfilter.git")
    add_versions("2024.06.23", "1e45029cc5eae2ad12dc7ca1e06c59693482ff90")
    add_patches("2024.06.23", "patches/master/meson_build.diff", "a44eca879f2690f849792ef9379e8432bf0add127dd009fb6615c7a065851d64")

    add_includedirs("src")

    on_install(function(package)
        import("package.tools.meson").install(package)
    end)

    on_test(function(package)
        assert(package:has_cfuncs("sf_snd_new", {includes = "snd.h"}))
    end)
