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
#include "stdlib.h"

typedef struct S_CDA_DATA
{
	struct S_CDA_DATA *scdaNext;
	int iSize;
	void **vData;
} S_CDA_DATA;

template <class T>
class CDynamicArray
{
private:
	int
		m_iSize,
		m_iAssign;
	S_CDA_DATA
		*m_pFirst,
		*m_pLast;

	S_CDA_DATA* Assign(int size);
	S_CDA_DATA* Find(int *slot);
protected:
	bool
		m_bRemove;
public:
	CDynamicArray(int iSize);
	~CDynamicArray();
	
	T* Get(int pos);
	int Set(int pos, T *data);
	void SetRemove(bool set) { m_bRemove = set; };
};

template <class T>
CDynamicArray<T>::CDynamicArray(int iSize)
{
	m_iSize = 0;
	m_pFirst = Assign(iSize);
	m_pLast = m_pFirst;
	if (m_pFirst)
	{
		m_pFirst->iSize = iSize;
		m_iSize = iSize;
		m_iAssign = iSize;
	}
	m_bRemove = true;
}

template <class T>
CDynamicArray<T>::~CDynamicArray()
{
	S_CDA_DATA
		*cur = m_pFirst,
		*next;
	while (cur)
	{
		next = cur->scdaNext;
		if (m_bRemove)
		{
			int
				size = cur->iSize;
			while (size--)
			{
				if (*((T **)&cur->vData + size))
				{
					delete *((T **)&cur->vData + size);
				}
			}
		}
		free(cur);
		cur = next;
	}
}

// Assigns memory to hold new data.
// If the requested memory can't be assigned it tries less
// If the memory can be assigned it doubles the amount for next time
template <class T>
S_CDA_DATA* CDynamicArray<T>::Assign(int size)
{
	return (S_CDA_DATA *)calloc(1, (sizeof (S_CDA_DATA) - sizeof (void *)) + (size * sizeof (T *)));
}

template <class T>
T* CDynamicArray<T>::Get(int pos)
{
	S_CDA_DATA
		*next = Find(&pos);
	if (next)
	{
		return *((T **)&next->vData + pos);
	}
	return NULL;
}

template <class T>
int CDynamicArray<T>::Set(int pos, T *data)
{
	if (pos >= m_iSize)
	{
		int
			ass = ((pos - m_iSize) * 2) + 1;
		if (ass < m_iAssign)
		{
			ass = m_iAssign;
		}
		else
		{
			m_iAssign = ass;
		}
		m_iAssign *= 2;
		S_CDA_DATA
			*next = Assign(ass);
		if (next)
		{
			pos -= m_iSize;
			next->iSize = ass;
			m_iSize += ass;
			m_pLast->scdaNext = next;
			m_pLast = next;
			next->scdaNext = NULL;
			*((T **)&next->vData + pos) = data;
			return 1;
		}
	}
	else
	{
		S_CDA_DATA
			*next = Find(&pos);
		if (next)
		{
			*((T **)&next->vData + pos) = data;
			return 1;
		}
	}
	return 0;
}

template <class T>
S_CDA_DATA* CDynamicArray<T>::Find(int *slot)
{
	int
		pos = *slot;
	if (pos >= m_iSize)
	{
		return NULL;
	}
	S_CDA_DATA
		*next = m_pFirst;
	while (next)
	{
		if (pos < next->iSize)
		{
			*slot = pos;
			return next;
		}
		pos -= next->iSize;
		next = next->scdaNext;
	}
	return NULL;
}
