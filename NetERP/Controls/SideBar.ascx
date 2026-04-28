<%@ Control Language="VB" AutoEventWireup="true" %>
<style>
    aside {
        position: relative; /* sticky 대신 relative 또는 기본값 */
        height: 100%;       /* 부모(flex 컨테이너)의 높이를 100% 채움 */
        width: 230px;
        min-width: 150px;
        max-width: 500px;
        background-color: #f7f7f7;
        border-right: 1px solid #bbb;
        box-sizing: border-box;
        /* 스크롤 핵심 설정 */
        overflow-y: auto;   
        overflow-x: hidden;
        user-select: none; /* 드래그 중 텍스트 선택 방지 */
    }

    aside::-webkit-scrollbar {
        width: 8px;
        display: block;
    }
    aside::-webkit-scrollbar-thumb {
        background-color: #aaa;
        border-radius: 4px;
    }
    aside::-webkit-scrollbar-track {
        background-color: #e0e0e0;
    }

     /* -- 대분류-- */
    .category-group {
        border-bottom: 1px solid #ccc;
    }

    .category-header {
        display: flex;
        align-items: center;
        gap: 5px;
        padding: 6px 10px;
        background: #dce6f0;
        cursor: pointer;
        font-weight: bold;
        color: #1a3a5c;
    }
    .category-header:hover {
        background: #c5d5e8;
    }
    .category-header .cat-icon {
        font-size: 11px;
        transition: transform 0.2s;
        display: inline-block;
        flex-shrink: 0;
    }
    .category-header.open .cat-icon {
        transform: rotate(90deg);
    }

    .category-body {
        display: none;
        background: #f7f7f7;
    }
    .category-body.open {
        display: block;
    }

    /* -- 중분류 -- */
    .sub-group {
        border-top: 1px solid #e0e0e0;
    }

    .sub-header {
        display: flex;
        align-items: center;
        gap: 5px;
        padding: 5px 10px 5px 20px;
        background: #eaf0f8;
        cursor: pointer;
        color: #1a3a5c;
        font-weight: bold;
    }
    .sub-header:hover {
        background: #d8e8f5;
    }
    .sub-header .sub-icon {
        font-size: 10px;
        transition: transform 0.2s;
        display: inline-block;
        flex-shrink: 0;
    }
    .sub-icon::before{
        content: '📁';
        font-size: 15px;
    }
    .sub-header.open .sub-icon::before {
        content: '📂';
    }

    .sub-body {
        display: none;
    }
    .sub-body.open {
        display: block;
    }

    /* -- 메뉴 항목 -- */
    .menu-item {
        display: flex;
        align-items: center;
        gap: 6px;
        padding: 5px 10px 5px 34px;
        cursor: pointer;
        color: #222;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .menu-item:hover {
        background: #ddeeff;
        color: #0044aa;
    }
    .menu-item.active {
        background: #cce0ff;
        color: #003399;
        font-weight: bold;
    }
    .menu-item::before {
        content: '📄';
        font-size: 11px;
        flex-shrink: 0;
    }

    .resize-handle {
        position: absolute;
        top: 0;
        right: 0;
        width: 5px;
        height: 100%;
        cursor: col-resize;
        background-color: transparent;
        z-index: 100;
    }

    .resize-handle:hover,
    .resize-handle.dragging {
        background-color: #4a90e2;
        opacity: 0.5;
    }
</style>

