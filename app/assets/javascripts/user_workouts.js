function calcAvg(group_index) {
    // Get the sibling elements of the blurred input
    var sets = $(".calc-avg[data-group-index='" + group_index + "']");

    // Iterate on all there values and adding them to the average variable
    for (var i = 0, average = 0; i < sets.length; i++) {
        var reps = $(sets[i]).val();
        if (reps)
            average += parseInt(reps);
    }

    // Calculating the average ...
    average /= i;

    // Setting the average in the input with the class .result-avg
    $(".result-avg[data-group-index='" + group_index + "']").val(average);
}

$(function () {
    $("input.calc-avg").blur(function () {
        // Calling calcAvg() method with the group-index of the blurred input
        calcAvg($(this).data("group-index"))
    })
})
