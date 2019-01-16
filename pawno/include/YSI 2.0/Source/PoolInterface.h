#pragma once
#define WINDOWS_LEAN_AND_MEAN
#include <windows.h>

class IPoolInterface
{
public:
	IPoolInterface() {};
	~IPoolInterface() {};

	virtual void Process(float elapsed) = 0;
	virtual void OnPlayerConnect(BYTE playerid) = 0;
	virtual void Reset() = 0;
};
