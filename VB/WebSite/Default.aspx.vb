Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private Const userName As String = "admin"

	Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As EventArgs)
		ClientScript.RegisterStartupScript(Me.GetType(), "ANY_KEY", "alert('User Was Created.');", True)
	End Sub

	Protected Sub cbCheckText_Callback(ByVal source As Object, ByVal e As CallbackEventArgs)
		If (e.Parameter = userName) Then
			e.Result = String.Empty
		Else
			e.Result = "Valid"
		End If
	End Sub
End Class