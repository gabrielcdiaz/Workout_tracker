function calcAvg(group) 
{
		$(gr)
		var set1 = parseInt(document.getElementById("set1").value);
		var set2 = parseInt(document.getElementById("set2").value);
		var set3 = parseInt(document.getElementById("set3").value);
		var set4 = parseInt(document.getElementById("set4").value);
		var set5 = parseInt(document.getElementById("set5").value);

		var avg = (set1+set2+set3+set4+set5)/5;
		var outputField = document.getElementById("user_workouts_9_weight");
		outputField.value = avg;

};

$(function(){
	$("input.calc-avg").blur(function(){
		group = $(this).attr("data")
		calcAvg(group);
		// onBlur="calcAvg(); return false;"
	})
})

//data attribute selector (input.data_group)
