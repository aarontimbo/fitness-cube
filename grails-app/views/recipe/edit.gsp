

<%@ page import="com.atimbo.meal.Recipe" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'recipe.label', default: 'Recipe')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${recipeInstance}">
            <div class="errors">
                <g:renderErrors bean="${recipeInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${recipeInstance?.id}" />
                <g:hiddenField name="version" value="${recipeInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="recipe.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" cols="40" rows="5" value="${recipeInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ingredients"><g:message code="recipe.ingredients.label" default="Ingredients" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'ingredients', 'errors')}">
                                    <g:select name="ingredients" from="${com.atimbo.meal.Ingredient.list()}" multiple="yes" optionKey="id" size="5" value="${recipeInstance?.ingredients*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="instructions"><g:message code="recipe.instructions.label" default="Instructions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'instructions', 'errors')}">
                                    
<ul>
<g:each in="${recipeInstance?.instructions?}" var="i">
    <li><g:link controller="recipeInstruction" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="recipeInstruction" action="create" params="['recipe.id': recipeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'recipeInstruction.label', default: 'RecipeInstruction')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="recipe.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${recipeInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="servingMultiplier"><g:message code="recipe.servingMultiplier.label" default="Serving Multiplier" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: recipeInstance, field: 'servingMultiplier', 'errors')}">
                                    <g:textField name="servingMultiplier" value="${fieldValue(bean: recipeInstance, field: 'servingMultiplier')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
