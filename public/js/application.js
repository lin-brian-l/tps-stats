$(document).ready(function() {
  console.log("plz load");
  $("#submit-link").on("click", function() {
    console.log("plz work");
  });
});

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
