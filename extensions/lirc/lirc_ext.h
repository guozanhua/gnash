// 
//   Copyright (C) 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
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

#ifndef __LIRC_PLUGIN_H__
#define __LIRC_PLUGIN_H__

#ifdef HAVE_CONFIG_H
#include "gnashconfig.h"
#endif

#include <memory> // for auto_ptr
#include "as_object.h"

namespace gnash
{

extern "C" {
    void lirc_class_init(as_object &obj);  
    /// Return an  instance
}

std::auto_ptr<as_object> init_lirc_instance();

} // end of gnash namespace

// __LIRC_PLUGIN_H__
#endif

// Local Variables:
// mode: C++
// indent-tabs-mode: t
// End:
