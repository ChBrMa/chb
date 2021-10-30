#pragma once
#ifdef RN_PLAT_WIN
#ifdef RN_BUILD_DLL
#define API __declspec(dllexport)
#else
#define API __declspec(dllimport)
#endif
#endif