$(document).ready(function() {
  $("#table-query").on("change", function() {
    var $selector = $(this);
    var query = $selector.get(0).value;
    if (query !== "") {
      var data = {value: query};
      var request = $.ajax({
        url: '/database-calls/table',
        data: data      
      })

      request.done(response => {
        $(".table-form").empty();
        $(".column_list").empty();
        JSON.parse(response).column_names.forEach(column => {
          let inputField = "<input id='" + column + "' type='text' name='" + column +"' placeholder='" + column + "'><br>"
          $(".table-form").append(inputField);
          let inputBullet = "<li>" + column + "</li>"
          $(".column_list").append(inputBullet);
        })
        let submitField = "<input type='submit' value='Submit'>"
        $(".table-form").append(submitField)
      })
    } else {
      $(".table-form").empty();
      $(".column_list").empty();
    }
  });

  $(".table-form:first-child").on("change", function() {
    autocomplete(this)
  })

  // $(".table-form").on("submit", function() {
  //   var $table_form = $(this);
    
  //   if () 
  // })
});

function autocomplete(that) {
  var $table_form = $(that);
  var id = $table_form.find(">:first-child").get(0).value;
  var table = $("#table-query").get(0).value;
  var data = {table: table, id: id};
  var request = $.ajax({
    url: '/database-calls/find-data',
    data: data
  })

  request.done(response => {
    console.log(response);
    var result_obj = JSON.parse(response).result;
    console.log("result_obj: ", result_obj);
    for (var property in result_obj) {
      console.log("property: ", property, "value: ", result_obj[property]);
      if (property !== "created_at" || property !== "updated_at") {
        let inputField = $("#" + property);
        console.log(inputField);
        inputField.val(result_obj[property]);
      }
    }  
  })
}

function checkEntries(element) {
  return !!element.get(0).value
}

// $(document).ready(function() {
//   $("form").on("submit", function() {
//     event.preventDefault();
//     var $form = $(this);
//     var method = $form.attr("method");
//     var url = $form.attr("action");
//     var request = $.ajax({
//       method: method,
//       url: url
//     });

//     request.done(function(response) {
//       $("main").append(response);
//       $form.hide();
//     });
//   });

//   $("main").on("submit", "form#new-horse-form", function() {
//     event.preventDefault();
//     var $form = $(this);
//     var method = $form.attr("method");
//     var url = $form.attr("action");
//     var data = $form.serialize();

//     var request = $.ajax({
//       method: method,
//       url: url,
//       data: data
//     });

//     request.done(function(response) {
//       $("ul").append(response);
//       $form.hide();
//       $("form#add").show();
//     });
//   });

//   $("main").on("click", "a", function() {
//     event.preventDefault();
//     var $link = $(this);
//     var method = "GET";
//     var url = $link.attr("href");

//     var request = $.ajax({
//       method: method,
//       url: url
//     });

//     request.done(function(response) {
//       $link.after(response);
//     });
//   });

// });
