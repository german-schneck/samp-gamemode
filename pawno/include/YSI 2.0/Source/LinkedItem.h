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

template <class T>
class CLinkedItem
{
private:
	CLinkedItem<T>
		*m_pNext,
		*m_pLast;
	T
		m_pData;
public:
	CLinkedItem()
	{
		m_pData = NULL;
		m_pNext = NULL;
		m_pLast = NULL;
	};
	CLinkedItem(T data, CLinkedItem<T> *next, CLinkedItem<T> *last)
	{
		m_pData = data;
		m_pNext = next;
		m_pLast = last;
	};
	~CLinkedItem() {};

	inline CLinkedItem<T>* GetNext() { return m_pNext; };
	inline CLinkedItem<T>* GetLast() { return m_pLast; };
	inline T GetData() { return m_pData; };
	inline void SetNext(CLinkedItem<T> *next) { m_pNext = next; };
	inline void SetLast(CLinkedItem<T> *last) { m_pLast = last; };
};
