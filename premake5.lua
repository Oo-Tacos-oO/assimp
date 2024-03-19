-- Assimp lib --

project "Assimp"
	--kind "SharedLib"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"
	--staticruntime "on"
	systemversion "latest"
	rtti "on"

	targetdir (binariesDir .. "/%{prj.name}")
	objdir (binariesIntermediateDir .. "/%{prj.name}")

	files {
		"code/**.h",
		"code/**.hpp",
		"code/**.cpp",

		"include/**.h",
		"include/**.hpp",
		"include/**.cpp",

		"contrib/Open3DGC/*.cpp",
		"contrib/unzip/*.c",
		"contrib/zlib/*.c",
	}
	removefiles {
		"code/**.vs*/**",
		"include/**.vs*/**",
		"contrib/**.vs*/**",
	}

	includedirs {
		"./",
		"include",
		"code",
		"contrib",
		"contrib/zlib",
		"contrib/rapidjson/include",
		"contrib/pugixml/src",
		"contrib/utf8cpp/source",
		"contrib/unzip",
		"contrib/openddlparser/include",
	}

	defines {
		-- "SWIG",
		"ASSIMP_BUILD_NO_OWN_ZLIB",

		"ASSIMP_NO_EXPORT",
		"ASSIMP_BUILD_NO_EXPORT",
		"ASSIMP_BUILD_DLL_EXPORT",
		"ASSIMP_BUILD_NO_M3D_EXPORTER",
		"ASSIMP_BUILD_NO_STEP_EXPORTER",

		--Remove useless importers
		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_M3D_IMPORTER",
		"ASSIMP_BUILD_NO_X_IMPORTER",
		"ASSIMP_BUILD_NO_MDL_IMPORTER",
		"ASSIMP_BUILD_NO_MD2_IMPORTER",
		"ASSIMP_BUILD_NO_PLY_IMPORTER",
		"ASSIMP_BUILD_NO_ASE_IMPORTER",
		"ASSIMP_BUILD_NO_AMF_IMPORTER",
		"ASSIMP_BUILD_NO_HMP_IMPORTER",
		"ASSIMP_BUILD_NO_SMD_IMPORTER",
		"ASSIMP_BUILD_NO_MDC_IMPORTER",
		"ASSIMP_BUILD_NO_MD5_IMPORTER",
		"ASSIMP_BUILD_NO_STL_IMPORTER",
		"ASSIMP_BUILD_NO_LWO_IMPORTER",
		"ASSIMP_BUILD_NO_DXF_IMPORTER",
		"ASSIMP_BUILD_NO_NFF_IMPORTER",
		"ASSIMP_BUILD_NO_RAW_IMPORTER",
		"ASSIMP_BUILD_NO_OFF_IMPORTER",
		"ASSIMP_BUILD_NO_AC_IMPORTER",
		"ASSIMP_BUILD_NO_BVH_IMPORTER",
		"ASSIMP_BUILD_NO_IRRMESH_IMPORTER",
		"ASSIMP_BUILD_NO_IRR_IMPORTER",
		"ASSIMP_BUILD_NO_Q3D_IMPORTER",
		"ASSIMP_BUILD_NO_B3D_IMPORTER",
		"ASSIMP_BUILD_NO_TERRAGEN_IMPORTER",
		"ASSIMP_BUILD_NO_CSM_IMPORTER",
		"ASSIMP_BUILD_NO_3D_IMPORTER",
		"ASSIMP_BUILD_NO_LWS_IMPORTER",
		"ASSIMP_BUILD_NO_OGRE_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
		"ASSIMP_BUILD_NO_MS3D_IMPORTER",
		"ASSIMP_BUILD_NO_COB_IMPORTER",
		"ASSIMP_BUILD_NO_Q3BSP_IMPORTER",
		"ASSIMP_BUILD_NO_NDO_IMPORTER",
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"ASSIMP_BUILD_NO_XGL_IMPORTER",
		"ASSIMP_BUILD_NO_ASSBIN_IMPORTER",
		"ASSIMP_BUILD_NO_3MF_IMPORTER",
		"ASSIMP_BUILD_NO_X3D_IMPORTER",
		"ASSIMP_BUILD_NO_MMD_IMPORTER",
		"ASSIMP_BUILD_NO_SIB_IMPORTER",

		--"ASSIMP_INJECT_DEBUG_POSTFIX",
		"UNICODE",
		"_UNICODE",
		
		"OPENDDLPARSER_BUILD",
		"assimp_EXPORTS",

		"RAPIDJSON_NOMEMBERITERATORCLASS",
		"RAPIDJSON_HAS_STDSTRING=1",
		"ASSIMP_IMPORTER_GLTF_USE_OPEN3DGC=1",

		"_SCL_SECURE_NO_WARNINGS",
		"_CRT_SECURE_NO_WARNINGS",

		--"BUILD_SHARED_LIBS=0",
		--"ASSIMP_BUILD_TESTS=0",
		--"ASSIMP_INSTALL=0",
		--"ASSIMP_INSTALL_PDB",
		--"USE_STATIC_CRT",
		--"ASSIMP_BUILD_ASSIMP_VIEW=0",
	}

	--[[
	buildoptions {
		"",
	}
	]]--

	flags {
		--"FatalWarnings",
		"MultiProcessorCompile",
		--"NoIncrementalLink",
	}

	filter "system:Windows"
		defines {
			"_WINDOWS",
			"WIN32",
			"WIN32_LEAN_AND_MEAN",
		}
		disablewarnings {
			"4244",
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		defines {
			"_DEBUG",
		}

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
		defines {
			"NDEBUG",
		}

	filter "configurations:Distribution"
		runtime "Release"
		optimize "speed"
		symbols "off"
		defines {
			"NDEBUG",
		}