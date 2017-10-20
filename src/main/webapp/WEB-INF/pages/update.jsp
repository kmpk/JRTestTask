<%@ page session="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Update book</title>

    <style type="text/css">
        input {
            display: block;
        }
        input.authorInput{
            background-color: #818182;
        }
        textarea{
            resize: none;
            display: block;
            width: 300px;
            height: 60px;
        }
    </style>
</head>
<div class="w3-container">
    <h1>Update book</h1>
    <c:url var="submitUpdateAction" value="/update/submit/"/>
    <form action="${submitUpdateAction}" method="post">
        <input type="hidden" name="titleSearch" value="${search[0]}">
        <input type="hidden" name="authorSearch" value="${search[1]}">
        <input type="hidden" name="isbnSearch" value="${search[2]}">
        <input type="hidden" name="yearSearch" value="${search[3]}">
        <input type="hidden" name="readSearch" value="${search[4]}">
        <input type="hidden" name="page" value="${page}">
        <input type="hidden" name="id" value="${book.id}">
        <input type="hidden" name="action" value="update">

        <label for="title">Title : </label>
        <input id="title" name="title" value="${book.title}" maxlength="100"/>

        <label for="description">Description : </label>
        <textarea id="description" name="description" maxlength="255">${book.description}</textarea>

        <label for="author">Author : </label>
        <input class="authorInput" id="author" readonly name="author" value="${book.author}"/>

        <label for="isbn">ISBN : </label>
        <input id="isbn" name="isbn" value="${book.isbn}" maxlength="20"/>

        <label for="printYear">Print year : </label>
        <input id="printYear" name="printYear" value="${book.printYear}" maxlength="4"/>

        <label for="readAlready">Read already : </label>
        <input type="checkbox" id="readAlready" name="readAlready"
        <c:if test="${book.readAlready}"> checked=""</c:if> disabled>
        <input type="submit" value="Update book"/>
    </form>
    <c:url var="submitUpdateAction" value="/update/submit/"/>
    <form action="${submitUpdateAction}" method="post">
        <input type="hidden" name="titleSearch" value="${search[0]}">
        <input type="hidden" name="authorSearch" value="${search[1]}">
        <input type="hidden" name="isbnSearch" value="${search[2]}">
        <input type="hidden" name="yearSearch" value="${search[3]}">
        <input type="hidden" name="readSearch" value="${search[4]}">
        <input type="hidden" name="action" value="read">
        <input type="hidden" name="page" value="${page}">
        <input type="hidden" name="id" value="${book.id}">
    <input type="submit" value="Read book" />
    </form>
</div>
</html>