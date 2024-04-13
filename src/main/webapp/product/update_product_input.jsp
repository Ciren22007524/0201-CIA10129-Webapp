<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ren.productcategory.service.*" %>
<%@ page import="com.ren.productcategory.model.*" %>
<%@ page import="com.ren.product.model.*" %>

<% //��com.product.com.controller.ProductServlet.java��163��s�Jreq��productVO���� (�����q��Ʈw���X��productVO, �]�i�H�O��J�榡�����~�ɪ�productVO����)
    ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>�ӫ~��ƭק� - update_product_input.jsp</title>

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
            <h3>�ӫ~��ƭק�</h3>
            <h4><a href="select_product.jsp">�^����</a></h4>
        </td>
    </tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
    <font style="color:red">�Эץ��H�U���~:</font>
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
            <td>�ӫ~�s��:</td>
            <td>
                <select size="1" name="productSelect" id="productSelect" onchange="updateProductDetails()">
                    <c:forEach var="productVO" items="${productSvc.all}">
                        <option value="${productVO.pNo}">${productVO.pNo}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>�ӫ~���O�s��:</td>
            <td><span name="pCatNo" id="pCatNo"><%= (productVO == null) ? "1" : productVO.getpCatNo() %></span></td>
        </tr>
        <tr>
            <td>�ӫ~�W��:</td>
            <td><input type="TEXT" name="pName" id="pName"
                       value="<%= (productVO == null)? "�uŨ�m" : productVO.getpName() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�ӫ~��T:</td>
            <td><input type="TEXT" name="pInfo" id="pInfo"
                       value="<%= (productVO == null)? "�u�u��Ũ�m" : productVO.getpInfo() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�ؤo:</td>
            <td><input type="TEXT" name="pSize" id="pSize"
                       value="<%= (productVO == null)? "1" : productVO.getpSize() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�C��:</td>
            <td><input type="TEXT" name="pColor" id="pColor"
                       value="<%= (productVO == null)? "�Ŧ�" : productVO.getpColor() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�ӫ~���:</td>
            <td><input type="TEXT" name="pPrice" id="pPrice"
                       value="<%= (productVO == null)? "5000" : productVO.getpPrice() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�ӫ~���A:</td>
            <td><input type="TEXT" name="pStat" id="pStat"
                       value="<%= (productVO == null)? "1" : productVO.getpStat() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�ӫ~�w��X�ƶq:</td>
            <td><input type="TEXT" name="pSalQty" id="pSalQty"
                       value="<%= (productVO == null)? "200" : productVO.getpSalQty() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�����`�H��:</td>
            <td><input type="TEXT" name="pComPeople" id="pComPeople"
                       value="<%= (productVO == null)? "50" : productVO.getpComPeople() %>" size="45"/></td>
        </tr>
        <tr>
            <td>�����`�P��:</td>
            <td><input type="TEXT" name="pComScore" id="pComScore"
                       value="<%= (productVO == null)? "3" : productVO.getpComScore() %>" size="45"/></td>
        </tr>

    </table>

    <br>

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="pNo" value="<%=productVO.getpNo()%>">
    <input type="submit" value="�e�X�ק�"></FORM>

<script>
    function updateProductDetails() {
        // ?��??���ӫ~??
        var selectedProductNo = document.getElementById('productSelect').value;

        // �ϥ� AJAX ?�D?���ӫ~��??�H��
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'product.do?action=getProductDetails', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                // ???���ѪR�ӫ~��??�H��
                var productDetails = JSON.parse(xhr.responseText);

                // ��s?������?�J�ح�
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

        // ?�ӫ~??�@??�D�^?�e
        var requestData = 'pNo=' + encodeURIComponent(selectedProductNo);
        xhr.send(requestData);
    }

</script>


</body>

</html>