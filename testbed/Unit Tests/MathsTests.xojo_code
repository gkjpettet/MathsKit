#tag Class
Protected Class MathsTests
Inherits TestGroup
	#tag Event
		Sub Setup()
		  Prop2 = Prop2 + 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TearDown()
		  Prop2 = Prop2 - 1
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(err As RuntimeException, methodName As Text) As Boolean
		  #pragma unused err
		  
		  Const kMethodName As Text = "UnhandledException"
		  
		  If methodName.Length >= kMethodName.Length And methodName.Left(kMethodName.Length) = kMethodName Then
		    Assert.Pass("Exception was handled")
		    Return True
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BitsToDoubleTest()
		  ///
		  ' Tests the `MathsKit.BitsToDouble` method.
		  ///
		  
		  Using MathsKit
		  
		  Assert.AreEqual(3.338742E-317, BitsToDouble(6757689))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopySignTest()
		  ///
		  ' Tests the `CopySign` method.
		  ///
		  
		  Var a As Double = 34.543
		  Var b As Double = -123.44
		  
		  Assert.AreEqual(-34.543, MathsKit.CopySign(a, b))
		  Assert.AreEqual(123.44, MathsKit.CopySign(b, a))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleToBitsTest()
		  ///
		  ' Tests the `DoubleToBits` method.
		  ///
		  
		  Using MathsKit
		  
		  Var posInf As Int64 = &h7ff0000000000000
		  Var negInf As Int64 = &hfff0000000000000
		  Var notANumber As Int64 = &h7ff8000000000000
		  
		  Assert.AreEqual(posInf, DoubleToBits(POSITIVE_INFINITY), "Testing positive infinity")
		  Assert.AreEqual(negInf, DoubleToBits(NEGATIVE_INFINITY), "Testing negative infinity")
		  Assert.AreEqual(notANumber, DoubleToBits(NAN), "Testing NaN")
		  
		  Assert.AreEqual(6757689, DoubleToBits(3.338742E-317))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleToRawBitsTest()
		  ///
		  ' Tests the `DoubleToRawBits` method.
		  ///
		  
		  Using MathsKit
		  
		  Var posInf As Int64 = &h7ff0000000000000
		  Var negInf As Int64 = &hfff0000000000000
		  
		  Assert.AreEqual(posInf, DoubleToRawBits(POSITIVE_INFINITY), "Testing positive infinity")
		  Assert.AreEqual(negInf, DoubleToRawBits(NEGATIVE_INFINITY), "Testing negative infinity")
		  
		  Var NaNBits As Int64 = DoubleToRawBits(NAN)
		  Assert.IsTrue(IsNaN(BitsToDouble(NaNBits)))
		  
		  Assert.AreEqual(4612811918334230528, DoubleToRawBits(2.5))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetExponentTest()
		  ///
		  ' Tests the GetExponent method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Assert.AreEqual(8, MathsKit.GetExponent(345.65))
		  Assert.AreEqual(1024, MathsKit.GetExponent(1.0 / 0.0))
		  Assert.AreEqual(-1023, MathsKit.GetExponent(0.0))
		  Assert.AreEqual(5, MathsKit.GetExponent(50.45))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HypotTest()
		  ///
		  ' Tests the `Hypot` method.
		  ///
		  
		  #Pragma BreakOnExceptions False
		  
		  Using MathsKit
		  
		  // If either argument is infinite, then the result is positive infinity.
		  Assert.IsPositiveInfinity(Hypot(POSITIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(Hypot(4.0, POSITIVE_INFINITY))
		  Assert.IsPositiveInfinity(Hypot(NEGATIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(Hypot(4.0, NEGATIVE_INFINITY))
		  
		  // If either argument is NaN and neither argument is infinite, then the result is NaN.
		  Assert.IsNaN(Hypot(NAN, 2.0))
		  Assert.IsNaN(Hypot(6.5, NAN))
		  Assert.IsPositiveInfinity(Hypot(NAN, NEGATIVE_INFINITY))
		  
		  // When both are not infinity .
		  Assert.AreEqual(5.0, Hypot(3.0, 4.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsInfinityTest()
		  ///
		  ' Tests the `IsInfinity` method.
		  ///
		  
		  Assert.IsTrue(MathsKit.IsInfinite(1.0/0.0))
		  Assert.IsFalse(MathsKit.IsInfinite(0.0/0.0))
		  Assert.IsFalse(MathsKit.IsInfinite(3.5))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift32Test()
		  ///
		  ' Tests long = int << x
		  ///
		  
		  Assert.AreEqual(1152, MathsKit.LShift32(9, 7))
		  Assert.AreEqual(0, MathsKit.LShift32(0, 1))
		  Assert.AreEqual(2, MathsKit.LShift32(1, 1))
		  Assert.AreEqual(-2, MathsKit.LShift32(-1, 1))
		  Assert.AreEqual(-2, MathsKit.LShift32(2147483647, 1))
		  Assert.AreEqual(-32, MathsKit.LShift32(2147483647, 5))
		  Assert.AreEqual(0, MathsKit.LShift32(-2147483648, 1))
		  Assert.AreEqual(0, MathsKit.LShift32(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift64Test()
		  ///
		  ' Tests long = long << x
		  ///
		  
		  Assert.AreEqual(1152, MathsKit.LShift64(9, 7))
		  Assert.AreEqual(0, MathsKit.LShift64(0, 1))
		  Assert.AreEqual(2, MathsKit.LShift64(1, 1))
		  Assert.AreEqual(-2, MathsKit.LShift64(-1, 1))
		  Assert.AreEqual(4294967294, MathsKit.LShift64(2147483647, 1))
		  Assert.AreEqual(68719476704, MathsKit.LShift64(2147483647, 5))
		  Assert.AreEqual(-4294967296, MathsKit.LShift64(-2147483648, 1))
		  Assert.AreEqual(-549755813888, MathsKit.LShift64(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftTest()
		  ///
		  ' Tests long = int >> x
		  ///
		  
		  // Values that fit into an Int32.
		  Var a As Int64 = MathsKit.RShift(-2, 1)
		  Var b As Int64 = MathsKit.RShift(0, 1)
		  Var c As Int64 = MathsKit.RShift(-1, 1)
		  Var d As Int64 = MathsKit.RShift(1, 1)
		  Var e As Int64 = MathsKit.RShift(100, 1)
		  Var f As Int64 = MathsKit.RShift(-2147483648, 1)
		  Var g As Int64 = MathsKit.RShift(2147483647, 1)
		  Var h As Int64 = MathsKit.RShift(2147483647, 5)
		  Var i As Int64 = MathsKit.RShift(-1, 30)
		  
		  Assert.AreEqual(-1, a)
		  Assert.AreEqual(0, b)
		  Assert.AreEqual(-1, c)
		  Assert.AreEqual(0, d)
		  Assert.AreEqual(50, e)
		  Assert.AreEqual(-1073741824, f) 
		  Assert.AreEqual(1073741823, g)
		  Assert.AreEqual(67108863, h)
		  Assert.AreEqual(-1, i)
		  
		  // Use values that would only fit in an Int64.
		  Var j As Int64 = MathsKit.RShift(2147483999, 1)
		  Var k As Int64 = MathsKit.RShift(-2147483999, 30)
		  
		  Assert.AreEqual(1073741999, j)
		  Assert.AreEqual(-3, k)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftU32Test()
		  ///
		  ' Tests long = int >>> x
		  ///
		  
		  Var a As Int64 = MathsKit.RShiftU32(-2, 1) ' -2 >>> 1
		  Var b As Int64 = MathsKit.RShiftU32(0, 1) ' 0 >>> 1
		  Var c As Int64 = MathsKit.RShiftU32(-1, 1) ' -1 >>> 1
		  Var d As Int64 = MathsKit.RShiftU32(1, 1) ' 1 >>> 1
		  Var e As Int64 = MathsKit.RShiftU32(100, 1) ' 100 >>> 1
		  Var f As Int64 = MathsKit.RShiftU32(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = MathsKit.RShiftU32(2147483647, 1) ' 2147483647 >>> 1
		  
		  Assert.AreEqual(2147483647, a)
		  Assert.AreEqual(0, b)
		  Assert.AreEqual(2147483647, c)
		  Assert.AreEqual(0, d)
		  Assert.AreEqual(50, e)
		  Assert.AreEqual(1073741824, f)
		  Assert.AreEqual(1073741823, g)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftU64Test()
		  ///
		  ' Tests long = long >>> x
		  ///
		  
		  Var a As Int64 = MathsKit.RShiftU64(-2, 1) ' -2 >>> 1
		  Var b As Int64 = MathsKit.RShiftU64(0, 1) ' 0 >>> 1
		  Var c As Int64 = MathsKit.RShiftU64(-1, 1) ' -1 >>> 1
		  Var d As Int64 = MathsKit.RShiftU64(1, 1) ' 1 >>> 1
		  Var e As Int64 = MathsKit.RShiftU64(100, 1) ' 100 >>> 1
		  Var f As Int64 = MathsKit.RShiftU64(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = MathsKit.RShiftU64(2147483647, 1) ' 2147483647 >>> 1
		  Var h As Int64 = MathsKit.RShiftU64(2147483999, 1) ' 2147483999 >>> 1
		  
		  Assert.AreEqual(9223372036854775807, a)
		  Assert.AreEqual(0, b)
		  Assert.AreEqual(9223372036854775807, c)
		  Assert.AreEqual(0, d)
		  Assert.AreEqual(50, e)
		  Assert.AreEqual(9223372035781033984, f)
		  Assert.AreEqual(1073741823, g)
		  Assert.AreEqual(1073741999, h)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScalbTest()
		  ///
		  ' Tests the Scalb method.
		  ///
		  
		  Assert.AreEqual(13342.72, MathsKit.Scalb(52.12, 8))
		  Assert.AreEqual(2.0, MathsKit.Scalb(2, 0))
		  Assert.AreEqual(0.0, MathsKit.Scalb(0, 2))
		  Assert.AreEqual(16.0, MathsKit.Scalb(2, 3))     
		  Assert.AreEqual(-96.0, MathsKit.Scalb(-3, 5))
		  Assert.AreEqual(0.1875, MathsKit.Scalb(3, -4))
		  Assert.AreEqual(-0.5, MathsKit.Scalb(-2, -2))
		  Assert.AreEqual(175.4656, MathsKit.Scalb(10.9666, 4))
		  Assert.AreEqual(-75.792, MathsKit.Scalb(-9.474, 3))
		  Assert.AreEqual(1.833425, MathsKit.Scalb(14.6674, -3))
		  Assert.AreEqual(-0.2341640625, MathsKit.Scalb(-14.9865, -6))
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
