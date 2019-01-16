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
#include "../main.h"

#ifndef foreach
	#define foreach(m,n) \
		for (m->Start(); n = m->Next(); )
#endif

template <class T>
class CLinkedList
{
private:
	CLinkedItem<T*>
		*m_pFirst,
		*m_pCurrent;
protected:
	bool
		m_bRemove;
	inline CLinkedItem<T*>* GetFirst() { return m_pFirst; };
	inline void SetFirst(CLinkedItem<T*>* first) { m_pFirst = first; };
	void Init();
	CLinkedItem<T*>* Find(T *data);
	void Extract(CLinkedItem<T*> *list);
	CLinkedItem<T*>* GetCurrent() { return m_pCurrent; };
	void SetCurrent(CLinkedItem<T*>* cur) { m_pCurrent = cur; };
public:
	CLinkedList();
	~CLinkedList();

	T* Next();
	T* Last();
	virtual int Add(T *data);
	inline void Start() { m_pCurrent = m_pFirst; };
	virtual void Remove(T *data);
	void Delete(T *data);
	void SetRemove(bool set) { m_bRemove = set; };
	virtual void DeleteCurrent();
	virtual void RemoveCurrent();
	bool IsEmpty() { return m_pFirst->GetNext() == m_pFirst; };
};

template <class T>
CLinkedList<T>::CLinkedList()
{
	SetFirst(new CLinkedItem<T*>(NULL, NULL, NULL));
	Init();
}

template <class T>
void CLinkedList<T>::Init()
{
	if (GetFirst())
	{
		Start();
		GetFirst()->SetNext(GetFirst());
		GetFirst()->SetLast(GetFirst());
	}
	else
	{
		m_pCurrent = NULL;
	}
	m_bRemove = true;
}

template <class T>
CLinkedList<T>::~CLinkedList()
{
	if (GetFirst())
	{
		CLinkedItem<T*>
			*next = GetFirst()->GetNext(),
			*cur;
		while (next->GetData())
		{
			cur = next;
			next = cur->GetNext();
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

template <class T>
CLinkedItem<T*>* CLinkedList<T>::Find(T *data)
{
	if (GetFirst())
	{
		CLinkedItem<T*>
			*next = GetFirst()->GetNext();
		while (next->GetData())
		{
			if (next->GetData() == data)
			{
				return next;
			}
			next = next->GetNext();
		}
	}
	return NULL;
}

template <class T>
void CLinkedList<T>::Extract(CLinkedItem<T*> *list)
{
	if (list)
	{
		CLinkedItem<T*>
			*last = list->GetLast(),
			*next = list->GetNext();
		last->SetNext(next);
		next->SetLast(last);
	}
}

template <class T>
void CLinkedList<T>::Remove(T *data)
{
	CLinkedItem<T*>
		*list = Find(data);
	Extract(list);
	delete list;
}

template <class T>
void CLinkedList<T>::Delete(T *data)
{
	CLinkedItem<T*>
		*list = Find(data);
	if (list)
	{
		Extract(list);
		delete list->GetData();
		delete list;
	}
}

template <class T>
int CLinkedList<T>::Add(T *data)
{
	if (GetFirst())
	{
		CLinkedItem<T*>
			*pLast = GetFirst()->GetLast(),
			*pItem = new CLinkedItem<T*>(data, GetFirst(), pLast);
		if (pItem && pLast)
		{
			GetFirst()->SetLast(pItem);
			pLast->SetNext(pItem);
			return 1;
		}
	}
	return 0;
}

template <class T>
T* CLinkedList<T>::Next()
{
//	if (m_pCurrent)
//	{
		m_pCurrent = m_pCurrent->GetNext();
//		if (m_pCurrent)
//		{
			return m_pCurrent->GetData();
//		}
//	}
//	return NULL;
}

template <class T>
T* CLinkedList<T>::Last()
{
//	if (m_pCurrent)
//	{
		m_pCurrent = m_pCurrent->GetLast();
//		if (m_pCurrent)
//		{
			return m_pCurrent->GetData();
//		}
//	}
//	return NULL;
}

template <class T>
void CLinkedList<T>::RemoveCurrent()
{
	CLinkedItem<T*>
		*last = GetCurrent()->GetLast();
	Extract(GetCurrent());
	delete GetCurrent();
	SetCurrent(last);
}

template <class T>
void CLinkedList<T>::DeleteCurrent()
{
	CLinkedItem<T*>
		*last = GetCurrent()->GetLast();
	Extract(GetCurrent());
	delete GetCurrent();
	delete GetCurrent()->GetData();
	SetCurrent(last);
}
