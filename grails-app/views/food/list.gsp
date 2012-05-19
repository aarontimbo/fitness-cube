
<%@ page import="gov.usda.sr23.Food" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'food.label', default: 'Food')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'food.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'food.saturatedFat.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="foodCategory" title="${message(code: 'food.foodCategory.label', default: 'Category')}" />
                        
                            <g:sortableColumn property="calories" title="${message(code: 'food.calories.label', default: 'Calories')}" />
                        
                            <g:sortableColumn property="fat" title="${message(code: 'food.fat.label', default: 'Fat')}" />
                        
                            <g:sortableColumn property="carbohydrate" title="${message(code: 'food.carbohydrate.label', default: 'Carbohydrate')}" />
                        
                            <g:sortableColumn property="protein" title="${message(code: 'food.protein.label', default: 'Protein')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${foodInstanceList}" status="i" var="foodInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${foodInstance.id}">${fieldValue(bean: foodInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "foodCategory")}</td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "calories")}</td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "fat")}</td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "carbohydrate")}</td>
                        
                            <td>${fieldValue(bean: foodInstance, field: "protein")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${foodInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
