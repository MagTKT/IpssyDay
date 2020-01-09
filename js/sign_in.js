$(function() {

  $("#inscriptionForm input,#inscriptionForm select").jqBootstrapValidation({
    preventSubmit: true,
    submitError: function($form, event, errors) {
      // additional error messages or events
    },
    submitSuccess: function($form, event) {
      event.preventDefault(); // prevent default submit behaviour
      // get values from FORM
      var name = $("input#name_sign_in").val();
      var email = $("input#email_sign_in").val();
      var phone = $("input#phone_sign_in").val();
      var id_link = $("select#id_link").val();

      var link = $("input#link").val();
      var firstName = name; // For Success/Failure Message
      // Check for white space in name for Success/Fail message
      if (firstName.indexOf(' ') >= 0) {
        firstName = name.split(' ').slice(0, -1).join(' ');
      }
      $this = $("#sendSignInButton");
      $this.prop("disabled", true); // Disable submit button until AJAX call is complete to prevent duplicate messages
      $.ajax({
        url: "././sign_in/sign_in.php",
        type: "POST",
        data: {
          name: name,
          phone: phone,
          email: email,
          id_link: id_link,
          link:link
        },
        cache: false,
        success: function() {
          // Success message
          $('#successSignIn').html("<div class='alert alert-success'>");
          $('#successSignIn > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
            .append("</button>");
          $('#successSignIn > .alert-success')
            .append("<strong> Your account has been created successfully. </strong>");
          $('#successSignIn > .alert-success')
            .append('</div>');
          //clear all fields
          $('#inscriptionForm').trigger("reset");
        },
        error: function() {
          // Fail message
          $('#successSignIn').html("<div class='alert alert-danger'>");
          $('#successSignIn > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
            .append("</button>");
          $('#successSignIn > .alert-danger').append($("<strong>").text("Sorry " + firstName + ", it seems that my mail server is not responding. Please try again later!"));
          $('#successSignIn > .alert-danger').append('</div>');
          //clear all fields
          $('#inscriptionForm').trigger("reset");
        },
        complete: function() {
          setTimeout(function() {
            $this.prop("disabled", false); // Re-enable submit button when AJAX call is complete
          }, 1000);
        }
      });
    },
    filter: function() {
      return $(this).is(":visible");
    },
  });

  $("a[data-toggle=\"tab\"]").click(function(e) {
    e.preventDefault();
    $(this).tab("show");
  });
});
  
  /*When clicking on Full hide fail/success boxes */
  $('#name').focus(function() {
    $('#successSignIn').html('');
  });
  