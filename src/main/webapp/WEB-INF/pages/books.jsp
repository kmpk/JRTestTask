<%@ page session="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Books</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
    <style type="text/css">
        a:link {
            text-decoration: none;
        }
        .current {
            background-color: #404e80;
            text-align: center;
            color: aliceblue;
        }
        a.current {
            color: aliceblue;
        }
        table {
            border-collapse: collapse;
        }
        td {
            word-wrap: break-word;
        }
        table, th, td {
            border: 1px solid black;
            padding: 1px;
            text-align: center;
        }
        th {
            color: #5A7680;
        }
        input {
            display: block;
        }
    </style>
</head>
<body>
<div class="w3-container">
    <h1>Search</h1>
    <form action="<c:url value="/search"/>">
        <c:if test="${empty search[0]&&empty search[1]&&empty search[2]&&empty search[3]&&empty search[4]}">
            <input type="hidden" id="hiddenField" name="page" value="1">
            <label for="title">Title:</label>
            <input id="title" name="title" value="${search[0]}" maxlength="100"/>
            <label for="author">Author:</label>
            <input id="author" name="author" value="${search[1]}" maxlength="100"/>
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" value="${search[2]}" maxlength="20"/>
            <label for="year">Print year:</label>
            <input id="year" name="year" value="${search[3]}" maxlength="4"/>
            <label for="read">Already read:</label>
            <select id="read" name="read">
                <option value="" ${search[4] == '' ? 'selected' : ''}>not specified</option>
                <option value="true" ${search[4] == 'true' ? 'selected' : ''} >yes</option>
                <option value="false" ${search[4] == 'false' ? 'selected' : ''} >no</option>
            </select>
            <input type="submit" value="Search"/>
        </c:if>
        <c:if test="${not empty search[0]|| not empty search[1]||not empty search[2]|| not empty search[3]||not empty search[4]}">
            <input type="hidden" id="hiddenField" name="read" value="${search[4]}">
            <label for="title">Title:</label>
            <input id="title" name="title" value="${search[0]}" maxlength="100" readonly/>
            <label for="author">Author:</label>
            <input id="author" name="author" value="${search[1]}" maxlength="100" readonly/>
            <label for="isbn">ISBN:</label>
            <input id="isbn" name="isbn" value="${search[2]}" maxlength="20" readonly/>
            <label for="year">Print year:</label>
            <input id="year" name="year" value="${search[3]}" maxlength="4" readonly/>
            <label for="read">Already read:</label>
            <select id="read" disabled name="read">
                <option value="" ${search[4] == '' ? 'selected' : ''}>not specified</option>
                <option value="true" ${search[4] == 'true' ? 'selected' : ''} >yes</option>
                <option value="false" ${search[4] == 'false' ? 'selected' : ''} >no</option>
            </select>
            <a href="<c:url value="/books/1"/>"><input type="button" value="Clear"/></a>
        </c:if>
    </form>
    <c:if test="${booksCount == 0}">
        <p style="text-align: center; font-size: medium">No books found</p>
    </c:if>
    <br/>
</div>


    <div class="w3-container mainTable" style="overflow-x:auto;">
        <h1>Books</h1>
        <table class="w3-table-all" width="10%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Author</th>
                <th>ISBN</th>
                <th>Print year</th>
                <th>Already read</th>
                <th colspan="2"></th>
            </tr>
            <c:forEach items="${listBooks}" var="books">
                <tr>
                    <td>${books.id}</td>
                    <td>${books.title}</td>
                    <td>${books.description}</td>
                    <td>${books.author}</td>
                    <td>${books.isbn}</td>
                    <td>${books.printYear}</td>
                    <td><input type="checkbox" name="checkBox" id="checkBox"
                    <c:if test="${books.readAlready}"> checked=""</c:if> disabled></td>
                    <c:if test="${empty search[0]&&empty search[1]&&empty search[2]&&empty search[3]&&empty search[4]}">
                        <td><a href="<c:url value="/update/${books.id}&${page}"/>">Update</a></td>
                        <td><a href="<c:url value="/delete/${books.id}&${page}"/>">Delete</a></td>
                    </c:if>
                    <c:if test="${not empty search[0]|| not empty search[1]||not empty search[2]|| not empty search[3]||not empty search[4]}">
                        <td>
                            <a href="<c:url value="/update/${books.id}&${page}?title=${search[0]}&author=${search[1]}&isbn=${search[2]}&year=${search[3]}&read=${search[4]}"/>">Update</a>
                        </td>
                        <td>
                            <a href="<c:url value="/delete/${books.id}&${page}?title=${search[0]}&author=${search[1]}&isbn=${search[2]}&year=${search[3]}&read=${search[4]}"/>">Delete</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            <tr>
                <c:url var="addAction" value="/books/add"/>
                <form:form action="${addAction}" commandName="book" acceptCharset="UTF-8" method="post">
                    <td></td>
                    <td><form:input path="title" maxlength="100"/></td>
                    <td><form:textarea cssStyle="width: 100%;height: 60px ;resize: none" path="description" maxlength="255"/></td>
                    <td><form:input path="author" maxlength="100"/></td>
                    <td><form:input cssStyle="width: 160px" path="isbn" maxlength="20"/></td>
                    <td><form:input cssStyle="width: 80px" path="printYear" maxlength="4"/></td>
                    <td><!--input type="checkbox" name="checkBoxAdd" id="alreadyReadCheckBox"--></td>
                    <td colspan="2"><input type="submit" value="Add book"/></td>
                </form:form>
            </tr>
            <tr>
            </tr>
        </table>
        <br/>
        <div class="w3-container">
            <table>
                <tr>
                    <td>Page:</td>
                    <c:forEach begin="${1}" end="${(booksCount/10) + (booksCount%10==0?0:1)}" var="i">
                        <td width="10" <c:if test="${page == i}"> class="current" </c:if>>
                            <c:if test="${empty search[0]&&empty search[1]&&empty search[2]&&empty search[3]&&empty search[4]}">
                                <a href="<c:url value="/books/${i}" />"
                                        <c:if test="${page == i}"> class="current" </c:if>> ${i} </a>
                            </c:if>
                            <c:if test="${not empty search[0]||not empty search[1]||not empty search[2]||not empty search[3]||not empty search[4]}">
                                <a href="<c:url value="/search?page=${i}&title=${search[0]}&author=${search[1]}&isbn=${search[2]}&year=${search[3]}&read=${search[4]}" />"
                                        <c:if
                                                test="${page == i}"> class="current" </c:if>> ${i} </a>
                            </c:if>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
