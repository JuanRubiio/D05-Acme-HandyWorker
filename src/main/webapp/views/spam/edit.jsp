<%--
 * action-1.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<form:form action="spam/administrator/create.do" 
	modelAttribute="spam" method="post">
	<form:hidden path="id"/>
	<form:hidden path="version" />	

	
	<acme:textbox code="spam.spamWords" path="spamWords" />
	
	
	<br>		
	
	<input type="submit" name="save"
		value="<spring:message code="spam.save"/>" />

	<input type="button" name="cancel"
		value="<spring:message code="spam.cancel" />"
		onclick="javascript: relativeRedir('spam/administrator/list.do');" />
	<br />

</form:form>
