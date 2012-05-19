

<%@ page import="com.atimbo.meal.Ingredient" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ingredientInstance}">
            <div class="errors">
                <g:renderErrors bean="${ingredientInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foodWeight"><g:message code="ingredient.foodWeight.label" default="Food Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'foodWeight', 'errors')}">
                                    <g:select name="foodWeight.id" from="${gov.usda.sr23.Weight.list()}" optionKey="id" value="${ingredientInstance?.foodWeight?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="ingredient.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${ingredientInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servings"><g:message code="ingredient.servings.label" default="Servings" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'servings', 'errors')}">
                                    <g:textField name="servings" value="${fieldValue(bean: ingredientInstance, field: 'servings')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sortOrder"><g:message code="ingredient.sortOrder.label" default="Sort Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredientInstance, field: 'sortOrder', 'errors')}">
                                    <g:textField name="sortOrder" value="${fieldValue(bean: ingredientInstance, field: 'sortOrder')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
