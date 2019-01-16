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
#include "utils.h"

bool IsPointInRange(float x1, float y1, float z1, float x2, float y2, float z2, float distance)
{
	return (GetRangeSquared(x1, y1, z1, x2, y2, z2) < (float)(distance * distance));
}

bool IsPointInRangeSq(float x1, float y1, float z1, float x2, float y2, float z2, float distance)
{
	return (GetRangeSquared(x1, y1, z1, x2, y2, z2) < distance);
}

float GetRangeSquared(float x1, float y1, float z1, float x2, float y2, float z2)
{
	x1 -= x2;
	y1 -= y2;
	z1 -= z2;
	return ((float)((float)(x1 * x1) + (float)(y1 * y1) + (float)(z1 * z1)));
}
