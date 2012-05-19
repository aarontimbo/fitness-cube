

<%@ page import="com.atimbo.meal.MealItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mealItem.label', default: 'MealItem')}" />
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
            <g:hasErrors bean="${mealItemInstance}">
            <div class="errors">
                <g:renderErrors bean="${mealItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recipe"><g:message code="mealItem.recipe.label" default="Recipe" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealItemInstance, field: 'recipe', 'errors')}">
                                    <g:select name="recipe.id" from="${com.atimbo.meal.Recipe.list()}" optionKey="id" value="${mealItemInstance?.recipe?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foodWeight"><g:message code="mealItem.foodWeight.label" default="Food Weight" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealItemInstance, field: 'foodWeight', 'errors')}">
                                    <g:select name="foodWeight.id" from="${gov.usda.sr23.Weight.list()}" optionKey="id" value="${mealItemInstance?.foodWeight?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="meal"><g:message code="mealItem.meal.label" default="Meal" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealItemInstance, field: 'meal', 'errors')}">
                                    <g:select name="meal.id" from="${com.atimbo.meal.Meal.list()}" optionKey="id" value="${mealItemInstance?.meal?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servings"><g:message code="mealItem.servings.label" default="Servings" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealItemInstance, field: 'servings', 'errors')}">
                                    <g:textField name="servings" value="${fieldValue(bean: mealItemInstance, field: 'servings')}" />
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
