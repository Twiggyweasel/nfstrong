$(document).ready(function() {
  var b_label = $("#business_label");
  var p_label = $("#personal_label");
  var l_fields = $("#logo_fields");
  
  $('input[type=radio][id=sponsor_category').change(function() {
    if (this.value == 'Personal') {
      console.log("Personal");
      p_label.fadeIn();
      b_label.hide();
      l_fields.hide();
      
    }
    else if (this.value == 'Business') {
      console.log("Business");
      b_label.show();
      l_fields.show();
      p_label.hide();
    }
  });
});