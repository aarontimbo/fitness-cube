
<%@ page import="com.atimbo.meal.Meal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'meal.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="dateCreated" title="${message(code: 'meal.dateCreated.label', default: 'Date Created')}" />
                        
                            <g:sortableColumn property="lastUpdated" title="${message(code: 'meal.lastUpdated.label', default: 'Last Updated')}" />
                        
                            <g:sortableColumn property="note" title="${message(code: 'meal.note.label', default: 'Note')}" />
                        
                            <th><g:message code="meal.category.label" default="Category" /></th>
                        
                            <g:sortableColumn property="mealTime" title="${message(code: 'meal.mealTime.label', default: 'Meal Time')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mealInstanceList}" status="i" var="mealInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${mealInstance.id}">${fieldValue(bean: mealInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${mealInstance.dateCreated}" /></td>
                        
                            <td><g:formatDate date="${mealInstance.lastUpdated}" /></td>
                        
                            <td>${fieldValue(bean: mealInstance, field: "note")}</td>
                        
                            <td>${fieldValue(bean: mealInstance, field: "category")}</td>
                        
                            <td><g:formatDate date="${mealInstance.mealTime}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${mealInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
