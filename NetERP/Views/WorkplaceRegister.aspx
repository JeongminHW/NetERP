<%@ Page Language="C#" AutoEventWireup="true" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>사업장등록</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }

        /* 전체 배경 */
        .erp-comp-wrap {
            display: flex;
            height: 100vh;
            background: #f0f0f0;
            font-family: "Noto Sans KR", sans-serif;
        }

        /* CENTER - 사업장 목록 */
        .erp-comp-center {
            width: 300px;
            background: #fff;
            border-right: 1px solid #dcdcdc;
            display: flex;
            flex-direction: column;
            flex-shrink: 0;
        }

        .grid-comp-title {
            padding: 8px 10px;
            font-weight: bold;
            border-bottom: 1px solid #eee;
            background: #f5f5f5;
        }

        .grid-comp-area {
            flex: 1;
            overflow: auto;
        }

        .grid-comp-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .grid-comp-table th {
            background: #e9f1fb;
            padding: 5px 6px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            font-weight: bold;
        }

        .grid-comp-table td {
            padding: 5px 6px;
            border-bottom: 1px solid #eee;
            text-align: center;
            cursor: pointer;
        }

        .grid-comp-table tr:hover td { background: #f5f5f5; }
        .grid-comp-table tr.selected td { background: #ffe699; }

        /* RIGHT - 상세 폼 */
        .erp-comp-right {
            flex: 1;
            padding: 10px;
            overflow: auto;
            background: #f0f0f0;
        }

        /* 상단 바 */
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        /* TAB */
        .tab-comp-area {
            display: flex;
            gap: 4px;
        }

        .tab-comp {
            padding: 4px 12px;
            background: #d0d0d0;
            border-radius: 3px;
            cursor: pointer;
            color: #555;
        }

        .tab-comp.active {
            background: #2f5597;
            color: #fff;
            font-weight: bold;
        }

        /* 등록 버튼 */
        .workplace-register-btn {
            background: #2f5597;
            color: #fff;
            border: none;
            padding: 4px 12px;
            border-radius: 3px;
            cursor: pointer;
            font-family: inherit;
        }

        .workplace-register-btn:hover { background: #3a6bbf; }

        /* 탭 패널 */
        .tab-panel {
            display: none;
            flex-direction: column;
            gap: 8px;
        }

        .tab-panel.active { display: flex; }

        /* FORM */
        .form-comp-box {
            background: #fff;
            border: 1px solid #dcdcdc;
            padding: 10px 12px;
        }

        .form-section-title {
            font-weight: bold;
            color: #2f5597;
            margin-bottom: 6px;
            padding-bottom: 4px;
            border-bottom: 1px solid #e0e8f5;
        }

        .row-comp {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .row-comp:last-child { margin-bottom: 0; }

        .comp-label {
            width: 8em;
            color: #666;
            flex-shrink: 0;
            text-align: right;
            padding-right: 8px;
            font-size: 12px;
        }

        .comp-input {
            height: 22px;
            border: 1px solid #bbb;
            padding: 0 5px;
            font-family: inherit;
            outline: none;
            width: 12em;
        }

        .comp-input:focus { border-color: #2f5597; }
        .comp-input.wide   { width: 18em; }
        .comp-input.mid    { width: 9em; }
        .comp-input.narrow { width: 5em; }

        .comp-select {
            height: 1.6em;
            border: 1px solid #bbb;
            padding: 0 2px;
            font-family: inherit;
            outline: none;
            width: 7em;
        }

        .comp-add-btn {
            height: 1.6em;
            width: 1.8em;
            border: 1px solid #bbb;
            background: #f0f0f0;
            cursor: pointer;
            margin-left: 2px;
        }

        .comp-add-btn:hover { background: #e0e0e0; }

        .phone-sep {
            margin: 0 4px;
        }
    </style>
</head>
<body style="margin:0; height:100vh;">
<form id="form1" runat="server" style="height:100%;">

    <div class="erp-comp-wrap">

        <!-- 사업장 목록 -->
        <div class="erp-comp-center">
            <div class="grid-comp-title">사업장 목록</div>
            <div class="grid-comp-area">
                <table class="grid-comp-table">
                    <thead>
                        <tr>
                            <th>코드</th>
                            <th>사업장명</th>
                        </tr>
                    </thead>
                    <tbody id="wpList">
                        <tr class="selected" onclick="selectRow(this)">
                            <td>1000</td>
                            <td style="text-align:left;">(주)한국자전거본사</td>
                        </tr>
                        <tr onclick="selectRow(this)">
                            <td>2000</td>
                            <td style="text-align:left;">(주)한국자전거지사</td>
                        </tr>
                        <tr onclick="selectRow(this)">
                            <td>3000</td>
                            <td style="text-align:left;">(주)대한자전거지사</td>
                        </tr>
                        <tr><td></td><td></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 상세 폼 영역 -->
        <div class="erp-comp-right">

            <div class="top-bar">
                <div class="tab-comp-area">
                    <div class="tab-comp active" onclick="switchTab('basic', this)">기본등록사항</div>
                    <div class="tab-comp" onclick="switchTab('report', this)">신고관련사항</div>
                    <div class="tab-comp" onclick="switchTab('extra', this)">추가등록사항</div>
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="+ 사업장등록"
                    CssClass="workplace-register-btn"
                    OnClientClick="addNew(); return false;" />
            </div>

            <!-- 기본등록사항 탭 -->
            <div id="panel-basic" class="tab-panel active">

                <div class="form-comp-box">
                    <div class="form-section-title">사업자 정보</div>
                    <div class="row-comp">
                        <span class="comp-label">사업자등록번호</span>
                        <asp:TextBox ID="txtBizNo" runat="server" CssClass="comp-input mid"
                            placeholder="000-00-00000" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">법인등록번호</span>
                        <asp:TextBox ID="txtCorpNo" runat="server" CssClass="comp-input mid"
                            placeholder="000000-0000000" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">대표자명</span>
                        <asp:TextBox ID="txtCeoName" runat="server" CssClass="comp-input mid" />
                    </div>
                </div>

                <div class="form-comp-box">
                    <div class="form-section-title">주소 정보</div>
                    <div class="row-comp">
                        <span class="comp-label">사업장우편번호</span>
                        <asp:TextBox ID="txtZipCode" runat="server" CssClass="comp-input narrow" />
                        <asp:Button ID="btnZipSearch" runat="server" CssClass="comp-add-btn"
                            Text="🔍" OnClientClick="return false;" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">사업장주소</span>
                        <asp:TextBox ID="txtAddr1" runat="server" CssClass="comp-input wide" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">사업장번지</span>
                        <asp:TextBox ID="txtAddr2" runat="server" CssClass="comp-input wide" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">전화번호</span>
                        <asp:TextBox ID="txtTelArea" runat="server" CssClass="comp-input narrow"
                            placeholder="02" />
                        <span class="phone-sep">)</span>
                        <asp:TextBox ID="txtTelNo" runat="server" CssClass="comp-input narrow" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">FAX 번호</span>
                        <asp:TextBox ID="txtFaxArea" runat="server" CssClass="comp-input narrow"
                            placeholder="02" />
                        <span class="phone-sep">)</span>
                        <asp:TextBox ID="txtFaxNo" runat="server" CssClass="comp-input narrow" />
                    </div>
                </div>

                <div class="form-comp-box">
                    <div class="form-section-title">업종 정보</div>
                    <div class="row-comp">
                        <span class="comp-label">업태</span>
                        <asp:TextBox ID="txtBizType" runat="server" CssClass="comp-input" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">종목</span>
                        <asp:TextBox ID="txtBizItem" runat="server" CssClass="comp-input" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">관할세무서</span>
                        <asp:TextBox ID="txtTaxOffice" runat="server" CssClass="comp-input mid" />
                        <asp:Button ID="btnTaxSearch" runat="server" CssClass="comp-add-btn"
                            Text="🔍" OnClientClick="return false;" />
                    </div>
                </div>

                <div class="form-comp-box">
                    <div class="form-section-title">기간 및 기타</div>
                    <div class="row-comp">
                        <span class="comp-label">개업년월일</span>
                        <asp:TextBox ID="txtOpenDate" runat="server" CssClass="comp-input mid"
                            placeholder="____/__/__" />
                        <asp:Button ID="btnOpenDate" runat="server" CssClass="comp-add-btn"
                            Text="📅" OnClientClick="return false;" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">폐업년월일</span>
                        <asp:TextBox ID="txtCloseDate" runat="server" CssClass="comp-input mid"
                            placeholder="____/__/__" />
                        <asp:Button ID="btnCloseDate" runat="server" CssClass="comp-add-btn"
                            Text="📅" OnClientClick="return false;" />
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">분점여부</span>
                        <asp:DropDownList ID="ddlBranch" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="0. 부" Value="0" />
                            <asp:ListItem Text="1. 여" Value="1" />
                        </asp:DropDownList>
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">이행상황신고구분</span>
                        <asp:DropDownList ID="ddlReportType" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="월별" Value="M" />
                            <asp:ListItem Text="반기별" Value="H" />
                        </asp:DropDownList>
                    </div>
                </div>

            </div>

            <!-- 신고관련사항 탭 -->
            <div id="panel-report" class="tab-panel">
                <div class="form-comp-box">
                    <div class="form-section-title">신고 관련 사항</div>
                    <div class="row-comp">
                        <span class="comp-label">신고구분</span>
                        <asp:DropDownList ID="ddlTaxType" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="일반과세" Value="1" />
                            <asp:ListItem Text="간이과세" Value="2" />
                            <asp:ListItem Text="면세" Value="3" />
                        </asp:DropDownList>
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">부가세신고</span>
                        <asp:DropDownList ID="ddlVatReport" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="분기별" Value="Q" />
                            <asp:ListItem Text="반기별" Value="H" />
                        </asp:DropDownList>
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">원천징수</span>
                        <asp:DropDownList ID="ddlWithhold" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="월별" Value="M" />
                            <asp:ListItem Text="반기별" Value="H" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <!-- 추가등록사항 탭 -->
            <div id="panel-extra" class="tab-panel">
                <div class="form-comp-box">
                    <div class="form-section-title">추가 등록 사항</div>
                    <div class="row-comp">
                        <span class="comp-label">사용여부</span>
                        <asp:DropDownList ID="ddlUseYn" runat="server" CssClass="comp-select">
                            <asp:ListItem Text="사용" Value="Y" />
                            <asp:ListItem Text="미사용" Value="N" />
                        </asp:DropDownList>
                    </div>
                    <div class="row-comp">
                        <span class="comp-label">비고</span>
                        <asp:TextBox ID="txtRemark" runat="server" CssClass="comp-input wide" />
                    </div>
                </div>
            </div>

        </div>
    </div>

</form>

<script>
    function switchTab(name, el) {
        document.querySelectorAll('.tab-comp').forEach(function (t) {
            t.classList.remove('active');
        });
        document.querySelectorAll('.tab-panel').forEach(function (p) {
            p.classList.remove('active');
        });
        el.classList.add('active');
        document.getElementById('panel-' + name).classList.add('active');
    }

    function selectRow(tr) {
        document.querySelectorAll('#wpList tr').forEach(function (r) {
            r.classList.remove('selected');
        });
        tr.classList.add('selected');
    }

    function addNew() {
        document.querySelectorAll('#wpList tr').forEach(function (r) {
            r.classList.remove('selected');
        });
        var rows = document.querySelectorAll('#wpList tr');
        rows[rows.length - 1].classList.add('selected');
        document.querySelectorAll('.comp-input').forEach(function (el) {
            el.value = '';
        });
        document.querySelectorAll('.comp-select').forEach(function (el) {
            el.selectedIndex = 0;
        });
    }
</script>
</body>
</html>