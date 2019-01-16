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
#include "LinkedList.h"
#include "OrderedItem.h"

template <class T, class U>
class COrderedList : public CLinkedList<T>
{
protected:
	COrderedItem<T*, U>* GetAt(U value);
public:
	~COrderedList();

	virtual int Add(T *data, U value);
	T* Get(U value);
	virtual void DeleteAt(U value);
};

template <class T, class U>
COrderedList<T, U>::~COrderedList()
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
	// So later deconstructors don't crash
	m_bRemove = false;
}

template <class T, class U>
int COrderedList<T, U>::Add(T *data, U value)
{
	if (GetFirst())
	{
		COrderedItem<T*, U>
			*next = static_cast<COrderedItem<T*, U>*>(GetFirst()->GetNext()),
			*pItem = new COrderedItem<T*, U>(data, NULL, NULL, value);
		if (pItem)
		{
			while (next->GetData())
			{
				if (next->GetValue() > value)
				{
					break;
				}
				next = static_cast<COrderedItem<T*, U>*>(next->GetNext());
			}
			CLinkedItem<T*>
				*last = next->GetLast();
			next->SetLast(pItem);
			last->SetNext(pItem);
			pItem->SetLast(last);
			pItem->SetNext(next);
			return 1;
		}
	}
	return 0;
}

template <class T, class U>
COrderedItem<T*, U>* COrderedList<T, U>::GetAt(U value)
{
	if (GetFirst())
	{
		COrderedItem<T*, U>
			*next = static_cast<COrderedItem<T*, U>*>(GetFirst()->GetNext());
		while (next->GetData())
		{
			if (next->GetValue() == value)
			{
				return next;
			}
			next = static_cast<COrderedItem<T*, U>*>(next->GetNext());
		}
	}
	return NULL;
}

template <class T, class U>
T* COrderedList<T, U>::Get(U value)
{
	COrderedItem<T*, U>
		*val = GetAt(value);
	if (val)
	{
		return val->GetData();
	}
	return NULL;
}

template <class T, class U>
void COrderedList<T, U>::DeleteAt(U value)
{
	COrderedItem<T*, U>
		*list = GetAt(value);
	if (list)
	{
		Extract(list);
		delete list->GetData();
		delete list;
	}
}
