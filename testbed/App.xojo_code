#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // MathsKit.Initialise
		  // 
		  // Using MathsKit
		  // 
		  // Var a As Int64 = ShiftRightSigned(-2, 1)
		  // Var b As Int64 = ShiftRightSigned(0, 1)
		  // Var c As Int64 = ShiftRightSigned(-1, 1)
		  // Var d As Int64 = ShiftRightSigned(1, 1)
		  // Var e As Int64 = ShiftRightSigned(100, 1)
		  // Var f As Int64 = ShiftRightSigned(-2147483648, 1)
		  // Var g As Int64 = ShiftRightSigned(2147483647, 1)
		  // 
		  // Var h As Int64 = ShiftRightSigned(-2147483999, 1)
		  // Var i As Int64 = ShiftRightSigned(2147483999, 1)
		  // Break
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


End Class
#tag EndClass
