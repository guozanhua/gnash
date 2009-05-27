// CapsStyle_as.h:  ActionScript 3 "CapsStyle" class, for Gnash.
//
//   Copyright (C) 2009 Free Software Foundation, Inc.
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

#ifndef GNASH_ASOBJ3_CAPSSTYLE_H
#define GNASH_ASOBJ3_CAPSSTYLE_H

#ifdef HAVE_CONFIG_H
#include "gnashconfig.h"
#endif

#include "fn_call.h"

// Forward declarations
class as_object;

namespace gnash {
namespace {
    as_object* getCapsStyleInterface();
}

class CapsStyle_as: public as_object
{

public:

    CapsStyle_as()
        :
        as_object(getCapsStyleInterface())
    {}

};

/// Initialize the global CapsStyle class
void capsstyle_class_init(as_object& global);

} // gnash namespace

// GNASH_ASOBJ3_CAPSSTYLE_H
#endif

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:
