$(document).ready(function() {
  $("#profile-form").on("change", "#password-1", checkPasswords)

  $("#profile-form").on("change", "#password-2", checkPasswords)

  $("#table-query").on("change", function() {
    var $selector = $(this);
    var query = $selector.get(0).value;
    var data = {value: query};
    $.ajax({
      url: '/database-calls/table',
      data: data      
    }).done(response => {
      $(".table-form").empty();
      $(".column-list").empty();
      if (!response) return
      JSON.parse(response).column_names.forEach(column => {
        let inputField = "<input id='" + column + "' type='text' name='" + column +"' placeholder='" + column + "'><br>"
        $(".table-form").append(inputField);
        let inputBullet = "<li>" + column + "</li>"
        $(".column-list").append(inputBullet);
      })
      let submitField = "<input type='submit' value='Submit'>"
      $(".table-form").append(submitField)
    })

  });

  $(".table-form").on("change", "#id", function() {
    var $idInput = $(this);
    var id = $idInput.get(0).value;
    var table = $("#table-query").get(0).value;
    var data = {table: table, id: id};
    $.ajax({
      url: '/database-calls/find-data',
      data: data
    }).done(response => {
      var result_obj = JSON.parse(response).result;
      if (!result_obj) alert("There is no entry with id " + id + " in the " + table + " table.")
      for (var property in result_obj) {
        if (property !== "created_at" || property !== "updated_at") {
          let inputField = $("#" + property);
          inputField.val(result_obj[property]);
        }
      }  
    })
  })

  $(".table-grid-container").on("submit", ".table-form", function() {
    event.preventDefault();
    var $tableInputs = $(".table-form :input").slice(0, -1);
    if (!checkInput($tableInputs[0])) {
      alert("ID cannot be blank.");
      return
    }
    if (checkBlankInputs($tableInputs.slice(1))) return
    $form = $(this);
    $table = $("#table-query").get(0).value;
    var data = $form.serialize() + "&table=" + $table;
    
    $.ajax({
      method: 'PUT',
      url: '/database-calls/update-data',
      data: data
    }).done(response => {
      var result_obj = JSON.parse(response).result;
      var message = ""
      for (var property in result_obj) {
        message += property + ": " + result_obj[property] + "\n";
      }
      alert("Object has been updated with the following attributes:\n\n" + message);
    })

  })
});

function checkInput(element) {
  return !!element.value;
}

function checkBlankInputs(inputArray) {
  var blank = true;
  inputArray.each(function() {
    if ($(this).get(0).value) blank = false;
  })
  return blank;
}

function checkPasswords() {
  var $passwordInputs = $(":password");
  var password1 = $passwordInputs[1].value;
  var password2 = $passwordInputs[2].value;
  $("#password-error").remove();
  if (!password1 || !password2) return
  if (password1 !== password2) {
    var error = "<span id='password-error'>Your passwords do not match!</span>";
    $(".setting-error-container").append(error);
  }
}