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
#include "../main.h"
#include "AreaCube.h"

CAreaCube::CAreaCube(float minx, float miny, float minz, float maxx, float maxy, float maxz) : CArea()
{
	m_fMaxX = maxx;
	m_fMinX = minx;
	m_fMaxY = maxy;
	m_fMinY = miny;
	m_fMaxZ = maxz;
	m_fMinZ = minz;
}

bool CAreaCube::Process(int playerid, float x, float y, float z)
{
	return x >= m_fMinX && x <= m_fMaxX && y >= m_fMinY && y <= m_fMaxY && z >= m_fMinZ && z <= m_fMaxZ;
}
