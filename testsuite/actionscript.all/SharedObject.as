// 
//   Copyright (C) 2005, 2006, 2007 Free Software Foundation, Inc.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//

// Test case for SharedObject ActionScript class
// compile this test case with Ming makeswf, and then
// execute it like this gnash -1 -r 0 -v out.swf

rcsid="$Id: SharedObject.as,v 1.13 2007/12/20 21:14:39 rsavoye Exp $";

#include "check.as"

var sharedobjectObj = new SharedObject;

#if OUTPUT_VERSION < 6

// test the SharedObject constuctor
xcheck_equals (typeof(sharedobjectObj), 'object');

// test the SharedObject::getlocal method
check_equals (typeof(sharedobjectObj.getLocal), 'undefined');
xcheck_equals (typeof(SharedObject.getLocal), 'function');

#else // OUTPUT_VERSION >= 6

// test the SharedObject constuctor
check_equals (typeof(sharedobjectObj), 'object');

// test the SharedObject::clear method
check_equals (typeof(sharedobjectObj.clear), 'function');
// test the SharedObject::flush method
check_equals (typeof(sharedobjectObj.flush), 'function');

// test the SharedObject::getlocal method
check_equals (typeof(sharedobjectObj.getLocal), 'undefined');
check_equals (typeof(SharedObject.getLocal), 'function');

// test the SharedObject::getsize method
check_equals (typeof(sharedobjectObj.getSize), 'function');


// FIXME: Test code that will soon be a formal test case.
// so = SharedObject.getLocal("settings");

// // Private data
// so.name = "Joe";
// so.age = 20;
// so.pet = "Dog";

// // public data that gets written
// so.data.gain = 50.0;
// so.data.echosuppression = false;
// so.data.defaultmicrophone = "/dev/input/mic";
// so.data.defaultcamera = "";
// so.data.defaultklimit = 100.0;
// so.data.defaultalways = false;
// so.data.crossdomainAllow = true;
// so.data.crossdomainAlways = true;
// so.data.allowThirdPartyLSOAccess = true;
// so.data.localSecPath = "";
// so.data.localSecPathTime = 1.19751160683e+12;

// trace(so.getSize());
// so.flush();

newso = SharedObject.getLocal("settingsXXX");
check_equals (typeof(newso), 'object');
trace(newso.getSize());
check_equals (newso.getSize(), 11);

if (typeof(newso.data) != 'undefined') {
    trace("New Shared Object, checking data...");
    check_equals (typeof(newso.data.gain), 'number');
    check_equals (newso.data.gain, 50.0);
    check_equals (typeof(newso.data.echosuppression), 'boolean');
    check_equals (newso.data.echosuppression, false);
    check_equals (typeof(newso.data.defaultmicrophone), 'string');
    check_equals (newso.data.defaultmicrophone, "/dev/input/mic");
    check_equals (typeof(newso.data.defaultcamera), 'string');
    check_equals (newso.data.defaultcamera,  'undefined');
    check_equals (typeof(newso.data.defaultklimit), 'number');
    check_equals (newso.data.defaultklimit, 100.0);
    check_equals (typeof(newso.data.defaultalways), 'boolean');
    check_equals (newso.data.defaultalways, false);

    // FIXME: why did all these start failing ? Accoring to dump() they
    // all still exist.
    xcheck_equals (typeof(newso.data.crossdomainAllow), 'boolean');
    xcheck_equals (newso.data.crossdomainAllow, true);
    xcheck_equals (typeof(newso.data.crossdomainAlways), 'boolean');
    xcheck_equals (newso.data.crossdomainAlways, true);
    xcheck_equals (typeof(newso.data.allowThirdPartyLSOAccess), 'boolean');
    xcheck_equals (newso.data.allowThirdPartyLSOAccess, true);
    xcheck_equals (typeof(newso.data.localSecPath), 'string');
    xcheck_equals (newso.data.localSecPath, 'undefined');
    xcheck_equals (typeof(newso.data.localSecPathTime), 'number');
    xcheck_equals (newso.data.localSecPathTime, 1.19751160683e+12);
} else {
    trace("New Shared Object doesn't exist!");
}


#endif // OUTPUT_VERSION >= 6
totals();
