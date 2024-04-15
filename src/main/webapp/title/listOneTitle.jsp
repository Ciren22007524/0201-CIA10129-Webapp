<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ren.product.service.*" %>
<%@ page import="com.ren.product.model.AdministratorVO" %>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
    AdministratorVO administratorVO = (AdministratorVO) request.getAttribute("administratorVO"); //ProductServlet.java(Concroller), �s�Jreq��administratorVO����
%>

<html>
<head>
    <title>�ӫ~��� - listOneAdministrator.jsp</title>

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

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
    <tr>
        <td>
            <h3>�浧�ӫ~���</h3>
            <h4><a class="icon-link" href="select_title.jsp">
                <i class="fa-solid fa-house">����</i>
            </a></h4>
        </td>
    </tr>
</table>

<div style="display: flex; flex-direction: row;">
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
            <th>�ק�</th>
            <th>�R��</th>
        </tr>
        <tr>
            <td>${administratorVO.pNo}</td>
            <td>${administratorVO.pCatNo}</td>
            <td>${administratorVO.pName}</td>
            <td>${administratorVO.pInfo}</td>
            <td>${administratorVO.pSize}</td>
            <td>${administratorVO.pColor}</td>
            <td>${administratorVO.pPrice}</td>
            <td>${administratorVO.pStat}</td>
            <td>${administratorVO.pSalQty}</td>
            <td>${administratorVO.pComPeople}</td>
            <td>${administratorVO.pComScore}</td>
            <td>
                <form METHOD="post" ACTION="<%=request.getContextPath()%>/administrator/administrator.do"
                      style="margin-bottom: 0px;">
                    <button type="submit">
                        <i class="fa-solid fa-pen-to-square"></i>
                        <input type="hidden" name="pNo" value="${administratorVO.pNo}">
                        <input type="hidden" name="action" value="getOne_For_Update">
                </form>
            </td>
            <td>
                <form id="deleteForm" method="post" action="<%=request.getContextPath()%>/administrator/administrator.do" style="margin-bottom: 0px;">
                    <button type="button" onclick="confirmDelete()">
                        <i class="fa-solid fa-trash-can"></i>
                        <input type="hidden" name="pNo" value="${administratorVO.pNo}">
                        <input type="hidden" name="action" value="delete">
                    </button>
                </form>
            </td>
        </tr>
    </table>
</div>

<script>
    function confirmDelete() {
        if (confirm("�T�w�n�R���ܡH")) {
            document.getElementById("deleteForm").submit(); // �e�X���
            alert("�R�����\�I"); // �u�X���\�T��!
            // window.location.href = "select_administrator.jsp"; // �ɤަܭ���
        }
    }
</script>

</body>

</html>