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
#include "OrderedList.h"
#include "OrderedItem.h"

/*
Defines a list which can only have a certain number of items
Note that this does not fully implement the LinkedList API, only Add
*/

template <class T, class U>
class CLimitedList : public COrderedList<T, U>
{
private:
	int
		m_iCount,
		m_iSize;
public:
	CLimitedList(int size) : COrderedList() { m_iCount = 0; m_iSize = size; };
	~CLimitedList();
	
	virtual int Add(T *data, U value);
	COrderedItem<T*, U>* GetLast() { return static_cast<COrderedItem<T*, U>*>(GetFirst()->GetLast()); };
	bool IsFull() { return m_iSize == m_iCount; };
};

template <class T, class U>
CLimitedList<T, U>::~CLimitedList()
{
	if (GetFirst())
	{
		COrderedItem<T*, U>
			*next = static_cast<COrderedItem<T*, U>*>(GetFirst()->GetNext()),
			*cur;
		while (next->GetData())
		{
			cur = next;
			next = static_cast<COrderedItem<T*, U>*>(cur->GetNext());
			if (m_bRemove)
			{
				delete cur->GetData();
			}
			delete cur;
		}
		delete GetFirst();
		SetFirst(NULL);
	}
	m_bRemove = false;
}

template <class T, class U>
int CLimitedList<T, U>::Add(T *data, U value)
{
	int
		ret = COrderedList::Add(data, value);
	if (++m_iCount > m_iSize)
	{
		COrderedItem<T*, U>
			*pLast = GetLast();
		Extract(static_cast<CLinkedItem<T*>*>(pLast));
		delete pLast;
		m_iCount--;
	}
	return ret;
}
