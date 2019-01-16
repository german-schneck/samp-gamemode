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
#include "LinkedItem.h"

template <class T, class U>
class COrderedItem : public CLinkedItem<T>
{
private:
	U
		m_value;
public:
	COrderedItem() : CLinkedItem() { m_value = (U)0; };
	COrderedItem(T data, CLinkedItem<T> *next, CLinkedItem<T> *last, U value) : CLinkedItem(data, next, last) { m_value = value; };

	inline U GetValue() { return m_value; };
};
