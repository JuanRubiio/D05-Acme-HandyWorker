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

<display:table name="message boxes" id="row" pagesize="5" requestURI="${requestUri}" class="displaytag">
	
	<spring:message code="messagebox.name" var="name" />
	<display:column title="${name}" property="name" />
	
	<spring:message code="messagebox.list" var="view" />
	<display:column title="${view}">
			<input type="button" value="<spring:message code="messagebox.view" />" 
					onclick="javascript: window.location.assign('message/authenticate/list.do?messageBoxId=${row.id}')" />
	</display:column>
	
	<spring:message code="messagebox.edit" var="edit" />
	<display:column title="${edit}">
		<jstl:if test="${!row.system}">
			<input type="button" value="<spring:message code="messagebox.edit" />" 
					onclick="javascript: window.location.assign('messagebox/authenticate/edit.do?messageBoxId=${row.id}')" />
		</jstl:if>				
	</display:column>	
	
</display:table>

	<input type="button" name="create" value="<spring:message code="messagebox.create" />"
	 onclick="javascript: window.location.assign('messagebox/authenticate/create.do')" />
	 
	<input type="button" name="createM" value="<spring:message code="messagebox.message.create" />"
	 onclick="javascript: window.location.assign('message/authenticate/create.do')" />
