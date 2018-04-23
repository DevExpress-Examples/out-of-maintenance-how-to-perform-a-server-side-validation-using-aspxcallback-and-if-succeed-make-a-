using System;
using System.Collections.Generic;
using DevExpress.Web.ASPxCallback;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page {
    const string userName = "admin";

    protected void btnCheck_Click(object sender, EventArgs e) {
        ClientScript.RegisterStartupScript(GetType(), "ANY_KEY", "alert('User Was Created.');", true);
    }

    protected void cbCheckText_Callback(object source, CallbackEventArgs e) {
        e.Result = (e.Parameter == userName) ? String.Empty : "Valid";
    }
}