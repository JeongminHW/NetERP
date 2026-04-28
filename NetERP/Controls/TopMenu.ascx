<%@ Control Language="VB" AutoEventWireup="true" %>
<style>
    input[type="text"] {
        font-family: 'noto Sans KR';
        outline: none;
        border: none;
        box-shadow: none;
        background: none;
    }

    .btn {
        background: #f5f7fa;
        border: 1px solid #cfd6df;
        color: #2b2f36;
        font-family: 'noto Sans KR';
        padding: 4px 10px;
        cursor: pointer;
        height: 30px;
    }

    .btn:hover {
        background: #e9edf2;
    }

    .top-info > div,
    .top-menu {
        display: flex;
        align-items: center;
        gap: 6px;
    }
    
    .top-info{
        background: #eef1f5;
        padding: 4px 4px 4px 14px;
    }

    .info-row {
        display: flex;
        align-items: center;
        gap: 6px;
    }

    .info-text{
        font-weight: bold;
        color: #2f3b4c;
    }

    .left-group {
        display: flex;
        gap: 6px;
    }

    .right-group {
        margin-left: auto; 
        display: flex;
        gap: 6px;
    }

    .info-btn {
        padding: 4px;
        height: auto;
        background: none;
    }

    .top-menu {
        background: #2f3b4c;
        padding: 14px;
    }

    .main-text{
        font-size: larger; 
        font-weight: bold;
        color: #fff
    }

    .btn-primary {
        background: #4b5563;
        color: white;
    }

    .btn-danger {
        background: #b91c1c;
        color: white;
    }

    .top-menu .btn {
        background: #3b4656;
        border: 1px solid #4b5563;
        color: #e5e7eb;
    }

    .top-menu .btn:hover {
        background: #4b5563;
    }
</style>

<div class="top-container">
    <div class="top-info top-info-input">
        <div class="info-row">

            <div class="left-group">
                <input type="text" value="사용자 :" style="width: 71px;" readonly onfocus="this.blur()" class="info-text"/>
                <input type="text" readonly />

                <input type="text" value="회사 :" style="width: 61px" readonly onfocus="this.blur()" class="info-text" />
                <input type="text" readonly />

                <input type="text" value="회계기간 :" readonly onfocus="this.blur()" class="info-text" />
                <input type="text" readonly />
            </div>

            <div class="right-group">
                <asp:Button ID="btnMinimize" runat="server" Text="➖" CssClass="btn info-btn"/>
                <asp:Button ID="btnExit" runat="server" Text="✖" CssClass="btn info-btn"/>
            </div>

        </div>
    </div>

    <div class="top-menu">
        <input type="text" value="NET ERP" class="main-text" readonly onfocus="this.blur()" />
        <asp:Button ID="btnClose" runat="server" Text="닫기" CssClass="btn btn-primary"/>
        <asp:Button ID="btnCodeSave" runat="server" Text="코드등록" CssClass="btn btn-primary"/>
        <asp:Button ID="btnSearch" runat="server" Text="조회" CssClass="btn btn-primary"/>
        <asp:Button ID="btnPrint" runat="server" Text="인쇄" CssClass="btn btn-primary"/>

        <asp:Button ID="btnDelete" runat="server" Text="삭제" CssClass="btn btn-danger"/>
    </div>

</div>

