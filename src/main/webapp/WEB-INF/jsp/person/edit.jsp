<%-- 
    Document   : edit
    Created on : Apr 22, 2011, 3:04:46 PM
    Author     : FMilens
--%>

<%@taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Person</title>
        <link rel="stylesheet" href="<c:url value="/static/css/bootstrap.min.css" />" />
        <script src="<c:url value="/static/js/jquery.min.js" />"></script>
        <script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
        <script src="<c:url value="/static/js/jquery.form-validator.min.js" />"></script>
    </head>
    <body>
    <div class="container">
        <h1>Edit Person</h1>
        <c:if test="${fn:length(errors) gt 0}">
            <p>Please correct the following errors in your submission:</p>
            <ul>
                <c:forEach items="${errors}" var="error">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form class="form-horizontal" action="${pageContext.request.contextPath}/person/edit" method="POST">
            <input type="hidden" name="personId" value="${person.personId}"/>
            <br/>
            <div class="form-group">
                <label class="control-label col-sm-2" for="firstName">First Name:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="1-50" data-validation="length" type="text" name="firstName" value="${person.firstName}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="lastName">Last Name:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="1-50" data-validation="length" type="text" name="lastName" value="${person.lastName}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="emailAddress">Email Address:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation="email" type="text" name="emailAddress" value="${person.emailAddress}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="streetAddress">Street Address:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="1-50" data-validation="length" type="text" name="streetAddress" value="${person.streetAddress}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="city">City:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="1-50" data-validation="length" type="text" name="city" value="${person.city}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="state">State:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="2-2" data-validation="length" type="text" name="state" value="${person.state}"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="zipCode">Zip Code:</label>
                <div class="col-sm-10">
                    <input class="form-control" data-validation-length="5-5" data-validation="length" type="text" name="zipCode" value="${person.zipCode}"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label for="isClient">
                            <input type="checkbox" name="isClient" <c:if test="${person.isClient}"> checked </c:if>/>
                            Is Client?
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <input class="btn btn-default" type="submit" name="Submit" value="Submit"/>
                </div>
            </div>
        </form>
    </div>
    <script>$.validate({validateOnBlur: true})</script>
    </body>
</html>
