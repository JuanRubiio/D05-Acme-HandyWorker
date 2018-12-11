<%--
 * action-1.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1> <jstl:out value="${folder.name}"/> </h1>

<display:table name="messages" id="row" pagesize="5" requestURI="${requestUri}" class="displaytag">
	
	<spring:message code="message.subject" var="subject" />
	<display:column title="${subject}" property="subject" />
	
	<spring:message code="message.moment" var="moment" />
	<display:column title="${moment}" >
		<fmt:formatDate value="${row.getMoment()}" pattern="dd/MM/yyyy HH:mm" />
	</display:column>	
	
	<spring:message code="message.sender" var="sender" />
	<display:column title="${sender}" property="sender.name" />
	
	<spring:message code="message.priority" var="priority" />
	<display:column title="${priority}">
		<spring:message code="message.${row.priority }"/>
	</display:column>
	
	<spring:message code="message.display" var="display" />
	<display:column title="${display}">
			<input type="button" value="<spring:message code="message.display" />" 
					onclick="javascript: window.location.assign('message/authenticate/display.do?messageId=${row.id}')" />
	</display:column>
	
	<jstl:if test="${!folder.name.equals('Spambox') && !folder.name.equals('Trashbox')}">
	<spring:message code="message.move" var="move" />
	<display:column title="${move}">
			<input type="button" value="<spring:message code="message.spam" />" 
					onclick="javascript: window.location.assign('message/authenticate/spam.do?messageId=${row.id}')" />
	</display:column>
	</jstl:if>
	
	<spring:message code="message.delete" var="delete" />
	<display:column title="${delete}">
		<a href="message/authenticate/delete.do?messageId=${row.id}">
		<jstl:choose>
			<jstl:when test="${row.folder.name == \"Trashbox\"}">
				<input type="button" value="<spring:message code="message.delete" />" 
				onclick="return confirm('<spring:message code="message.confirm.delete.final" />')" />
			</jstl:when>
			<jstl:otherwise>
				<input type="button" value="<spring:message code="message.delete" />" 
				onclick="return confirm('<spring:message code="message.confirm.delete" />')" />
			</jstl:otherwise>	
		</jstl:choose>
		
		</a>	
	</display:column>
</display:table>
<br/>

<input type="button" value="<spring:message code="message.back" />" 
onclick="javascript: window.location.assign('messagebox/authenticate/list.do')" />
