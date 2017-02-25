// DROPDOWN MOBILE
$('#duration-dropdown').on('click', function(event){
  event.preventDefault();
  var target = $(this).data('target');
  $(target).toggleClass('hidden-xs');
});

$('.rating_internship_duration span').on('click', function(){
  var selected = $('label', this).text()
  var target = $('#duration-dropdown').data('target');
  $('#duration-dropdown .answer').text(selected);
    if (!$(target).hasClass('hidden-xs')) {
    $(target).addClass('hidden-xs');
  }
});

// DROPDOWN MOBILE
$('#net-salary-dropdown').on('click', function(event){
  event.preventDefault();
  var target = $(this).data('target');
  $(target).toggleClass('hidden-xs');
});

$('.rating_net_salary_per_month span').on('click', function(){
  var selected = $('label', this).text()
  var target = $('#net-salary-dropdown').data('target');
  $('#net-salary-dropdown .answer').text(selected);
  if (!$(target).hasClass('hidden-xs')) {
    $(target).addClass('hidden-xs');
  }
});

// FUNCTION TO HAVE THE EXTRA BENEFITS BOX BORDER COLOR ON SELECT
$('.extra_benefit_input').change(
  function(){
    if ($(this).is(':checked')) {
      $(this).parents('.check_boxes').addClass('extra_benefit_hover');
    }
    else {
      $(this).parents('.check_boxes').removeClass('extra_benefit_hover');
    }
  });

// FUNCTION TO HAVE THE START YEAR BOX BORDER COLOR ON SELECT

$('.rating_internship_start_year input').change(
  function(){
    if ($(this).is(':checked')) {
      $('.rating_internship_start_year input').parents('label').removeClass('internship-start-year-hover');
      $(this).parents('label').addClass('internship-start-year-hover');
    }
  });

// FUNCTION TO HAVE THE DURATION BOX BORDER COLOR ON SELECT

$('.rating_internship_duration input').change(
  function(){
    if ($(this).is(':checked')) {
      $('.rating_internship_duration input').parents('label').removeClass('internship-duration-hover');
      $(this).parents('label').addClass('internship-duration-hover');
    }
  });

// FUNCTION TO HAVE THE NET SALARY BOX BORDER COLOR ON SELECT

$('.rating_net_salary_per_month input').change(
  function(){
    if ($(this).is(':checked')) {
      $('.rating_net_salary_per_month input').parents('label').removeClass('internship-net-salary-hover');
      $(this).parents('label').addClass('internship-net-salary-hover');
    }
  });

// FUNCTION TO HAVE THE PROFESSIONAL STATUS BOX BORDER COLOR ON SELECT

$('.rating_professional_status input').change(
  function(){
    if ($(this).is(':checked')) {
      $('.rating_professional_status input').parents('label').removeClass('internship-professional-status-hover');
      $(this).parents('label').addClass('internship-professional-status-hover');
    }
  });

// FUNCTION TO PREVENT SUBMIT WHEN A USER PRESSES 'ENTER' ON A FIELD

$('#new_rating').on('keypress', function(event){
 if (event.which == 13) {
  event.preventDefault();
}
});

// FUNCTION TO HAVE THE FORM SUBMIT WHEN THE SUBMIT BUTTON IS CLICKED

$('#submit_rating').on('click', function(event){
  $('#new_rating').submit();
});


// FUNCTION TO SWITCH BETWEEN SECTION 1 AND 2 OF THE FORM

$('.section_switch_button').on('click', function(event) {
  event.preventDefault();
  if ($(this).hasClass('ready')) {
    var target = $(this).data('target');
    $('.rating_section').addClass('hidden');
    $(target).removeClass('hidden');
  }
  else {
    if (!$(this).parent().hasClass('orbs_container')) {
      $(this).parent().prepend('<div><p> </p></div>')
      // FIX ME; error kept popping up, now it sends an empty div
      // $(this).parent().prepend('<div><p> Please fill out all fields </p></div>')
      displayErrorMessage()
    }
  }
});

// FUNCTION TO CHECK IF ALL THE FIELDS ARE FILLED OUT

function checkFields(){
  var totalAmount = $('.rating-form-check-fields').length
  var amountChecked = 0
  $('.rating-form-check-fields').each(function(){
    if ($(this).val() != "") {
      amountChecked += 1
    }
  });
  if (amountChecked == totalAmount) {
    var part1 = true
  }
  var totalStars = $('.rating-stars-item').length
  var amountStarsChecked = 0
  $('.rating-stars-item').each(function(){
    if ($('.radio_buttons', this).hasClass('checked')) {
      amountStarsChecked += 1
    }
  });
  if (totalStars == amountStarsChecked) {
    var part2 = true
  }
  if ((part1 == true) && (part2 == true)) {
    $('.section_switch_button').addClass('ready');
  }
}

// FUNCTION TO DISPLAY ERROR MESSAGES PER FIELD WHEN FIELDS ARE NOT PROPERLY FILLED OUT

function displayErrorMessage(){
  $('.rating-form-check-fields').each(function(){
    if ($(this).val() == "") {
      $(this).parent().append("<div class='star_error_message'><p><span>!</span> Please fill in this field</p></div>")
    }
  });
  $('.rating-stars-item').each(function(){
    if (!$('.radio_buttons', this).hasClass('checked')) {
      $(this).append("<div class='star_error_message' id='" + $(this).attr('id') + "_star_error_message'><p><span>!</span> Please fill in this rating</p></div>")
    }
  });
}

  // CALL TO THE FUNCTION 'checkFields' THAT CHECKS IN 1 SECOND INTERVALS IF THE FIELDS ARE FILLED OUT

  setInterval(checkFields, 1000);
