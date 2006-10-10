#ifndef _CHECK_H_
#define _CHECK_H_

#include <dejagnu.h>
#include <sstream>
#include <string>

TestState _runtest;

#define check_equals_label(label, expr, expected) \
	{ \
		std::stringstream ss; \
		if ( label != "" ) ss << label << ": "; \
		if ( expr == expected ) \
		{ \
			ss << #expr << " == " << expected; \
			ss << " [" << __FILE__ << ":" << __LINE__ << "]"; \
			_runtest.pass(ss.str().c_str()); \
		} \
		else \
		{ \
			ss << #expr << " == '" << expr << "' (expected: " \
				<< expected << ")"; \
			ss << " [" << __FILE__ << ":" << __LINE__ << "]"; \
			_runtest.fail(ss.str().c_str()); \
		} \
	}

#define check_equals(expr, expected) check_equals_label("", expr, expected)

#define check(expr) \
	{ \
		std::stringstream ss; \
		ss << #expr; \
		ss << " [" << __FILE__ << ":" << __LINE__ << "]"; \
		if ( expr ) { \
			_runtest.pass(ss.str().c_str()); \
		} else { \
			_runtest.fail(ss.str().c_str()); \
		} \
	}

#endif // _CHECK_H_
