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
		  Assert.AreEqual(3.338742E-317, Maths.BitsToDouble(6757689))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClampTest()
		  Assert.IsTrue(Maths.Clamp(10, 0, 20) = 10)
		  Assert.IsTrue(Maths.Clamp(-1, 0, 20) = 0)
		  Assert.IsTrue(Maths.Clamp(-1.34, -5, 1) = -1.34)
		  Assert.IsTrue(Maths.Clamp(-4.5, -2.1, 15) = -2.1)
		  
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
		  
		  Assert.AreEqual(-34.543, Maths.CopySign(a, b))
		  Assert.AreEqual(123.44, Maths.CopySign(b, a))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CubeRootTest()
		  Assert.IsPositiveInfinity(Maths.CubeRoot(1.0/0.0))
		  Assert.IsNegativeInfinity(Maths.CubeRoot(-1.0/0.0))
		  Assert.AreEqual(0.0, Maths.CubeRoot(0.0))
		  Assert.AreEqual(-0.0, Maths.CubeRoot(-0.0))
		  Assert.AreEqual(5.0, Maths.CubeRoot(125.0))
		  Assert.AreEqual(9.0, Maths.CubeRoot(729))
		  Assert.AreEqual(10.727636943228317, Maths.CubeRoot(1234.56))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleMaxExponentTest()
		  Assert.AreEqual(Maths.GetExponent(Maths.DOUBLE_MAX_VALUE), Maths.DOUBLE_MAX_EXPONENT)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleMinExponentTest()
		  Assert.AreEqual(Maths.GetExponent(Maths.DOUBLE_MIN_NORMAL), Maths.DOUBLE_MIN_EXPONENT)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleToBitsTest()
		  Var posInf As Int64 = &h7ff0000000000000
		  Var negInf As Int64 = &hfff0000000000000
		  Var notANumber As Int64 = &h7ff8000000000000
		  
		  Assert.AreEqual(posInf, Maths.DoubleToBits(Maths.POSITIVE_INFINITY), "Testing positive infinity")
		  Assert.AreEqual(negInf, Maths.DoubleToBits(Maths.NEGATIVE_INFINITY), "Testing negative infinity")
		  Assert.AreEqual(notANumber, Maths.DoubleToBits(Maths.NAN), "Testing NaN")
		  
		  Assert.AreEqual(6757689, Maths.DoubleToBits(3.338742E-317))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoubleToRawBitsTest()
		  Var posInf As Int64 = &h7ff0000000000000
		  Var negInf As Int64 = &hfff0000000000000
		  
		  Assert.AreEqual(posInf, Maths.DoubleToRawBits(Maths.POSITIVE_INFINITY), "Testing positive infinity")
		  Assert.AreEqual(negInf, Maths.DoubleToRawBits(Maths.NEGATIVE_INFINITY), "Testing negative infinity")
		  
		  Var NaNBits As Int64 = Maths.DoubleToRawBits(Maths.NAN)
		  Assert.IsTrue(Maths.BitsToDouble(NaNBits).IsNotANumber)
		  
		  Assert.AreEqual(4612811918334230528, Maths.DoubleToRawBits(2.5))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetExponentTest()
		  #Pragma BreakOnExceptions False
		  
		  Assert.AreEqual(8, Maths.GetExponent(345.65))
		  Assert.AreEqual(1024, Maths.GetExponent(1.0 / 0.0))
		  Assert.AreEqual(-1023, Maths.GetExponent(0.0))
		  Assert.AreEqual(5, Maths.GetExponent(50.45))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HypotenuseTest()
		  #Pragma BreakOnExceptions False
		  
		  // If either argument is infinite, then the result is positive infinity.
		  Assert.IsPositiveInfinity(Maths.Hypotenuse(Maths.POSITIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(Maths.Hypotenuse(4.0, Maths.POSITIVE_INFINITY))
		  Assert.IsPositiveInfinity(Maths.Hypotenuse(Maths.NEGATIVE_INFINITY, 3.0))
		  Assert.IsPositiveInfinity(Maths.Hypotenuse(4.0, Maths.NEGATIVE_INFINITY))
		  
		  // If either argument is NaN and neither argument is infinite, then the result is NaN.
		  Assert.IsNaN(Maths.Hypotenuse(Maths.NAN, 2.0))
		  Assert.IsNaN(Maths.Hypotenuse(6.5, Maths.NAN))
		  Assert.IsPositiveInfinity(Maths.Hypotenuse(Maths.NAN, Maths.NEGATIVE_INFINITY))
		  
		  // When both are not infinity .
		  Assert.AreEqual(5.0, Maths.Hypotenuse(3.0, 4.0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsCloseToTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsEvenTest()
		  Assert.IsTrue(Maths.IsEven(-4))
		  Assert.IsTrue(Maths.IsEven(-2))
		  Assert.IsTrue(Maths.IsEven(0))
		  Assert.IsTrue(Maths.IsEven(2))
		  Assert.IsTrue(Maths.IsEven(4))
		  
		  Assert.IsFalse(Maths.IsEven(-3))
		  Assert.IsFalse(Maths.IsEven(-1))
		  Assert.IsFalse(Maths.IsEven(1))
		  Assert.IsFalse(Maths.IsEven(3))
		  Assert.IsFalse(Maths.IsEven(5))
		  
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
		  Assert.IsTrue(Maths.IsInteger(10))
		  Assert.IsTrue(Maths.IsInteger(12345))
		  Assert.IsTrue(Maths.IsInteger(-5))
		  Assert.IsTrue(Maths.IsInteger(0))
		  
		  Assert.IsFalse(Maths.IsInteger(0.1))
		  Assert.IsFalse(Maths.IsInteger(22.5))
		  Assert.IsFalse(Maths.IsInteger(-1.234))
		  
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
		  Assert.IsTrue(Maths.IsOdd(-3))
		  Assert.IsTrue(Maths.IsOdd(-1))
		  Assert.IsTrue(Maths.IsOdd(1))
		  Assert.IsTrue(Maths.IsOdd(3))
		  Assert.IsTrue(Maths.IsOdd(5))
		  
		  Assert.IsFalse(Maths.IsOdd(-4))
		  Assert.IsFalse(Maths.IsOdd(-2))
		  Assert.IsFalse(Maths.IsOdd(0))
		  Assert.IsFalse(Maths.IsOdd(2))
		  Assert.IsFalse(Maths.IsOdd(4))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IsZeroTest()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LerpTest()
		  Assert.IsTrue(Maths.Lerp(0, 100, 0.5) = 50)
		  Assert.IsTrue(Maths.Lerp(20, 80, 0) = 20)
		  Assert.IsTrue(Maths.Lerp(30, 5, 1) = 5)
		  Assert.IsTrue(Maths.Lerp(-1, 1, 0.5) = 0)
		  Assert.IsTrue(Maths.Lerp(0.5, 1, 0.5) = 0.75)
		  Assert.IsTrue(Maths.Lerp(-16.0e30, 16.0, 1.0) = 16)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift32Test()
		  // Equivalent to `long = int << x`.
		  
		  Assert.AreEqual(1152, Maths.LShift32(9, 7))
		  Assert.AreEqual(0, Maths.LShift32(0, 1))
		  Assert.AreEqual(2, Maths.LShift32(1, 1))
		  Assert.AreEqual(-2, Maths.LShift32(-1, 1))
		  Assert.AreEqual(-2, Maths.LShift32(2147483647, 1))
		  Assert.AreEqual(-32, Maths.LShift32(2147483647, 5))
		  Assert.AreEqual(0, Maths.LShift32(-2147483648, 1))
		  Assert.AreEqual(0, Maths.LShift32(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LShift64Test()
		  // Equivalent to `long = long << x`.
		  
		  Assert.AreEqual(1152, Maths.LShift64(9, 7))
		  Assert.AreEqual(0, Maths.LShift64(0, 1))
		  Assert.AreEqual(2, Maths.LShift64(1, 1))
		  Assert.AreEqual(-2, Maths.LShift64(-1, 1))
		  Assert.AreEqual(4294967294, Maths.LShift64(2147483647, 1))
		  Assert.AreEqual(68719476704, Maths.LShift64(2147483647, 5))
		  Assert.AreEqual(-4294967296, Maths.LShift64(-2147483648, 1))
		  Assert.AreEqual(-549755813888, Maths.LShift64(-2147483648, 8))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ModuloTest()
		  Assert.IsTrue(Maths.Modulo(5, 20) = 5)
		  Assert.IsTrue(Maths.Modulo(20, 20) = 0)
		  Assert.IsTrue(Maths.Modulo(22, 20) = 2)
		  Assert.IsTrue(Maths.Modulo(-2, 20) = 18)
		  Assert.IsTrue(Maths.Modulo(-1, 20) = 19)
		  Assert.IsTrue(Maths.Modulo(0, 20) = 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextDownTest()
		  Assert.AreEqual(-Maths.DOUBLE_MIN_VALUE, Maths.NextDown(0))
		  Assert.IsNegativeInfinity(Maths.NextDown(Maths.NEGATIVE_INFINITY))
		  Assert.IsNaN(Maths.NextDown(Maths.NAN))
		  Assert.AreEqual(23.439999999999998, Maths.NextDown(23.44))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextUpTest()
		  Assert.IsPositiveInfinity(Maths.NextUp(Maths.POSITIVE_INFINITY))
		  Assert.AreEqual(-1.7976931348623157e308, Maths.NextUp(Maths.NEGATIVE_INFINITY))
		  Assert.IsNaN(Maths.NextUp(Maths.NAN))
		  Assert.AreEqual(69.19000000000001, Maths.NextUp(69.19))
		  Assert.AreEqual(1.4e-45, Maths.NextUp(0))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfLeadingZerosTest()
		  Assert.AreEqual(64, Maths.NumberOfLeadingZeros(0))
		  Assert.AreEqual(56, Maths.NumberOfLeadingZeros(210))
		  Assert.AreEqual(52, Maths.NumberOfLeadingZeros(2234))
		  
		  Assert.AreEqual(0, Maths.NumberOfLeadingZeros(-1))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NumberOfTrailingZerosTest()
		  Assert.AreEqual(0, Maths.NumberOfTrailingZeros(-1))
		  Assert.AreEqual(64, Maths.NumberOfTrailingZeros(0))
		  Assert.AreEqual(2, Maths.NumberOfTrailingZeros(100))
		  Assert.AreEqual(1, Maths.NumberOfTrailingZeros(99946))
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
		    Var result As Double = Maths.Random(-1, 1)
		    
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
		  Var a As Int64 = Maths.RShift(-2, 1)
		  Var b As Int64 = Maths.RShift(0, 1)
		  Var c As Int64 = Maths.RShift(-1, 1)
		  Var d As Int64 = Maths.RShift(1, 1)
		  Var e As Int64 = Maths.RShift(100, 1)
		  Var f As Int64 = Maths.RShift(-2147483648, 1)
		  Var g As Int64 = Maths.RShift(2147483647, 1)
		  Var h As Int64 = Maths.RShift(2147483647, 5)
		  Var i As Int64 = Maths.RShift(-1, 30)
		  
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
		  Var j As Int64 = Maths.RShift(2147483999, 1)
		  Var k As Int64 = Maths.RShift(-2147483999, 30)
		  
		  Assert.AreEqual(1073741999, j)
		  Assert.AreEqual(-3, k)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftU32Test()
		  // Equivalent to `long = int >>> x`.
		  
		  Var a As Int64 = Maths.RShiftU32(-2, 1) ' -2 >>> 1
		  Var b As Int64 = Maths.RShiftU32(0, 1) ' 0 >>> 1
		  Var c As Int64 = Maths.RShiftU32(-1, 1) ' -1 >>> 1
		  Var d As Int64 = Maths.RShiftU32(1, 1) ' 1 >>> 1
		  Var e As Int64 = Maths.RShiftU32(100, 1) ' 100 >>> 1
		  Var f As Int64 = Maths.RShiftU32(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = Maths.RShiftU32(2147483647, 1) ' 2147483647 >>> 1
		  
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
		  
		  Var a As Int64 = Maths.RShiftU64(-2, 1) ' -2 >>> 1
		  Var b As Int64 = Maths.RShiftU64(0, 1) ' 0 >>> 1
		  Var c As Int64 = Maths.RShiftU64(-1, 1) ' -1 >>> 1
		  Var d As Int64 = Maths.RShiftU64(1, 1) ' 1 >>> 1
		  Var e As Int64 = Maths.RShiftU64(100, 1) ' 100 >>> 1
		  Var f As Int64 = Maths.RShiftU64(-2147483648, 1) ' -2147483648, >>> 1
		  Var g As Int64 = Maths.RShiftU64(2147483647, 1) ' 2147483647 >>> 1
		  Var h As Int64 = Maths.RShiftU64(2147483999, 1) ' 2147483999 >>> 1
		  
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
		  Assert.AreEqual(13342.72, Maths.Scalb(52.12, 8))
		  Assert.AreEqual(2.0, Maths.Scalb(2, 0))
		  Assert.AreEqual(0.0, Maths.Scalb(0, 2))
		  Assert.AreEqual(16.0, Maths.Scalb(2, 3))     
		  Assert.AreEqual(-96.0, Maths.Scalb(-3, 5))
		  Assert.AreEqual(0.1875, Maths.Scalb(3, -4))
		  Assert.AreEqual(-0.5, Maths.Scalb(-2, -2))
		  Assert.AreEqual(175.4656, Maths.Scalb(10.9666, 4))
		  Assert.AreEqual(-75.792, Maths.Scalb(-9.474, 3))
		  Assert.AreEqual(1.833425, Maths.Scalb(14.6674, -3))
		  Assert.AreEqual(-0.2341640625, Maths.Scalb(-14.9865, -6))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SignumTest()
		  Assert.AreEqual(1.0, Maths.Signum(30))
		  Assert.AreEqual(0.0, Maths.Signum(0))
		  Assert.AreEqual(-1.0, Maths.Signum(-30))
		  
		  Assert.AreEqual(1.0, Maths.Signum(0.0000000583050001))
		  Assert.AreEqual(1.0, Maths.Signum(0.000000018984))
		  Assert.AreEqual(1.0, Maths.Signum(0.0000000007270001))
		  
		  Assert.AreEqual(1.0, Maths.Signum(0.0000000000000003))
		  
		  // NaNs
		  Assert.IsNaN(Maths.Signum(0.0/0.0))
		  Assert.IsNaN(Maths.Signum(Sqrt(-1)))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToDegreesTest()
		  Assert.AreEqual(2578.31007795, Maths.RadiansToDegrees(45))
		  Assert.AreEqual(1718.8733853, Maths.RadiansToDegrees(30))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToRadiansTest()
		  Assert.AreEqual(3.14159256, Maths.DegreesToRadians(180))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Vector2Tests()
		  #Pragma Warning "TODO"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WrapIntegerTest()
		  Assert.AreEqual(10, Maths.WrapInteger(10, 20))
		  Assert.AreEqual(20, Maths.WrapInteger(20, 20))
		  Assert.AreEqual(0, Maths.WrapInteger(0, 20))
		  Assert.AreEqual(1, Maths.WrapInteger(21, 20))
		  Assert.AreEqual(19, Maths.WrapInteger(39, 20))
		  Assert.AreEqual(20, Maths.WrapInteger(40, 20))
		  Assert.AreEqual(1, Maths.WrapInteger(41, 20))
		  Assert.AreEqual(19, Maths.WrapInteger(-1, 20))
		  Assert.AreEqual(18, Maths.WrapInteger(-2, 20))
		  Assert.AreEqual(0, Maths.WrapInteger(-20, 20))
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
