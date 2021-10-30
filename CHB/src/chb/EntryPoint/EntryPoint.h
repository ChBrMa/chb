#pragma once

#ifdef RN_PLAT_WIN

#include "cstdio"
extern CHB::Application* CHB::Create_Application();


int main()
{
	printf("Hello from EP");
	auto app = CHB::Create_Application();
	app->run();
	delete app;

	return 0;
}



#endif