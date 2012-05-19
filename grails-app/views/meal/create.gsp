

<%@ page import="com.atimbo.meal.Meal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
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
            <g:hasErrors bean="${mealInstance}">
            <div class="errors">
                <g:renderErrors bean="${mealInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="profile"><g:message code="meal.profile.label" default="Profile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealInstance, field: 'profile', 'errors')}">
                                    <g:select name="profile.id" from="${com.atimbo.secure.Profile.list()}" optionKey="id" value="${mealInstance?.profile?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category"><g:message code="meal.category.label" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealInstance, field: 'category', 'errors')}">
                                    <g:select name="category.id" from="${com.atimbo.meal.MealCategory.list()}" optionKey="id" value="${mealInstance?.category?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mealTime"><g:message code="meal.mealTime.label" default="Meal Time" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealInstance, field: 'mealTime', 'errors')}">
                                    <%--<g:datePicker name="mealTime" precision="day" value="${mealInstance?.mealTime}"  />--%>
                                    <input id="mealTimeDatepicker" name="mealTime" type="text" value="<g:formatDate date='${new Date()}' format='MM/dd/yyyy' />"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="note"><g:message code="meal.note.label" default="Note" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealInstance, field: 'note', 'errors')}">
                                    <g:textArea name="note" cols="40" rows="5" value="${mealInstance?.note}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /> Create a meal and then add meal items...</span>
                </div>
            </g:form>
        </div>
    </body>
</html>