<aside class="sidebar-container" id="sidebar">
    <div class="resize-handle" id="resizeHandle"></div>

    <!-- 메뉴 목록 -->
    <div class="sidebar-menu">
        <!-- 시스템관리 -->
        <div class="category-group">
            <div class="category-header" onclick="toggleCategory(this)">
                <span class="cat-icon">▶</span> 시스템관리
            </div>
            <div class="category-body">

                <!-- 회사등록정보 -->
                <div class="sub-group">
                    <div class="sub-header" onclick="toggleSub(this)">
                        <span class="sub-icon"></span> 회사등록정보
                    </div>
                    <div class="sub-body">
                        <div class="menu-item" onclick="selectMenu(this)">회사등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">사업장등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">부서등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">사원등록</div>
                    </div>
                </div>

                <!-- 기초정보관리 -->
                <div class="sub-group">
                    <div class="sub-header" onclick="toggleSub(this)">
                        <span class="sub-icon"></span> 기초정보관리
                    </div>
                    <div class="sub-body">
                        <div class="menu-item" onclick="selectMenu(this)">일반거래처등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">품목등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">창고/공정(생산)등록</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 생산관리공통 -->
        <div class="category-group">
            <div class="category-header" onclick="toggleCategory(this)">
                <span class="cat-icon">▶</span> 생산관리공통
            </div>
            <div class="category-body">

                <!-- 생산관리 -->
                <div class="sub-group">
                    <div class="sub-header" onclick="toggleSub(this)">
                        <span class="sub-icon"></span> 생산관리
                    </div>
                    <div class="sub-body">
                        <div class="menu-item" onclick="selectMenu(this)">생산계획등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">작업지시등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">생산자재출고</div>
                        <div class="menu-item" onclick="selectMenu(this)">작업실적등록</div>
                        <div class="menu-item" onclick="selectMenu(this)">생산품창고입고처리</div>
                    </div>
                </div>

                <!-- 생산/제공현황 -->
                <div class="sub-group">
                    <div class="sub-header" onclick="toggleSub(this)">
                        <span class="sub-icon"></span> 생산/제공현황
                    </div>
                    <div class="sub-body">
                        <div class="menu-item" onclick="selectMenu(this)">실적현황</div>
                        <div class="menu-item" onclick="selectMenu(this)">자재사용현황(작업별)</div>
                        <div class="menu-item" onclick="selectMenu(this)">자재사용현황(제품별)</div>
                        <div class="menu-item" onclick="selectMenu(this)">생산일보</div>
                        <div class="menu-item" onclick="selectMenu(this)">대시보드</div>
                    </div>
                </div>

                <!-- 기초정보관리 -->
                <div class="sub-group">
                    <div class="sub-header" onclick="toggleSub(this)">
                        <span class="sub-icon"></span> 기초정보관리
                    </div>
                    <div class="sub-body">
                        <div class="menu-item" onclick="selectMenu(this)">BOM등록</div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</aside>

<script>
    // ── 대분류 아코디언 (하나만 열림) ──
    function toggleCategory(header) {
        //const allHeaders = document.querySelectorAll('.category-header');

        //allHeaders.forEach(function (h) {
        //    if (h === header) return;
        //    h.classList.remove('open');
        //    h.nextElementSibling.classList.remove('open');
        //    // 열려있던 대분류 닫힐 때 중분류도 모두 초기화
        //    h.nextElementSibling.querySelectorAll('.sub-header').forEach(function (sh) {
        //        sh.classList.remove('open');
        //        sh.nextElementSibling.classList.remove('open');
        //    });
        //});

        header.classList.toggle('open');
        header.nextElementSibling.classList.toggle('open');

        const body = header.nextElementSibling;
        // 대분류가 닫힐 때 중분류 모두 초기화
        if (!body.classList.contains('open')) {
            body.querySelectorAll('.sub-header').forEach(function (sh) {
                sh.classList.remove('open');
                sh.nextElementSibling.classList.remove('open');
            });
        }
    }

    // ── 중분류 아코디언 ──
    function toggleSub(subHeader) {
        subHeader.classList.toggle('open');
        subHeader.nextElementSibling.classList.toggle('open');
    }

    // ── 메뉴 항목 선택 ──
    function selectMenu(item) {
        document.querySelectorAll('.menu-item').forEach(function (el) {
            el.classList.remove('active');
        });
        item.classList.add('active');
    }

    // 사이드바 조절
    (function () {
        const sidebar = document.getElementById('sidebar');
        const handle = document.getElementById('resizeHandle');

        let isResizing = false;
        let startX = 0;
        let startWidth = 0;

        handle.addEventListener('mousedown', function (e) {
            isResizing = true;
            startX = e.clientX;
            startWidth = sidebar.offsetWidth;

            handle.classList.add('dragging');
            document.body.style.cursor = 'col-resize';
            document.body.style.userSelect = 'none';
        });

        document.addEventListener('mousemove', function (e) {
            if (!isResizing) return;

            const diff = e.clientX - startX;
            const newWidth = startWidth + diff;
            const minWidth = parseInt(getComputedStyle(sidebar).minWidth);
            const maxWidth = parseInt(getComputedStyle(sidebar).maxWidth);

            if (newWidth >= minWidth && newWidth <= maxWidth) {
                sidebar.style.width = newWidth + 'px';
            }
        });

        document.addEventListener('mouseup', function () {
            if (!isResizing) return;

            isResizing = false;
            handle.classList.remove('dragging');
            document.body.style.cursor = '';
            document.body.style.userSelect = '';
        });
    })();
</script>