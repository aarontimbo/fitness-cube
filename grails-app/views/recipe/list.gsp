
<%@ page import="com.atimbo.meal.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'recipe.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'recipe.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'recipe.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="servingMultiplier" title="${message(code: 'recipe.servingMultiplier.label', default: 'Serving Multiplier')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${recipeInstanceList}" status="i" var="recipeInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${recipeInstance.id}">${fieldValue(bean: recipeInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: recipeInstance, field: "servingMultiplier")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${recipeInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
