#pragma once
#include "chb/Core.h"

namespace CHB
{
	class API Application
	{
	public:
		Application();
		virtual ~Application();

		auto run() -> void;

	};

	Application* Create_Application();
}

