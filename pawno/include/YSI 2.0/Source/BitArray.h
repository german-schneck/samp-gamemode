/*  
 *  Version: MPL 1.1
 *  
 *  The contents of this file are subject to the Mozilla Public License Version 
 *  1.1 (the "License"); you may not use this file except in compliance with 
 *  the License. You may obtain a copy of the License at 
 *  http://www.mozilla.org/MPL/
 *  
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *  
 *  The Original Code is the YSI 2.0 SA:MP plugin.
 *  
 *  The Initial Developer of the Original Code is Alex "Y_Less" Cole.
 *  Portions created by the Initial Developer are Copyright (C) 2008
 *  the Initial Developer. All Rights Reserved.
 *  
 *  Contributor(s):
 *  
 *  Peter Beverloo
 *  Marcus Bauer
 */
#pragma once
#define WINDOWS_LEAN_AND_MEAN
#include <windows.h>
#include "../main.h"

#define _INT_BITS (sizeof (unsigned long) * 8)

class CBitArray
{
private:
	unsigned long
		*m_uplData;
	int
		m_iSize;
public:
	CBitArray(int size = MAX_PLAYERS) { m_iSize = size; m_uplData = (unsigned long *)calloc((size + _INT_BITS - 1) / _INT_BITS, sizeof (unsigned long)); };
	~CBitArray() { free(m_uplData); };
	void Set(int slot, int set) { if (set) Let(slot); else Vet(slot); };
	void Let(int slot) { m_uplData[slot / _INT_BITS] |= (1 << (slot % _INT_BITS)); };
	void Vet(int slot) { m_uplData[slot / _INT_BITS] &= ~(1 << (slot % _INT_BITS)); };
	bool Get(int slot) { return (m_uplData[slot / _INT_BITS] & (1 << (slot % _INT_BITS))) ? true : false; };
	void SetAll(int set) { memset(m_uplData, set ? -1 : 0, ((m_iSize + _INT_BITS - 1) / _INT_BITS) * sizeof (unsigned long)); };
};
