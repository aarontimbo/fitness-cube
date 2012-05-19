/*
jQuery
*/

var debug = true;
//var debug = false;
var foodMeasurementId = 0

$(document).ready(function() {
	$('#mealTimeDatepicker').datepicker();	
	$('#tabs').tabs();	
		
	$("#searchFood").autocomplete({
        source: function(request, response) {
            $.ajax({
                url: "http://localhost:8080/mealItem/ajaxGetFood",
                dataType: "json",
                data: {
                    name_contains: request.term
                },
                success: function(data) {
                    response($.map(data, function(item) {
                        return {
                            label: item.longDescription,
                            value: item.id,
                            title: 'food'
                        }
                    }))
                }
            })
        },
        minLength: 3
	});     
        	
    $('#add-measurement').click(function(){
        var element = document.getElementById('foodMeasurementCount');
        if (element) {
            foodMeasurementId = parseInt($(element).val());
		    // alert("Adding measurement " + foodMeasurementId);
		    if (foodMeasurementId < 10) {
		        var divId = '#measurement' + foodMeasurementId;
		        $(divId).removeClass('hidden');
		        if (element) {
		            foodMeasurementId += 1;        
		            $(element).val(foodMeasurementId);
		        }
		    }
		    else {
		        alert("Sorry, a maximum of ten measurements may be entered here.");
		    }
        }
    });
	
	if (debug) {
		alert("jQuery loaded");
	}
	
});
