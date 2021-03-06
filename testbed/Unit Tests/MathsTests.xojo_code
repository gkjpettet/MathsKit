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
		  Assert.AreEqual(3.338742E-317, BitsToDouble(6757689))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClampTest()
		  Assert.IsTrue(MathsKit.Clamp(10, 0, 20) = 10)
		  Assert.IsTrue(MathsKit.Clamp(-1, 0, 20) = 0)
		  Assert.IsTrue(MathsKit.Clamp(-1.34, -5, 1) = -1.34)
		  Assert.IsTrue(MathsKit.Clamp(-4.5, -2.1, 15) = -2.1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CompareTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopySignTest()
		  Var a As Double = 34.543
		  Var b As Double = -123.44
		  
		  Assert.AreEqual(-34.543, CopySign(a, b))
		  Assert.AreEqual(123.44, CopySign(b, a))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CubeRootTest()
		  Assert.IsPositiveInfinity(MathsKit.CubeRoot(1.0/0.0))
		  Assert.IsNegativeInfinity(MathsKit.CubeRoot(-1.0/0.0))
		  Assert.AreEqual(0.0, MathsKit.CubeRoot(0.0))
		  Assert.AreEqual(-0.0, MathsKit.CubeRoot(-0.0))
		  Assert.AreEqual(5.0, MathsKit.CubeRoot(125.0))
		  Assert.AreEqual(9.0, MathsKit.CubeRoot(729))
		  Assert.AreEqual(10.727636943228317, MathsKit.CubeRoot(1234.56))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleMaxExponentTest()
		  Assert.AreEqual(GetExponent(DOUBLE_MAX_VALUE), DOUBLE_MAX_EXPONENT)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleMinExponentTest()
		  Assert.AreEqual(GetExponent(DOUBLE_MIN_NORMAL), DOUBLE_MIN_EXPONENT)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleToBitsTest()
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
		  Var posInf As Int64 = &h7ff0000000000000
		  Var negInf As Int64 = &hfff0000000000000
		  
		  Assert.AreEqual(posInf, DoubleToRawBits(POSITIVE_INFINITY), "Testing positive infinity")
		  Assert.AreEqual(negInf, DoubleToRawBits(NEGATIVE_INFINITY), "Testing negative infinity")
		  
		  Var NaNBits As Int64 = DoubleToRawBits(NAN)
		  Assert.IsTrue(BitsToDouble(NaNBits).IsNotANumber)
		  
		  Assert.AreEqual(4612811918334230528, DoubleToRawBits(2.5))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetExponentTest()
		  #Pragma BreakOnExceptions False
		  
		  Assert.AreEqual(8, GetExponent(345.65))
		  Assert.AreEqual(1024, GetExponent(1.0 / 0.0))
		  Assert.AreEqual(-1023, GetExponent(0.0))
		  Assert.AreEqual(5, GetExponent(50.45))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HypotenuseTest()
		  #Pragma BreakOnExceptions False
		  
		  // If either argument is infinite, then the result is positive infinity.
		  Assert.IsPositiveInfinity(MathsKit.Hypotenuse(POSITIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(MathsKit.Hypotenuse(4.0, POSITIVE_INFINITY))
		  Assert.IsPositiveInfinity(MathsKit.Hypotenuse(NEGATIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(MathsKit.Hypotenuse(4.0, NEGATIVE_INFINITY))
		  
		  // If either argument is NaN and neither argument is infinite, then the result is NaN.
		  Assert.IsNaN(MathsKit.Hypotenuse(NAN, 2.0))
		  Assert.IsNaN(MathsKit.Hypotenuse(6.5, NAN))
		  Assert.IsPositiveInfinity(MathsKit.Hypotenuse(NAN, NEGATIVE_INFINITY))
		  
		  // When both are not infinity .
		  Assert.AreEqual(5.0, MathsKit.Hypotenuse(3.0, 4.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsCloseToTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsEvenTest()
		  Assert.IsTrue(MathsKit.IsEven(-4))
		  Assert.IsTrue(MathsKit.IsEven(-2))
		  Assert.IsTrue(MathsKit.IsEven(0))
		  Assert.IsTrue(MathsKit.IsEven(2))
		  Assert.IsTrue(MathsKit.IsEven(4))
		  
		  Assert.IsFalse(MathsKit.IsEven(-3))
		  Assert.IsFalse(MathsKit.IsEven(-1))
		  Assert.IsFalse(MathsKit.IsEven(1))
		  Assert.IsFalse(MathsKit.IsEven(3))
		  Assert.IsFalse(MathsKit.IsEven(5))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsInfinityTest()
		  Var d1 As Double = 1.0/0.0
		  Var d2 As Double = 0.0/0.0
		  Var d3 As Double = 3.5
		  Assert.IsTrue(d1.IsInfinite)
		  Assert.IsFalse(d2.IsInfinite)
		  Assert.IsFalse(d3.IsInfinite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsIntegerTest()
		  Assert.IsTrue(MathsKit.IsInteger(10))
		  Assert.IsTrue(MathsKit.IsInteger(12345))
		  Assert.IsTrue(MathsKit.IsInteger(-5))
		  Assert.IsTrue(MathsKit.IsInteger(0))
		  
		  Assert.IsFalse(MathsKit.IsInteger(0.1))
		  Assert.IsFalse(MathsKit.IsInteger(22.5))
		  Assert.IsFalse(MathsKit.IsInteger(-1.234))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsNaNTest()
		  Var d As Double = 0.0/0.0
		  Assert.IsTrue(d.IsNotANumber)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsOddTest()
		  Assert.IsTrue(MathsKit.IsOdd(-3))
		  Assert.IsTrue(MathsKit.IsOdd(-1))
		  Assert.IsTrue(MathsKit.IsOdd(1))
		  Assert.IsTrue(MathsKit.IsOdd(3))
		  Assert.IsTrue(MathsKit.IsOdd(5))
		  
		  Assert.IsFalse(MathsKit.IsOdd(-4))
		  Assert.IsFalse(MathsKit.IsOdd(-2))
		  Assert.IsFalse(MathsKit.IsOdd(0))
		  Assert.IsFalse(MathsKit.IsOdd(2))
		  Assert.IsFalse(MathsKit.IsOdd(4))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsZeroTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LerpTest()
		  Assert.IsTrue(MathsKit.Lerp(0, 100, 0.5) = 50)
		  Assert.IsTrue(MathsKit.Lerp(20, 80, 0) = 20)
		  Assert.IsTrue(MathsKit.Lerp(30, 5, 1) = 5)
		  Assert.IsTrue(MathsKit.Lerp(-1, 1, 0.5) = 0)
		  Assert.IsTrue(MathsKit.Lerp(0.5, 1, 0.5) = 0.75)
		  Assert.IsTrue(MathsKit.Lerp(-16.0e30, 16.0, 1.0) = 16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift32Test()
		  // Equivalent to `long = int << x`.
		  
		  Assert.AreEqual(1152, LShift32(9, 7))
		  Assert.AreEqual(0, LShift32(0, 1))
		  Assert.AreEqual(2, LShift32(1, 1))
		  Assert.AreEqual(-2, LShift32(-1, 1))
		  Assert.AreEqual(-2, LShift32(2147483647, 1))
		  Assert.AreEqual(-32, LShift32(2147483647, 5))
		  Assert.AreEqual(0, LShift32(-2147483648, 1))
		  Assert.AreEqual(0, LShift32(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift64Test()
		  // Equivalent to `long = long << x`.
		  
		  Assert.AreEqual(1152, LShift64(9, 7))
		  Assert.AreEqual(0, LShift64(0, 1))
		  Assert.AreEqual(2, LShift64(1, 1))
		  Assert.AreEqual(-2, LShift64(-1, 1))
		  Assert.AreEqual(4294967294, LShift64(2147483647, 1))
		  Assert.AreEqual(68719476704, LShift64(2147483647, 5))
		  Assert.AreEqual(-4294967296, LShift64(-2147483648, 1))
		  Assert.AreEqual(-549755813888, LShift64(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ModuloTest()
		  Assert.IsTrue(MathsKit.Modulo(5, 20) = 5)
		  Assert.IsTrue(MathsKit.Modulo(20, 20) = 0)
		  Assert.IsTrue(MathsKit.Modulo(22, 20) = 2)
		  Assert.IsTrue(MathsKit.Modulo(-2, 20) = 18)
		  Assert.IsTrue(MathsKit.Modulo(-1, 20) = 19)
		  Assert.IsTrue(MathsKit.Modulo(0, 20) = 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextDownTest()
		  Assert.AreEqual(-DOUBLE_MIN_VALUE, NextDown(0))
		  Assert.IsNegativeInfinity(NextDown(NEGATIVE_INFINITY))
		  Assert.IsNaN(NextDown(NAN))
		  Assert.AreEqual(23.439999999999998, NextDown(23.44))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextUpTest()
		  Assert.IsPositiveInfinity(NextUp(POSITIVE_INFINITY))
		  Assert.AreEqual(-1.7976931348623157e308, NextUp(NEGATIVE_INFINITY))
		  Assert.IsNaN(NextUp(NAN))
		  Assert.AreEqual(69.19000000000001, NextUp(69.19))
		  Assert.AreEqual(1.4e-45, NextUp(0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfLeadingZerosTest()
		  Assert.AreEqual(64, NumberOfLeadingZeros(0))
		  Assert.AreEqual(56, NumberOfLeadingZeros(210))
		  Assert.AreEqual(52, NumberOfLeadingZeros(2234))
		  
		  Assert.AreEqual(0, NumberOfLeadingZeros(-1))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfTrailingZerosTest()
		  Assert.AreEqual(0, NumberOfTrailingZeros(-1))
		  Assert.AreEqual(64, NumberOfTrailingZeros(0))
		  Assert.AreEqual(2, NumberOfTrailingZeros(100))
		  Assert.AreEqual(1, NumberOfTrailingZeros(99946))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PointInTriangleTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RandomTest()
		  Const iterations = 1000
		  Var encountered As New Dictionary
		  
		  For i As Integer = 1 To iterations
		    Var result As Double = MathsKit.Random(-1, 1)
		    
		    Assert.IsFalse(encountered.HasKey(result), "Number already generated")
		    
		    Assert.IsTrue(result >= -1 And result <= 1, "Number out of range")
		    
		    encountered.Value(result) = True
		  Next i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftTest()
		  // Equivalent to `long = int >> x`.
		  
		  // Values that fit into an Int32.
		  Var a As Int64 = RShift(-2, 1)
		  Var b As Int64 = RShift(0, 1)
		  Var c As Int64 = RShift(-1, 1)
		  Var d As Int64 = RShift(1, 1)
		  Var e As Int64 = RShift(100, 1)
		  Var f As Int64 = RShift(-2147483648, 1)
		  Var g As Int64 = RShift(2147483647, 1)
		  Var h As Int64 = RShift(2147483647, 5)
		  Var i As Int64 = RShift(-1, 30)
		  
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
		  Var j As Int64 = RShift(2147483999, 1)
		  Var k As Int64 = RShift(-2147483999, 30)
		  
		  Assert.AreEqual(1073741999, j)
		  Assert.AreEqual(-3, k)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftU32Test()
		  // Equivalent to `long = int >>> x`.
		  
		  Var a As Int64 = RShiftU32(-2, 1) ' -2 >>> 1
		  Var b As Int64 = RShiftU32(0, 1) ' 0 >>> 1
		  Var c As Int64 = RShiftU32(-1, 1) ' -1 >>> 1
		  Var d As Int64 = RShiftU32(1, 1) ' 1 >>> 1
		  Var e As Int64 = RShiftU32(100, 1) ' 100 >>> 1
		  Var f As Int64 = RShiftU32(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = RShiftU32(2147483647, 1) ' 2147483647 >>> 1
		  
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
		  // Equivalent to `long = long >>> x`.
		  
		  Var a As Int64 = RShiftU64(-2, 1) ' -2 >>> 1
		  Var b As Int64 = RShiftU64(0, 1) ' 0 >>> 1
		  Var c As Int64 = RShiftU64(-1, 1) ' -1 >>> 1
		  Var d As Int64 = RShiftU64(1, 1) ' 1 >>> 1
		  Var e As Int64 = RShiftU64(100, 1) ' 100 >>> 1
		  Var f As Int64 = RShiftU64(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = RShiftU64(2147483647, 1) ' 2147483647 >>> 1
		  Var h As Int64 = RShiftU64(2147483999, 1) ' 2147483999 >>> 1
		  
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
		  Assert.AreEqual(13342.72, Scalb(52.12, 8))
		  Assert.AreEqual(2.0, Scalb(2, 0))
		  Assert.AreEqual(0.0, Scalb(0, 2))
		  Assert.AreEqual(16.0, Scalb(2, 3))     
		  Assert.AreEqual(-96.0, Scalb(-3, 5))
		  Assert.AreEqual(0.1875, Scalb(3, -4))
		  Assert.AreEqual(-0.5, Scalb(-2, -2))
		  Assert.AreEqual(175.4656, Scalb(10.9666, 4))
		  Assert.AreEqual(-75.792, Scalb(-9.474, 3))
		  Assert.AreEqual(1.833425, Scalb(14.6674, -3))
		  Assert.AreEqual(-0.2341640625, Scalb(-14.9865, -6))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SignumTest()
		  Assert.AreEqual(1.0, Signum(30))
		  Assert.AreEqual(0.0, Signum(0))
		  Assert.AreEqual(-1.0, Signum(-30))
		  
		  Assert.AreEqual(1.0, Signum(0.0000000583050001))
		  Assert.AreEqual(1.0, Signum(0.000000018984))
		  Assert.AreEqual(1.0, Signum(0.0000000007270001))
		  
		  Assert.AreEqual(1.0, Signum(0.0000000000000003))
		  
		  // NaNs
		  Assert.IsNaN(Signum(0.0/0.0))
		  Assert.IsNaN(Signum(Sqrt(-1)))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToDegreesTest()
		  Assert.AreEqual(2578.3100780887044, ToDegrees(45))
		  Assert.AreEqual(1718.8733853924698, ToDegrees(30))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToRadiansTest()
		  Assert.AreEqual(3.141592653589793, ToRadians(180))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Vector2Tests()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WrapIntegerTest()
		  Assert.AreEqual(10, MathsKit.WrapInteger(10, 20))
		  Assert.AreEqual(20, MathsKit.WrapInteger(20, 20))
		  Assert.AreEqual(0, MathsKit.WrapInteger(0, 20))
		  Assert.AreEqual(1, MathsKit.WrapInteger(21, 20))
		  Assert.AreEqual(19, MathsKit.WrapInteger(39, 20))
		  Assert.AreEqual(20, MathsKit.WrapInteger(40, 20))
		  Assert.AreEqual(1, MathsKit.WrapInteger(41, 20))
		  Assert.AreEqual(19, MathsKit.WrapInteger(-1, 20))
		  Assert.AreEqual(18, MathsKit.WrapInteger(-2, 20))
		  Assert.AreEqual(0, MathsKit.WrapInteger(-20, 20))
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Prop1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Prop2 As Integer
	#tag EndProperty


	#tag Using, Name = MathsKit
	#tag EndUsing


	#tag ViewBehavior
		#tag ViewProperty
			Name="Duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FailedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IncludeGroup"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NotImplementedCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PassedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkippedTestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StopTestOnFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TestCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
