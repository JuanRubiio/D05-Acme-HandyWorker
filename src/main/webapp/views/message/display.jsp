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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table>
	<tr>
		<th colspan=2><spring:message code="message.subject" />: <jstl:out value="${mess.getSubject()}" /></th>
	</tr>
	<tr>
		<td>
			<ul>
				<li><b><spring:message code="message.sender" />: </b>
					<p>
						<jstl:out value="${mess.getSender().getName()}" />
					</p></li>
				<li><b><spring:message code="message.recipient" />: </b>
					<p>
						<jstl:out value="${mess.getRecipient().getName()}" />
					</p></li>
				<li><b><spring:message code="message.moment" />: </b>
					<p>
						<fmt:formatDate value="${mess.getMoment()}" pattern="dd/MM/yyyy HH:mm" />
					</p></li>
			</ul>
		</td>
		<td>
			<ul>
				<li><b><spring:message code="message.body" />: </b>
					<p>
						<jstl:out value="${mess.getBody()}" />
					</p></li>
			</ul>
		</td>
		<td>
			<ul>
				<li><b><spring:message code="message.tags" />: </b>
					<p>
						<jstl:out value="${mess.getTags()}" />
					</p></li>
			</ul>
		</td>
	</tr>
</table>
<jstl:if test="${not empty folders}">
<h3><spring:message code="row.moveMessage"></spring:message></h3>

<form:form method="post" action="message/authenticate/move.do"
	modelAttribute="messageMoveForm">
	<form:hidden path="message" />
	<table>
		<thead>
			<tr>
				<td><div>
						<form:label path="folder">
							<spring:message code="row.folder" />
						</form:label>
						<form:select path="folder" items="${folders}" itemLabel="name" />
						&nbsp;
						<form:errors path="folder" cssClass="error" />
					</div></td>
				<td><input type="submit" name="save"
					value="<spring:message code="row.moveMessage"/>" /></td>
			</tr>
		</thead>
	</table>



</form:form>
</jstl:if>
<jstl:if test="${empty folders}">

<h2 style="color:blue"><spring:message code="not.folder.propi" /></h2>

</jstl:if>