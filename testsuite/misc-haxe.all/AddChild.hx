#include "check.as"

// Class must be named with the PP prefix, as that's the name the
// file passed to haxe will have after the preprocessing step
class PP_AddChild {
	static function main()
	{
		var tf = new flash.text.TextField();
		var tf2 = flash.Lib.current.addChild(tf);
		check_equals(tf, tf2);
		var tf3 = flash.Lib.current.addChild(tf);
		check_equals(tf, tf3);
		check_equals(tf2, tf3);

		var tf4 = flash.Lib.current.addChildAt(tf, 0);
		check_equals(tf4, tf);

		var tf5 = flash.Lib.current.addChildAt(tf, 0);
		check_equals(tf5, tf);
		check_equals(tf5, tf2);
		check_equals(tf5, tf3);
		check_equals(tf5, tf4);

		var tf6 = flash.Lib.current.addChildAt(tf, 1);
		check_equals(tf6, tf);
		check_equals(tf6, tf5);
		var tf7 = flash.Lib.current.addChildAt(tf, 1);
		check_equals(tf7, tf);
		check_equals(tf7, tf6);
		check_equals(tf7, tf5);

		// TODO: check depths, add a MovieClip child,
		//       find a way to do some checks on the
		//	 actual stage content !

                // Check number of tests run (for consistency)
		check_totals(13);

        // Call this after finishing all tests. It prints out the totals.
        Dejagnu.done();

	}
}
