workspace "chb"
    architecture "x64"
   -- startproject "Sandbox"
    configurations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "chb"
    location "chb"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/src"
    }

    filter "system:windows"
        cppdialect "C++20"
        staticruntime "On"
        systemversion "latest"

        defines {
            "RN_BUILD_DLL",
            "RN_PLAT_WIN"
        }

        postbuildcommands{
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "NT_DEBUG"
        symbols "On"
    filter "configurations:Release"
        defines "NT_RELEASE"
        optimize "On"
        filter "configurations:Dist"
        defines "NT_DIST"
        optimize "On"

project "Sandbox"
location "Sandbox"
kind "ConsoleApp"
language "C++"

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")

files {
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.hpp",
    "%{prj.name}/src/**.cpp"
}

links{
    "chb"
}

includedirs {
    "chb/src"
}

filter "system:windows"
    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    defines {
        "RN_BUILD_DLL",
        "RN_PLAT_WIN"
    }