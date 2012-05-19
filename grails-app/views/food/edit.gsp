

<%@ page import="com.atimbo.meal.Food" %>
<%@ page import="com.atimbo.meal.MeasurementUnit" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'food.label', default: 'Food')}" />
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
            <g:hasErrors bean="${foodInstance}">
            <div class="errors">
                <g:renderErrors bean="${foodInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${foodInstance?.id}" />
                <g:hiddenField name="version" value="${foodInstance?.version}" />
            	<g:hiddenField name="foodMeasurementCount" value="${foodMeasurementCount}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="food.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${foodInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="food.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'state', 'errors')}">
                                    <g:select name="state.id" from="${com.atimbo.meal.FoodState.list()}" optionKey="id" value="${foodInstance?.state?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="foodCategory"><g:message code="food.foodCategory.label" default="Food Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'foodCategory', 'errors')}">
                                    <g:select name="foodCategory.id" from="${com.atimbo.meal.FoodCategory.list()}" optionKey="id" value="${foodInstance?.foodCategory?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name" colspan="2">
                                	<center><u><strong>Values per Gram</strong></u></center>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name emphasize">
                                  <label for="calories"><g:message code="food.calories.label" default="Calories (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'calories', 'errors')}">
                                    <g:textField name="calories" value="${fieldValue(bean: foodInstance, field: 'calories')}" />
                                </td>
                            </tr>
                         
                            <tr class="prop">
                                <td valign="top" class="name emphasize">
                                  <label for="fat"><g:message code="food.fat.label" default="Fat (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'fat', 'errors')}">
                                    <g:textField name="fat" value="${fieldValue(bean: foodInstance, field: 'fat')}" />
                                </td>
                            </tr>
                       
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="saturatedFat"><g:message code="food.saturatedFat.label" default="Saturated Fat (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'saturatedFat', 'errors')}">
                                    <g:textField name="saturatedFat" value="${fieldValue(bean: foodInstance, field: 'saturatedFat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="polyunsaturatedFat"><g:message code="food.polyunsaturatedFat.label" default="Polyunsaturated Fat (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'polyunsaturatedFat', 'errors')}">
                                    <g:textField name="polyunsaturatedFat" value="${fieldValue(bean: foodInstance, field: 'polyunsaturatedFat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="monounsaturatedFat"><g:message code="food.monounsaturatedFat.label" default="Monounsaturated Fat (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'monounsaturatedFat', 'errors')}">
                                    <g:textField name="monounsaturatedFat" value="${fieldValue(bean: foodInstance, field: 'monounsaturatedFat')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cholesterol"><g:message code="food.cholesterol.label" default="Cholesterol (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'cholesterol', 'errors')}">
                                    <g:textField name="cholesterol" value="${fieldValue(bean: foodInstance, field: 'cholesterol')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sodium"><g:message code="food.sodium.label" default="Sodium (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'sodium', 'errors')}">
                                    <g:textField name="sodium" value="${fieldValue(bean: foodInstance, field: 'sodium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="potassium"><g:message code="food.potassium.label" default="Potassium (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'potassium', 'errors')}">
                                    <g:textField name="potassium" value="${fieldValue(bean: foodInstance, field: 'potassium')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name emphasize">
                                  <label for="carbohydrate"><g:message code="food.carbohydrate.label" default="Carbohydrate (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'carbohydrate', 'errors')}">
                                    <g:textField name="carbohydrate" value="${fieldValue(bean: foodInstance, field: 'carbohydrate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name emphasize">
                                  <label for="protein"><g:message code="food.protein.label" default="Protein (g)" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: foodInstance, field: 'protein', 'errors')}">
                                    <g:textField name="protein" value="${fieldValue(bean: foodInstance, field: 'protein')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>

                    <g:each var="foodMeasurementInstance" in="${foodInstance?.foodMeasurements}" status="count">
				        <g:hiddenField name="${'measurement' + count + '.id'}" value="${foodMeasurementInstance?.id}" />
				        <g:hiddenField name="${'measurement' + count + '.version'}" value="${foodMeasurementInstance?.version}" />
						<div id="${'measurement' + count}" class="entry-box hidden">
							<div class="entry-box-row">
								<table>
									<tbody>
						                <tr class="prop">
						                    <td valign="top" class="name">
						                        <label for="measurement">Measurement Unit</label>
						                    </td>
						                    <td valign="top" class="required">
												<g:select name="${'measurement' + count + '.unit'}"
														  from="${MeasurementUnit.list()}"
														  value="${foodMeasurementInstance?.unit}"
														  optionKey="id" />
          						            </td>
						                </tr>                                                       
						                <tr class="prop">
						                    <td valign="top" class="name">
						                        <label for="measurement">Grams per Unit</label>
						                    </td>
						                    <td valign="top" class="required">
						                        <g:textField name="${'measurement' + count + '.gramsPerUnit'}" value="${foodMeasurementInstance?.gramsPerUnit}" />
						                    </td>
						                </tr>                                                       
						            	
						            </tbody>
						        </table>									
							</div>
						</div>
                    </g:each>

                    <g:each var="foodMeasurementInstance" in="${foodMeasurementList}" status="i">
                    	<g:if test="${foodMeasurementCount > 0}">
                    		<g:set var="count" value="${foodMeasurementCount + i + 1}" />
                    	</g:if>
                    	<g:else>
                    		<g:set var="count" value="${i}" />
                    	</g:else>
                    		
						<div id="${'measurement' + count}" class="entry-box hidden">
							<div class="entry-box-row">
								<table>
									<tbody>
						                <tr class="prop">
						                    <td valign="top" class="name">
						                        <label for="measurement">Measurement Unit</label>
						                    </td>
						                    <td valign="top" class="required">
												<g:select name="${'measurement' + count + '.unit'}"
														  from="${MeasurementUnit.list()}"
														  value=""
														  optionKey="id" />
          						            </td>
						                </tr>                                                       
						                <tr class="prop">
						                    <td valign="top" class="name">
						                        <label for="measurement">Grams per Unit</label>
						                    </td>
						                    <td valign="top" class="required">
						                        <g:textField name="${'measurement' + count + '.gramsPerUnit'}" value="" />
						                    </td>
						                </tr>                                                       
						            	
						            </tbody>
						        </table>									
							</div>
						</div>
                    </g:each>
                    

                </div>
                <div class="buttons">
                    <span class="button"><input type="button" id="add-measurement" value="Add Measurement" class="add" /></span>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
