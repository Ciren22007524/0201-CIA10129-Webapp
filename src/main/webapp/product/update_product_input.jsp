<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ren.productcategory.service.*" %>
<%@ page import="com.ren.productcategory.model.*" %>
<%@ page import="com.ren.product.model.*" %>

<% //見com.product.com.controller.ProductServlet.java第163行存入req的productVO物件 (此為從資料庫取出的productVO, 也可以是輸入格式有錯誤時的productVO物件)
    ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>商品資料修改 - update_product_input.jsp</title>

    <style>
        table#table-1 {
            background-color: #CCCCFF;
            border: 2px solid black;
            text-align: center;
        }

        table#table-1 h4 {
            color: red;
            display: block;
            margin-bottom: 1px;
        }

        h4 {
            color: blue;
            display: inline;
        }
    </style>

    <style>
        table {
            width: 450px;
            background-color: white;
            margin-top: 1px;
            margin-bottom: 1px;
        }

        table, th, td {
            border: 0px solid #CCCCFF;
        }

        th, td {
            padding: 1px;
        }
    </style>

</head>
<body bgcolor='white'>

<table id="table-1">
    <tr>
        <td>
            <h3>商品資料修改</h3>
            <h4><a href="select_product.jsp">回首頁</a></h4>
        </td>
    </tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<FORM METHOD="post" ACTION="product.do" name="form1">

    <jsp:useBean id="productSvc" scope="page"
                 class="com.ren.product.service.ProductServiceImpl"/>

    <table>
        <tr>
            <td>商品編號:</td>
            <td>
                <select size="1" name="productSelect" id="productSelect" onchange="updateProductDetails()">
                    <c:forEach var="productVO" items="${productSvc.all}">
                        <option value="${productVO.pNo}">${productVO.pNo}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>商品類別編號:</td>
            <td><span name="pCatNo" id="pCatNo"><%= (productVO == null) ? "1" : productVO.getpCatNo() %></span></td>
        </tr>
        <tr>
            <td>商品名稱:</td>
            <td><input type="TEXT" name="pName" id="pName"
                       value="<%= (productVO == null)? "短襯衫" : productVO.getpName() %>" size="45"/></td>
        </tr>
        <tr>
            <td>商品資訊:</td>
            <td><input type="TEXT" name="pInfo" id="pInfo"
                       value="<%= (productVO == null)? "短短的襯衫" : productVO.getpInfo() %>" size="45"/></td>
        </tr>
        <tr>
            <td>尺寸:</td>
            <td><input type="TEXT" name="pSize" id="pSize"
                       value="<%= (productVO == null)? "1" : productVO.getpSize() %>" size="45"/></td>
        </tr>
        <tr>
            <td>顏色:</td>
            <td><input type="TEXT" name="pColor" id="pColor"
                       value="<%= (productVO == null)? "藍色" : productVO.getpColor() %>" size="45"/></td>
        </tr>
        <tr>
            <td>商品單價:</td>
            <td><input type="TEXT" name="pPrice" id="pPrice"
                       value="<%= (productVO == null)? "5000" : productVO.getpPrice() %>" size="45"/></td>
        </tr>
        <tr>
            <td>商品狀態:</td>
            <td><input type="TEXT" name="pStat" id="pStat"
                       value="<%= (productVO == null)? "1" : productVO.getpStat() %>" size="45"/></td>
        </tr>
        <tr>
            <td>商品已售出數量:</td>
            <td><input type="TEXT" name="pSalQty" id="pSalQty"
                       value="<%= (productVO == null)? "200" : productVO.getpSalQty() %>" size="45"/></td>
        </tr>
        <tr>
            <td>評價總人數:</td>
            <td><input type="TEXT" name="pComPeople" id="pComPeople"
                       value="<%= (productVO == null)? "50" : productVO.getpComPeople() %>" size="45"/></td>
        </tr>
        <tr>
            <td>評價總星數:</td>
            <td><input type="TEXT" name="pComScore" id="pComScore"
                       value="<%= (productVO == null)? "3" : productVO.getpComScore() %>" size="45"/></td>
        </tr>

    </table>

    <br>

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="pNo" value="<%=productVO.getpNo()%>">
    <input type="submit" value="送出修改"></FORM>

<script>
    function updateProductDetails() {
        // ?取??的商品??
        var selectedProductNo = document.getElementById('productSelect').value;

        // 使用 AJAX ?求?取商品的??信息
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'product.do?action=getProductDetails', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // ???中解析商品的??信息
                var productDetails = JSON.parse(xhr.responseText);

                // 更新?面中的?入框值
                document.getElementById('pCatNo').textContent = productDetails.pCatNo;
                document.getElementById('pName').value = productDetails.pName;
                document.getElementById('pInfo').value = productDetails.pInfo;
                document.getElementById('pSize').value = productDetails.pSize;
                document.getElementById('pColor').value = productDetails.pColor;
                document.getElementById('pPrice').value = productDetails.pPrice;
                document.getElementById('pStat').value = productDetails.pStat;
                document.getElementById('pSalQty').value = productDetails.pSalQty;
                document.getElementById('pComPeople').value = productDetails.pComPeople;
                document.getElementById('pComScore').value = productDetails.pComScore;
            } else {
                console.error('Failed to fetch product details');
            }
        };

        // ?商品??作??求体?送
        var requestData = 'pNo=' + encodeURIComponent(selectedProductNo);
        xhr.send(requestData);
    }

</script>


</body>

</html>