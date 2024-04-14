<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ren.administrator.service.*"%>
<%@ page import="com.ren.administrator.model.*"%>

<% //��com.administrator.com.controller.ProductServlet.java��163��s�Jreq��administratorVO���� (�����q��Ʈw���X��administratorVO, �]�i�H�O��J�榡�����~�ɪ�administratorVO����)
   AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO");
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
		<td><input type="TEXT" name="admNo" value="<%= (administratorVO==null)? "10000001" : administratorVO.getAdmNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="admPwd" value="<%= (administratorVO==null)? "�uŨ�m" : administratorVO.getAdmPwd()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~��T:</td>
		<td><input type="TEXT" name="admName" value="<%= (administratorVO==null)? "�u�u��Ũ�m" : administratorVO.getAdmName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ؤo:</td>
		<td><input type="TEXT" name="admStat" value="<%= (administratorVO==null)? "1" : administratorVO.getAdmStat()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�C��:</td>
		<td><input type="TEXT" name="admEmail" value="<%= (administratorVO==null)? "�Ŧ�" : administratorVO.getAdmEmail()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���:</td>
		<td><input type="TEXT" name="titleNo" value="<%= (administratorVO==null)? "5000" : administratorVO.getTitleNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~���A:</td>
		<td><input type="TEXT" name="admHireDate" value="<%= (administratorVO==null)? "1" : administratorVO.getAdmHireDate()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�w��X�ƶq:</td>
		<td><input type="TEXT" name="admPhoto" value="<%= (administratorVO==null)? "200" : administratorVO.getAdmPhoto()%>" size="45"/></td>
	</tr>

	<jsp:useBean id="administratorCategorySvc" scope="page" class="com.ren.administrator.service.AdministratorServiceImpl" />
	<tr>
		<td>�ӫ~���O�s��:<font color=red><b>*</b></font></td>
		<td><select size="1" name="admPwd">
			<c:forEach var="administratorCategoryVO" items="${administratorCategorySvc.all}">
				<option value="${administratorCategoryVO.admPwd}" ${(administratorVO.admPwd==administratorCategoryVO.admPwd)? 'selected':'' } >${administratorCategoryVO.pCatName}
			</c:forEach>
		</select></td>
	</tr>
</table>

<br>

<input type="hidden" name="action" value="update">
<input type="hidden" name="admNo" value="<%=administratorVO.getAdmNo()%>">
<input type="submit" value="�e�X�ק�"></FORM>

</body>

</html>