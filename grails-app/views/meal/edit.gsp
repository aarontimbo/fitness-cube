

<%@ page import="com.atimbo.meal.Meal" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
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
            <g:hasErrors bean="${mealInstance}">
            <div class="errors">
                <g:renderErrors bean="${mealInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${mealInstance?.id}" />
                <g:hiddenField name="version" value="${mealInstance?.version}" />
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
                                    <input id="mealTimeDatepicker" name="mealTime" type="text" value="${mealInstance?.mealTime}"  />
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
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mealItems"><g:message code="meal.mealItems.label" default="Meal Items" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: mealInstance, field: 'mealItems', 'errors')}">
                                    
<ul>
<g:each in="${mealInstance?.mealItems?}" var="m">
    <li><g:link controller="mealItem" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="mealItem" action="create" params="['meal.id': mealInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mealItem.label', default: 'MealItem')])}</g:link>

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
            
            <div id="tabs">
            	<ul>
            		<g:each var="mealItemInstance" in="${mealInstance.mealItems}" status="i">
            			<li><a href="${'#tabs-' + i}" title="<g:if test='${mealItemInstance?.recipe}'>${mealItemInstance?.recipe}</g:if><g:else>${mealItemInstance?.foodWeight?.food?.longDescription}</g:else>"><g:if test="${mealItemInstance?.recipe}">${mealItemInstance?.recipe[0..10]}</g:if><g:else>${mealItemInstance?.foodWeight?.food?.longDescription[0..10] + '...'}</g:else></a></li>
            		</g:each>
            		
            		<li><a href="#tabs-new">New Meal Item</a></li>          		
            	</ul>
				
        		<g:each var="mealItemInstance" in="${mealInstance.mealItems}" status="i">
					<div id="${'tabs-' + i}">
						<g:form method="post" controller="mealItem">
							<g:hiddenField name="id" value="${mealItemInstance?.id}" />

		                    <span class="prop">
		                        <label for="recipe"><g:message code="mealItem.recipe.label" default="Recipe" /></label>
		                    </span>
		                    <span class="value ${hasErrors(bean: mealItemInstance, field: 'recipe', 'errors')}">
		                        <g:select name="recipe.id" from="${com.atimbo.meal.Recipe.list()}" optionKey="id" value="${mealItemInstance?.recipe?.id}" noSelection="['null': '']" />
		                    </span>
		                
		                    <span class="prop">
		                        <label for="foodWeight"><g:message code="mealItem.foodWeight.label" default="Food Weight" /></label>
		                    </span>
		                    <span class="value ${hasErrors(bean: mealItemInstance, field: 'foodWeight', 'errors')}">
		                        <%--<g:select name="foodWeight.id" from="${gov.usda.sr23.Weight.list()}" optionKey="id" value="${mealItemInstance?.foodWeight?.id}" noSelection="['null': '']" />--%>
		                        <g:textField name="foodWeight.id" value="${mealItemInstance?.foodWeight?.id}" />
		                    </span>
		                
		                    <span class="prop">
		                        <label for="servings"><g:message code="mealItem.servings.label" default="Servings" /></label>
		                    </span>
		                    <span class="value ${hasErrors(bean: mealItemInstance, field: 'servings', 'errors')}">
		                        <g:textField name="servings" value="${fieldValue(bean: mealItemInstance, field: 'servings')}" />
		                    </span>
				               
				            <g:actionSubmit action="update" value="Save" />
				            <g:actionSubmit action="delete" value="Remove" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						
						</g:form>
					</div>
        		</g:each>

				<div id="tabs-new" >
					<g:form method="post" controller="mealItem">
						<g:hiddenField name="meal.id" value="${mealInstance?.id}" />
                        <%-- ADD SEARCH TOOL FOR FOOD OR RECIPE USING AUTOCOMPLETE --%>
                        <div class="search">
		                    <span class="prop">
		                        <label for="search">Search Food</label>
		                    </span>
		                    <span class="prop">
		                        <input id="searchFood" type="text" value="" />
		                    </span>
    					</div>
    					                    
                        <%--<div>
		                    <span class="prop">
		                        <label for="recipe"><g:message code="mealItem.recipe.label" default="Recipe" /></label>
		                    </span>
		                    <span class="value ${hasErrors(bean: mealItemInstance, field: 'recipe', 'errors')}">
		                        <g:select name="recipe.id" from="${com.atimbo.meal.Recipe.list()}" optionKey="id" value="" noSelection="['null': '']" />
		                    </span>
    					</div>
                    
                        <div>
                        <span class="prop">
                            <label for="foodWeight"><g:message code="mealItem.foodWeight.label" default="Food Weight" /></label>
                        </span>
                        <span class="value ${hasErrors(bean: mealItemInstance, field: 'foodWeight', 'errors')}">
                            <g:select name="foodWeight.id" from="${gov.usda.sr23.Weight.list()}" optionKey="id" value="" noSelection="['null': '']" />
                        </span>
    					</div>--%>
                    
                        <div>
		                    <span class="prop">
		                        <label for="servings"><g:message code="mealItem.servings.label" default="Servings" /></label>
		                    </span>
		                    <span class="value ${hasErrors(bean: mealItemInstance, field: 'servings', 'errors')}">
		                        <g:textField name="servings" value="" />
		                    </span>
    					</div>
                        
		                <g:actionSubmit action="save" value="Add" />
					
					</g:form>
				</div>
				          	
            </div>
        </div>
    </body>
</html>
