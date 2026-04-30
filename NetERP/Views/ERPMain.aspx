<%@ Page Language="VB" AutoEventWireup="true" %>
<%@ Register Src="~/Controls/TopMenu.ascx" TagPrefix="uc" TagName="TopMenu" %>
<%@ Register Src="~/Controls/SideBar.ascx" TagPrefix="uc" TagName="SideBar" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>NET ERP MAIN</title>
</head>

<body style="margin: 0; padding: 0; overflow: hidden; height: 100vh; display: flex; flex-direction: column;">
<form id="form1" runat="server" style="display: flex; flex-direction: column; height: 100%;">
    <uc:TopMenu runat="server" ID="TopMenu1" />
    
    <div style="display: flex; flex: 1; overflow: hidden;">
        <uc:SideBar runat="server" ID="SideBar" />

        <main style="flex: 1; overflow: hidden;">
            <iframe id="contentFrame"
                    name="contentFrame"
                    style="width:100%; height:100%; border:none;">
            </iframe>
        </main>
    </div>
</form>
</body>
</html>