#include <iostream>
#include <chb.h>


class Sandbox : public CHB::Application
{
public:
	Sandbox() {  }
	~Sandbox() {  }

};


CHB::Application* CHB::Create_Application()
{
	return new Sandbox;
}


