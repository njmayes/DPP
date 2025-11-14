project "DPP"
    kind "StaticLib"       -- Or "SharedLib"
    language "C++"
    cppdialect "C++latest"

    -- Headers
    includedirs {
        "include",
        "include/dpp",
    }

    -- Source files
    files {
        "src/**.cpp",
        "src/**.h",
        "include/**.h"
    }

    -- Required external libraries
    filter "system:windows"
        defines { "_WIN32_WINNT=0x0601" }
        links { "Ws2_32", "Winmm", "Crypt32", "Secur32", "Bcrypt" }

    filter "system:linux"
        links { "pthread", "fmt", "curl", "ssl", "crypto" }

    filter "system:macosx"
        links { "curl", "ssl", "crypto" }

    filter {}

    -- DPP uses JSON (nlohmann), which is header-only, nothing extra to link
    -- DPP uses fmt (sometimes header-only, sometimes linked on Linux)
