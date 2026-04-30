<!DOCTYPE html>
<html>
    <head runat="server">
        <title>회사등록</title>

        <style>
            /* 전체 배경 */
            .erp-comp-wrap {
                display: flex;
                height: 100vh;
                background: #f7f7f7;
                font-family: "Noto Sans KR";
            }

            /* CENTER */
            .erp-comp-center {
                width: 420px;
                background: #fff;
                border-right: 1px solid #dcdcdc;
                display: flex;
                flex-direction: column;
            }

            .grid-comp-title {
                padding: 10px;
                font-weight: bold;
                border-bottom: 1px solid #eee;
            }

            .grid-comp-area {
                flex: 1;
                overflow: auto;
            }

            .grid-comp-table {
                width: 100%;
                border-collapse: collapse;
                font-size: 12px;
            }

            .grid-comp-table th {
                background: #e9f1fb;
                padding: 6px;
                border-bottom: 1px solid #ddd;
            }

            .grid-comp-table td {
                padding: 6px;
                border-bottom: 1px solid #eee;
            }

            .grid-comp-table tr:hover {
                background: #f5f5f5;
            }

            .grid-comp-table .selected {
                background: #ffe699;
            }

            /* RIGHT */
            .erp-comp-right {
                flex: 1;
                padding: 10px;
                overflow: auto;
            }

            /* TAB */
            .tab-comp-area {
                display: flex;
                gap: 5px;
                margin-bottom: 10px;
            }

            .tab-comp {
                padding: 6px 12px;
                background: #e0e0e0;
                border-radius: 4px;
                cursor: pointer;
            }

            .tab-comp.active {
                background: #2f5597;
                color: #fff;
            }

            /* FORM */
            .form-comp-box {
                background: #fff;
                border: 1px solid #dcdcdc;
                padding: 12px;
                margin-bottom: 10px;
            }

            .row-comp {
                margin-bottom: 6px;
                font-size: 12px;
            }

            .comp-input, .comp-select {
                height: 22px;
                border: 1px solid #ccc;
                margin-left: 10px
            }

            .comp-add-btn {
                border: none;
                background-color: transparent;
                margin-left: 10px;
            }
        </style>
    </head>

    <body style="margin:0; height:100vh;">
        <form runat="server" style="height:100%;">

            <div class="erp-comp-wrap">

                <div class="erp-comp-center">
                    <div class="grid-comp-title">회사 목록</div>

                    <div class="grid-comp-area">
                        <table class="grid-comp-table">
                            <tr>
                                <th>코드</th>
                                <th>회사명</th>
                                <th>구분</th>
                            </tr>
                            <tr class="selected">
                                <td>4004</td>
                                <td>생산1급 회사A</td>
                                <td>법인</td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="erp-comp-right">
                    <div class="tab-comp-area">
                        <div class="tab-comp active">기본등록사항</div>
                    </div>

                    <div class="form-comp-box">
                        <div class="row-comp">회계년도 <input type="text" class="comp-input"/></div>
                        <div class="row-comp">사업자번호 <input type="text" class="comp-input"/></div>
                        <div class="row-comp">법인번호 <input type="text" class="comp-input"/></div>
                    </div>

                    <div class="form-comp-box">
                        <div class="row-comp">본점우편번호
                            <input type="text" class="comp-input" />
                            <asp:Button ID="Button1" runat="server" CssClass="comp-add-btn" Text="🔍" />
                        </div>
                        <div class="row-comp">본점주소 <input type="text" class="comp-input" /></div>
                        <div class="row-comp">전화번호 <input type="text" class="comp-input"/></div>
                    </div>

                    <div class="form-comp-box">
                        <div class="row-comp">
                            설립일 
                            <input type="date" class="comp-input" />
                        </div>
                        <div class="row-comp">사용여부 
                             <asp:DropDownList ID="compUseYn" runat="server" CssClass="comp-select">
                                <asp:ListItem Text="사용" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="미사용" Value="N"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

            </div>

        </form>
    </body>
</html>