<%--
    Document   : create
    Created on : 1/11/2018 5:51 PM
    Author     : Bilgehan Saglik
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<html>
<head>
    <title>Contacts</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/person/list">Go back to person listing</a>
    <h1>Contacts Listing: </h1>
    <c:if test="${fn:length(errors) gt 0}">
        <p>Please correct the following errors in your submission:</p>
        <ul>
            <c:forEach items="${errors}" var="error">
                <li>${error}</li>
            </c:forEach>
        </ul>
    </c:if>
    <h2>Associated contacts of ${person.firstName} ${person.lastName}</h2>
    <c:choose>
        <c:when test="${fn:length(contacts) gt 0}">
            <table>
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Is Client?</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${contacts}" var="contact">
                    <tr>
                        <td>${contact.firstName}</td>
                        <td>${contact.lastName}</td>
                        <td>${contact.emailAddress}</td>
                        <td>${contact.isClient}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/person/edit/${contact.personId}">Edit Person</a>
                            <a href="${pageContext.request.contextPath}/person/delete/${contact.personId}">Delete Person</a>
                            <a href="${pageContext.request.contextPath}/person/contacts/${contact.personId}">View Contacts</a>
                            <form action="${pageContext.request.contextPath}/person/contacts/remove" method="POST">
                                <input type="hidden" name="personId" value="${person.personId}"/>
                                <input type="hidden" name="contactId" value="${contact.personId}"/>
                                <input type="submit" name="removeContact" value="Remove Contact"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No contacts found.</p>
        </c:otherwise>
    </c:choose>
    <h2>Add Contact</h2>
    <c:choose>
        <c:when test="${fn:length(addableContacts) gt 0}">
            <table>
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Is Client?</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${addableContacts}" var="contact">
                    <tr>
                        <td>${contact.firstName}</td>
                        <td>${contact.lastName}</td>
                        <td>${contact.emailAddress}</td>
                        <td>${contact.isClient}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/person/edit/${contact.personId}">Edit Person</a>
                            <a href="${pageContext.request.contextPath}/person/delete/${contact.personId}">Delete Person</a>
                            <a href="${pageContext.request.contextPath}/person/contacts/${contact.personId}">View Contacts</a>
                            <form action="${pageContext.request.contextPath}/person/contacts/add" method="POST">
                                <input type="hidden" name="personId" value="${person.personId}"/>
                                <input type="hidden" name="contactId" value="${contact.personId}"/>
                                <input type="submit" name="addContact" value="Add Contact"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p>No contacts found.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
