Public Class ItemSales
    Inherits System.Web.UI.Page
    Dim tadapSales As New DS_SalesTableAdapters.ItemSalesTableAdapter
    Dim dtabSales As Data.DataTable
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Not Page.IsPostBack Then
                getDataAllsales()
            End If
        Catch ex As Exception

        End Try
    End Sub

#Region "Method"

    Private Sub GV_SALES_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GV_SALES.RowCommand
        Try
            If e.CommandName = "Entry" Then
                Dim control As Control = Nothing
                If (Not (GV_SALES.FooterRow) Is Nothing) Then
                    control = GV_SALES.FooterRow
                Else
                    control = GV_SALES.Controls(0).Controls(0)
                End If

                Dim strItem As String = CType(control.FindControl("txt_item"), TextBox).Text
                Dim strSubItem As String = CType(control.FindControl("txt_subitem"), TextBox).Text
                Dim strOrdering As String = CType(control.FindControl("txt_ordering"), TextBox).Text
                Dim strSelling As String = CType(control.FindControl("txt_selling"), TextBox).Text

                tadapSales.Insert(strItem, strSubItem, strOrdering, strSelling)
                getDataAllsales()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GV_SALES_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GV_SALES.RowDataBound
        Try
            Dim total_ordering As Decimal = 0
            Dim total_selling As Decimal = 0

            For Each gvRow As GridViewRow In GV_SALES.Rows
                total_ordering += Convert.ToDecimal(DirectCast(GV_SALES.Rows(gvRow.RowIndex).FindControl("lbl_ordering"), Label).Text.ToString())
                total_selling += Convert.ToDecimal(DirectCast(GV_SALES.Rows(gvRow.RowIndex).FindControl("lbl_selling"), Label).Text.ToString())
            Next

            txt_total_ordering.Text = Format(total_ordering, "#,0.00")
            txt_total_selling.Text = Format(total_selling, "#,0.00")
            txt_percentage_profit.Text = Format(((total_selling - total_ordering) / total_selling) * 100, "#,0.00") & "%"
            txt_profit.Text = Format(total_selling - total_ordering, "#,0.00")
        Catch ex As Exception

        End Try
    End Sub
#End Region

#Region "function"
    Private Sub getDataAllsales()
        Try
            dtabSales = tadapSales.GetData()
            GV_SALES.DataSource = dtabSales
            GV_SALES.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GV_SALES_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GV_SALES.RowEditing
        Try
            GV_SALES.EditIndex = e.NewEditIndex
            getDataAllsales()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GV_SALES_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GV_SALES.RowCancelingEdit
        Try
            GV_SALES.EditIndex = -1
            getDataAllsales()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GV_SALES_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GV_SALES.RowUpdating
        Try
            Dim lblNo As Label = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("lbl_no"), Label)
            Dim txtEditItem As TextBox = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("txt_Edititem"), TextBox)
            Dim txtEditSubItem As TextBox = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("txt_Editsubitem"), TextBox)
            Dim txtEditOrdering As TextBox = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("txt_Editordering"), TextBox)
            Dim txtEditSelling As TextBox = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("txt_Editselling"), TextBox)

            tadapSales.UpdateItemSales(txtEditItem.Text, txtEditSubItem.Text, txtEditOrdering.Text, txtEditSelling.Text, lblNo.Text)
            GV_SALES.EditIndex = -1
            getDataAllsales()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub GV_SALES_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GV_SALES.RowDeleting
        Try
            Dim lblNo As Label = DirectCast(GV_SALES.Rows(e.RowIndex).FindControl("lbl_no"), Label)
            tadapSales.Delete(lblNo.Text)
            getDataAllsales()
        Catch ex As Exception

        End Try
    End Sub




#End Region

End Class