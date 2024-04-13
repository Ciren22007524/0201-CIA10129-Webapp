<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ren.administratorcategory.service.*"%>
<%@ page import="com.ren.administratorcategory.model.*"%>
<%@ page import="com.ren.administrator.model.*" %>

<% //��com.administrator.com.controller.ProductServlet.java��163��s�Jreq��adminitratorVO���� (�����q��Ʈw���X��adminitratorVO, �]�i�H�O��J�榡�����~�ɪ�adminitratorVO����)
   AdministratorVO adminitratorVO = (AdministratorVO) request.getAttribute("adminitratorVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�ӫ~��ƭק� - update_administrator_input.jsp</title>

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
		 <h3>�ӫ~��ƭק� - update_administrator_input.jsp</h3>
		 <h4><a href="select_administrator.jsp">�^����</a></h4>
	</td></tr>
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

<FORM METHOD="post" ACTION="administrator.do" name="form1">
<table>
	<tr>
		<td>�ӫ~�s��:</td>
		<td><input type="TEXT" name="admNo" value="<%= (adminitratorVO==null)? "10000001" : adminitratorVO.getadmNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="admName" value="<%= (adminitratorVO==null)? "�uŨ�m" : adminitratorVO.getadmName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~��T:</td>
		<td><input type="TEXT" name="pInfo" value="<%= (adminitratorVO==null)? "�u�u��Ũ�m" : adminitratorVO.getpInfo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ؤo:</td>
		<td><input type="TEXT" name="admStat" value="<%= (adminitratorVO==null)? "1" : adminitratorVO.getadmStat()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�C��:</td>
		<td><input type="TEXT" name="admEmail" value="<%= (adminitratorVO==null)? "�Ŧ�" : adminitratorVO.getadmEmail()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���:</td>
		<td><input type="TEXT" name="titleNo" value="<%= (adminitratorVO==null)? "5000" : adminitratorVO.gettitleNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���A:</td>
		<td><input type="TEXT" name="admHireDate" value="<%= (adminitratorVO==null)? "1" : adminitratorVO.getadmHireDate()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�w��X�ƶq:</td>
		<td><input type="TEXT" name="admPhoto" value="<%= (adminitratorVO==null)? "200" : adminitratorVO.getadmPhoto()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����`�H��:</td>
		<td><input type="TEXT" name="pComPeople" value="<%= (adminitratorVO==null)? "50" : adminitratorVO.getpComPeople()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�����`�P��:</td>
		<td><input type="TEXT" name="pComScore" value="<%= (adminitratorVO==null)? "3" : adminitratorVO.getpComScore()%>" size="45"/></td>
	</tr>					

	<jsp:useBean id="administratorCategorySvc" scope="page" class="com.ren.administratorcategory.service.ProductCategoryServiceImpl" />
	<tr>
		<td>�ӫ~���O�s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="admPwd">
			<c:forEach var="administratorCategoryVO" items="${administratorCategorySvc.all}">
				<option value="${administratorCategoryVO.admPwd}" ${(adminitratorVO.admPwd==administratorCategoryVO.admPwd)? 'selected':'' } >${administratorCategoryVO.pCatName}
			</c:forEach>
		</select></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="admNo" value="<%=adminitratorVO.getadmNo()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>