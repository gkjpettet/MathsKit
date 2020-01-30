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
		Sub LShiftTest()
		  ///
		  ' Tests my implementation of the `<<` operator.
		  ///
		  
		  ' -2 << 1 = -4
		  ' 0 << 1 = 0
		  ' -1 << 1 = -2
		  ' 100 << 1 = 200
		  ' -2147483648 << 1 = 0
		  ' 2147483647 << 1 = -2
		  
		  Using MathsKit
		  
		  Var a As Int32 = LShift(-2, 1)
		  Var b As Int32 = LShift(0, 1)
		  Var c As Int32 = LShift(-1, 1)
		  Var d As Int32 = LShift(100, 1)
		  Var e As Int32 = LShift(-2147483648, 1)
		  Var f As Int32 = LShift(2147483647, 1)
		  
		  Var a_ As Int32 = -4
		  Var b_ As Int32 = 0
		  Var c_ As Int32 = -2
		  Var d_ As Int32 = 200
		  Var e_ As Int32 = 0
		  Var f_ As Int32 = -2
		  
		  Assert.AreEqual(a_, a)
		  Assert.AreEqual(b_, b)
		  Assert.AreEqual(c_, c)
		  Assert.AreEqual(d_, d)
		  Assert.AreEqual(e_, e)
		  Assert.AreEqual(f_, f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftTest()
		  ///
		  ' Tests my implementation of the `>>` operator.
		  ///
		  
		  ' -2 >> 1 = -1
		  ' 0 >> 1 = 0
		  ' -1 >> 1 = -1
		  ' 100 >> 1 = 50
		  ' -2147483648 >> 1 = -1073741824
		  ' 2147483647 >> 1 = 1073741823
		  
		  Using MathsKit
		  
		  Var a As Int32 = RShift(-2, 1)
		  Var b As Int32 = RShift(0, 1)
		  Var c As Int32 = RShift(-1, 1)
		  Var d As Int32 = RShift(100, 1)
		  Var e As Int32 = RShift(-2147483648, 1)
		  Var f As Int32 = RShift(2147483647, 1)
		  
		  Var a_ As Int32 = -1
		  Var b_ As Int32 = 0
		  Var c_ As Int32 = -1
		  Var d_ As Int32 = 50
		  Var e_ As Int32 = -1073741824
		  Var f_ As Int32 = 1073741823
		  
		  Assert.AreEqual(a_, a)
		  Assert.AreEqual(b_, b)
		  Assert.AreEqual(c_, c)
		  Assert.AreEqual(d_, d)
		  Assert.AreEqual(e_, e)
		  Assert.AreEqual(f_, f)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RShiftUTest()
		  ///
		  ' Tests my implementation of the `>>>` operator.
		  ///
		  
		  ' -2 >>> 1 = 2147483647
		  ' 0 >>> 1 = 0
		  ' -1 >>> 1 = 2147483647
		  ' 100 >>> 1 = 50
		  ' -2147483648 >>> 1 = 1073741824
		  ' 2147483647 >>> 1 = 1073741823
		  
		  Using MathsKit
		  
		  Var a As Int32 = RShiftU(-2, 1)
		  Var b As Int32 = RShiftU(0, 1)
		  Var c As Int32 = RShiftU(-1, 1)
		  Var d As Int32 = RShiftU(100, 1)
		  Var e As Int32 = RShiftU(-2147483648, 1)
		  Var f As Int32 = RShiftU(2147483647, 1)
		  
		  Var a_ As Int32 = 2147483647
		  Var b_ As Int32 = 0
		  Var c_ As Int32 = 2147483647
		  Var d_ As Int32 = 50
		  Var e_ As Int32 = 1073741824
		  Var f_ As Int32 = 1073741823
		  
		  Assert.AreEqual(a_, a)
		  Assert.AreEqual(b_, b)
		  Assert.AreEqual(c_, c)
		  Assert.AreEqual(d_, d)
		  Assert.AreEqual(e_, e)
		  Assert.AreEqual(f_, f)
		  
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
