$(document).ready(function() {
  var c_amount = $("#custom_amount_container");
  var c_field = $("#c_donation_amount");
  
  $('input[type=radio][id=donation_amount').change(function() {
    if (this.value == 'Other') {
      console.log("Other");
      c_amount.show();
      c_field.prop("disabled", false);
    }
    else {
      console.log("preset");
      c_amount.hide();
      c_field.prop("disabled", true);
    }
  });
});