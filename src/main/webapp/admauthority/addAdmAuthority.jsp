<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.ren.product.model.AdmAuthorityVO" %>

<% //��com.product.com.controller.ProductServlet.java��238��s�Jreq��admAuthorityVO���� (������J�榡�����~�ɪ�admAuthorityVO����)
   AdmAuthorityVO admAuthorityVO = (AdmAuthorityVO) request.getAttribute("admAuthorityVO");
%>
--<%= admAuthorityVO==null %>--${admAuthorityVO.pCatNo}-- <!-- line 100 -->
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W - addAdmAuthority.jsp</title>

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
	<tr><td>
		 <h3>���u��Ʒs�W - addAdmAuthority.jsp</h3></td><td>
		 <h4><a href="select_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="admAuthority.do" name="form1">
<table>
	
	
	
	
<!-- 	<tr> -->
<!-- 		<td>�ӫ~�s��:</td> -->
<%-- 		<td><input type="TEXT" name="pNo" value="<%= (admAuthorityVO==null)? "10000001" : admAuthorityVO.getpNo()%>" size="45"/></td> --%>
<!-- 	</tr> -->
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="pName" value="<%= (admAuthorityVO==null)? "�uŨ�m" : admAuthorityVO.getpName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~��T:</td>
		<td><input type="TEXT" name="pInfo" value="<%= (admAuthorityVO==null)? "�u�u��Ũ�m" : admAuthorityVO.getpInfo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ؤo:</td>
		<td><input type="TEXT" name="pSize" value="<%= (admAuthorityVO==null)? "1" : admAuthorityVO.getpSize()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�C��:</td>
		<td><input type="TEXT" name="pColor" value="<%= (admAuthorityVO==null)? "�Ŧ�" : admAuthorityVO.getpColor()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���:</td>
		<td><input type="TEXT" name="pPrice" value="<%= (admAuthorityVO==null)? "5000" : admAuthorityVO.getpPrice()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���A:</td>
		<td><input type="TEXT" name="pStat" value="<%= (admAuthorityVO==null)? "1" : admAuthorityVO.getpStat()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�w��X�ƶq:</td>
		<td><input type="TEXT" name="pSalQty" value="<%= (admAuthorityVO==null)? "200" : admAuthorityVO.getpSalQty()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����`�H��:</td>
		<td><input type="TEXT" name="pComPeople" value="<%= (admAuthorityVO==null)? "50" : admAuthorityVO.getpComPeople()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����`�P��:</td>
		<td><input type="TEXT" name="pComScore" value="<%= (admAuthorityVO==null)? "3" : admAuthorityVO.getpComScore()%>" size="45"/></td>
	</tr>					

	<jsp:useBean id="productCategorySvc" scope="page" class="com.ren.productcategory.service.ProductCategoryServiceImpl" />
	<tr>
		<td>�ӫ~���O�s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="pCatNo">
			<c:forEach var="productCategoryVO" items="${productCategorySvc.all}">
				<option value="${productCategoryVO.pCatNo}" ${(admAuthorityVO.pCatNo==productCategoryVO.pCatNo)? 'selected':'' } >${productCategoryVO.pCatName}
			</c:forEach>
		</select></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

</body>
</html>