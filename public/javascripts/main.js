
// Function to update visits from the table
function updateVisits()
{
var country = new Array();
var csrf_token = '<%= token_value %>';
var chkob = document.getElementById("1");
var country_curr_count = document.getElementById("countries_curr_count").value;
parob = chkob.parentNode.parentNode;
var tab = document.getElementById ( "country_curr_table" ); 
var elems = tab.getElementsByTagName ( "input" );
var checkbox_array = new Array(country_curr_count);

var country_visited = 0;
var country_not_visited = 0;
for(i=1; i<= country_curr_count; i++)
{
		if($('#'+i) && $('#'+i).is(':visible') && $('#'+i).value !="")	
		{

			checkbox_array[i-1] = new Array(2);
			checkbox_array[i-1][0]= document.getElementById(i).value;
			checkbox_array[i-1][1] = document.getElementById(i).checked; 	
			if(checkbox_array[i-1][1])
				country_visited++;
			else
				country_not_visited++;
			
		}
}


$.ajax({
type: "post",
url: "/countries/updatevisits",
data : {authenticity_token : AUTH_TOKEN, checkbox_array : checkbox_array },
success: function(data){
	for(i=1; i<= country_curr_count; i++)
	{

		if($('#'+i) && $('#'+i).is(':visible') && $('#'+i).value !="")	
		{

			if(document.getElementById(i).checked){
				if(document.getElementById('country_curr_table').rows[0].cells.length == 5){				
					$('#'+i).closest('td').prev('td').prev('td').html("Collected");
				}else{	
					$('#'+i).closest('td').prev('td').prev('td').prev('td').html("Visited");
				}
			}
			else{
				if(document.getElementById('country_curr_table').rows[0].cells.length == 5){
					$('#'+i).closest('td').prev('td').prev('td').html("Not Collected");
				}else{
					$('#'+i).closest('td').prev('td').prev('td').prev('td').html("Not Visited");
				}
			}

		}
	}


	var visited_chart = '<table><tr><th>Visited</th><td id="country_count">'+country_visited+'</td></tr><tr><th>Not Visited</th><td id="no_country_count">'+country_not_visited+'</td></tr></table>';
	$('.simple_pie_chart').html(visited_chart);
	loadChart();
	alert("Records Updated Successfully..!!");
}
});

		
}

$(document).ready(function() {

var $rows = $('#country_curr_table .type_search');
$('#search').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
    
    $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});


// add multiple select / deselect functionality
    $("#selectall").click(function () {
          $('.case').attr('checked', this.checked);
    });
 
    // if all checkbox are selected, check the selectall checkbox
    // and viceversa
    $(".case").click(function(){
 
        if($(".case").length == $(".case:checked").length) {
            $("#selectall").attr("checked", "checked");
        } else {
            $("#selectall").removeAttr("checked");
        }
 
    });




   // put all your jQuery goodness in here.
 });



