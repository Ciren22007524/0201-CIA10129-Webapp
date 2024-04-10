<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ren.product.service.*" %>
<%@ page import="com.ren.product.model.ProductVO" %>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  ProductVO productVO = (ProductVO) request.getAttribute("productVO"); //ProductServlet.java(Concroller), �s�Jreq��productVO����
%>

<html>
<head>
<title>�ӫ~��� - listOneProduct.jsp</title>

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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�ӫ~��� - listOneProduct.jsp</h3>
		 <h4><a href="select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~���O�s��</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~��T</th>
		<th>�ؤo</th>
		<th>�C��</th>
		<th>�ӫ~���</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~�w��X�ƶq</th>
		<th>�����`�H��</th>
		<th>�����`�P��</th>
	</tr>
	<tr>
		<td>${productVO.pNo}</td>
		<td>${productVO.pCatNo}</td>
		<td>${productVO.pName}</td>
		<td>${productVO.pInfo}</td>
		<td>${productVO.pSize}</td>
		<td>${productVO.pColor}</td>
		<td>${productVO.pPrice}</td>
		<td>${productVO.pStat}</td>
		<td>${productVO.pSalQty}</td>
		<td>${productVO.pComPeople}</td>
		<td>${productVO.pComScore}</td>
	</tr>
</table>

</body>
</html>