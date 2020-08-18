<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var isValid = false;

        function btCheck_Click(s, e) {
            if (!isValid) {
                cbCheckText.PerformCallback(txt.GetText());
                e.processOnServer = false;
            }
            else {
                e.processOnServer = true;
            }
        }

        function cbCheckText_CallbackComplete(s, e) {
            if (e.result == "Valid") {
                isValid = true;
                btn.DoClick();
            }
            else {
                txt.SetIsValid(false);
            }
        }
    </script>
</head>
<body>
    <form id="frmMain" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="2">
                    Enter Some Text:
                    <dx:ASPxCallback ID="cbCheckText" runat="server" OnCallback="cbCheckText_Callback">
                        <ClientSideEvents CallbackComplete="cbCheckText_CallbackComplete" />
                    </dx:ASPxCallback>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtUser" runat="server" Width="170px" ClientInstanceName="txt">
                        <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="ImageWithTooltip"
                            ErrorText="Enter Another Text">
                            <RequiredField IsRequired="true" ErrorText="Field Is Required" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnCheck" runat="server" Text="Check" ClientInstanceName="btn" Width="100%" OnClick="btnCheck_Click">
                        <ClientSideEvents Click="btCheck_Click" />
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
