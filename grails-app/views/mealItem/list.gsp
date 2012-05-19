
<%@ page import="com.atimbo.meal.MealItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mealItem.label', default: 'MealItem')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'mealItem.id.label', default: 'Id')}" />
                        
                            <th><g:message code="mealItem.recipe.label" default="Recipe" /></th>
                        
                            <th><g:message code="mealItem.foodWeight.label" default="Food Weight" /></th>
                        
                            <th><g:message code="mealItem.meal.label" default="Meal" /></th>
                        
                            <g:sortableColumn property="servings" title="${message(code: 'mealItem.servings.label', default: 'Servings')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mealItemInstanceList}" status="i" var="mealItemInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${mealItemInstance.id}">${fieldValue(bean: mealItemInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: mealItemInstance, field: "recipe")}</td>
                        
                            <td>${fieldValue(bean: mealItemInstance, field: "foodWeight")}</td>
                        
                            <td>${fieldValue(bean: mealItemInstance, field: "meal")}</td>
                        
                            <td>${fieldValue(bean: mealItemInstance, field: "servings")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${mealItemInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
