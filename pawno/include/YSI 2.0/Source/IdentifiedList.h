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
#include "IdentifiedItem.h"

template <class T>
class CIdentifiedList : public COrderedList<T, int>
{
private:
	CIdentifiedItem<T*>
		*m_pFirstFree;
	void RemoveInternal(CIdentifiedItem<T*> *list, bool del);
public:
	CIdentifiedList();
	~CIdentifiedList();
	
	virtual int Add(T *data);
	virtual void Remove(T *data);
	virtual void DeleteAt(int value);
	virtual void DeleteCurrent();
	virtual void RemoveCurrent();
	int GetHighestID() { return static_cast<CIdentifiedItem<T*>*>(GetFirst()->GetLast())->GetValue(); };
};

template <class T>
CIdentifiedList<T>::CIdentifiedList()
{
	SetFirst(new CIdentifiedItem<T*>());
	Init();
	m_pFirstFree = static_cast<CIdentifiedItem<T*>*>(GetFirst());
}

template <class T>
CIdentifiedList<T>::~CIdentifiedList()
{
	if (GetFirst())
	{
		CIdentifiedItem<T*>
			*next = static_cast<CIdentifiedItem<T*>*>(GetFirst()->GetNext()),
			*cur;
		while (next->GetData())
		{
			cur = next;
			next = static_cast<CIdentifiedItem<T*>*>(cur->GetNext());
			if (m_bRemove)
			{
				delete cur->GetData();
			}
			delete cur;
		}
		delete static_cast<CIdentifiedItem<T*>*>(GetFirst());
		SetFirst(NULL);
	}
	m_bRemove = false;
}

template <class T>
int CIdentifiedList<T>::Add(T *data)
{
	if (m_pFirstFree)
	{
		int
			value = m_pFirstFree->GetValue() + 1;
		CIdentifiedItem<T*>
			*next = static_cast<CIdentifiedItem<T*>*>(m_pFirstFree->GetNext()),
			*pItem = new CIdentifiedItem<T*>(data, next, m_pFirstFree, value, NULL);
		if (pItem)
		{
			m_pFirstFree->SetNext(pItem);
			next->SetLast(pItem);
			if (next->GetValue() == value + 1)
			{
				m_pFirstFree = m_pFirstFree->GetNextGap();
			}
			else
			{
				pItem->SetNextGap(m_pFirstFree->GetNextGap());
				m_pFirstFree = pItem;
			}
			return value;
		}
	}
	return 0;
}

template <class T>
void CIdentifiedList<T>::Remove(T *data)
{
	RemoveInternal(static_cast<CIdentifiedItem<T*>*>(Find(data)), false);
}

template <class T>
void CIdentifiedList<T>::RemoveInternal(CIdentifiedItem<T*> *list, bool del)
{
	if (list)
	{
		if (list == m_pFirstFree)
		{
			m_pFirstFree = static_cast<CIdentifiedItem<T*>*>(list->GetLast());
			m_pFirstFree->SetNextGap(list->GetNextGap());
		}
		else
		{
			int
				value = list->GetValue(),
				nv = m_pFirstFree->GetValue();
			if (value < nv)
			{
				CIdentifiedItem<T*>
					*last = static_cast<CIdentifiedItem<T*>*>(list->GetLast());
				last->SetNextGap(m_pFirstFree);
				m_pFirstFree = last;
			}
			else
			{
				CIdentifiedItem<T*>
					*last = NULL,
					*next = m_pFirstFree;
				while (next->GetValue() < value)
				{
					last = next;
					next = next->GetNextGap();
				}
				if (next->GetValue() == value)
				{
					next = list->GetNextGap();
				}
				else
				{
					next = last->GetNextGap();
				}
				static_cast<CIdentifiedItem<T*>*>(list->GetLast())->SetNextGap(next);
				last->SetNextGap(static_cast<CIdentifiedItem<T*>*>(list->GetLast()));
			}
		}
		Extract(list);
		if (del)
		{
			delete list->GetData();
		}
		delete list;
	}
}

template <class T>
void CIdentifiedList<T>::DeleteAt(int value)
{
	RemoveInternal(static_cast<CIdentifiedItem<T*>*>(GetAt(value)), true);
}

template <class T>
void CIdentifiedList<T>::RemoveCurrent()
{
	CLinkedItem<T*>
		*last = GetCurrent()->GetLast();
	RemoveInternal(static_cast<CIdentifiedItem<T*>*>(GetCurrent()), false);
	SetCurrent(last);
}

template <class T>
void CIdentifiedList<T>::DeleteCurrent()
{
	CLinkedItem<T*>
		*last = GetCurrent()->GetLast();
	RemoveInternal(static_cast<CIdentifiedItem<T*>*>(GetCurrent()), true);
	SetCurrent(last);
}
