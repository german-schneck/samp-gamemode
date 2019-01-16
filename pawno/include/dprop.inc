/*
 *            DProp functions 1.0
 *       (c) Copyright 2006 by DracoBlue
 *
 * @author    : DracoBlue (http://dracoblue.com)
 * @date      : 17th June 2006
 * @update    : 17th June 2006
 *
 * This file is provided as is (no warranties).
 *
 */

#if defined _dprop_included
  #endinput
#endif

#define _dprop_included
#pragma library dprop


/**
 *  Checks if a property is Exists
 *  @param   name
 */
public PropertyExists(name[]) {
  if (existproperty(0, "",dprop_PRIVATE_hash(name))) return true;
  return false;
}

/**
 *  Returns the value of a property
 *  @param   name
 */
public PropertyGet(name[]) {
  new value[255];
  getproperty(0, "", dprop_PRIVATE_hash(name), value);
  strunpack(value,value);
  return value;
}

/**
 *  Sets the value of a property
 *  @param   name
 */
public PropertySet(name[],value[]) {
  setproperty(0, "", dprop_PRIVATE_hash(name), value);
}

/*
 *  This function is private, and used for internal
 *  calculation of the hashvalue
 */

dprop_PRIVATE_hash(buf[]) {
    new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}