<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/gossip.css" type="text/css">
    <title>�|���ӽ�</title>
</head>
<body>

<h1>�|���ӽ�</h1>
<form method='post' name='action' value='register'>
    <table>

        <tr>
            <td>�W�١]�̤j 16 �r���^�G</td>
            <td><input type='text' name='username' size='25' maxlength='16'></td>
            <td><button></button></td>
        </tr>
        <tr>
            <td>�K�X�]8 �� 16 �r���^�G</td>
            <td><input type='password' name='password' size='25' maxlength='16'></td>
            <td><button></button></td>
        </tr>
        <tr>
            <td>�T�{�K�X�G</td>
            <td><input type='password' name='password2' size='25' maxlength='16'></td>
        </tr>
        <tr>
            <td>�l���}�G</td>
            <td><input type='text' name='email' size='25' maxlength='100'></td>
            <td><button></button></td>
        </tr>
        <tr>
            <td colspan='2' align='center'><input type='submit' value='�e�X'></td>
        </tr>
    </table>
</form>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
    <font style="color: red">�Эץ��H�U���~:</font>
    <ul>
        <c:forEach var="message" items="${errorMsgs}">
            <li style="color: red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<script>

</script>

</body>
</html>