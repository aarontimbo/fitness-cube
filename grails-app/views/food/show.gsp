
<%@ page import="gov.usda.sr23.Food" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'food.label', default: 'Food')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1>${foodInstance}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <%--<tr class="prop">
                            <td valign="top" class="name"><g:message code="food.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "name")}</td>
                            
                        </tr>--%>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.foodCategory.label" default="Food Category" /></td>
                            
                            <td valign="top" class="value"><g:link controller="foodCategory" action="show" id="${foodInstance?.foodCategory?.id}">${foodInstance?.foodCategory?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name emphasize"><g:message code="food.calories.label" default="Calories" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "calories")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name emphasize"><g:message code="food.fat.label" default="Fat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "fat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.saturatedFat.label" default="Saturated Fat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "saturatedFat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.polyunsaturatedFat.label" default="Polyunsaturated Fat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "polyunsaturatedFat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.monounsaturatedFat.label" default="Monounsaturated Fat" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "monounsaturatedFat")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name emphasize"><g:message code="food.cholesterol.label" default="Cholesterol" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "cholesterol")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.sodium.label" default="Sodium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "sodium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="food.potassium.label" default="Potassium" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "potassium")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name emphasize"><g:message code="food.carbohydrate.label" default="Carbohydrate" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "carbohydrate")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name emphasize"><g:message code="food.protein.label" default="Protein" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: foodInstance, field: "protein")}</td>
                            
                        </tr>
                    
                        <%--<tr class="prop">
                            <td valign="top" class="name"><g:message code="food.state.label" default="State" /></td>
                            
                            <td valign="top" class="value"><g:link controller="foodState" action="show" id="${foodInstance?.state?.id}">${foodInstance?.state?.encodeAsHTML()}</g:link></td>
                            
                        </tr>--%>

                    	<tr>
	                        <td valign="top" class="name" colspan="2"><u>Measurement Equivalents</u><td>						
						</tr>
						
                    	<g:each var="foodMeasurementInstance" in="${foodInstance?.foodMeasurements}">
		                    <tr class="prop">
		                        <td></td>		                        
		                        <td valign="top" class="value">${foodMeasurementInstance}</td>		                        
		                    </tr>                        
                    	</g:each>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${foodInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
