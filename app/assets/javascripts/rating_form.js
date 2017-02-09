// Function to start section 2 at the top
$('.section_switch_button').click(function (e) {
  $('html, body').animate({
    scrollTop: $('#section_2')
  }, 100);
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
// And check for section 2 if something is missing

$('#submit_rating').on('click', function(event){
  if ( ($('.check-string-section-2').val() == "") || ( ($('.rating_internship_start_year').find('.internship-start-year-hover')).length < 1 )  || (($('.rating_internship_duration').find('.internship-duration-hover')).length < 1) || (($('.rating_professional_status').find('.internship-professional-status-hover')).length < 1) || (($('.rating_net_salary_per_month').find('.internship-net-salary-hover')).length < 1) || ($("input[name='rating[job_offered]']").is(":checked") == false ) || ($("input[name='rating[contract_signed]']").is(":checked") == false ) || ($("input[name='rating[read_conditions]']").is(":checked") == false) ) {
    event.preventDefault
    $('html, body').animate({
      scrollTop: $('#section_2')
    }, 100);
    if ($('#section_2').find('.error-message-section-2')) {
      $('.error-message-section-2').remove();
    }
    if ($('.check-string-section-2').val() == "") {
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to fill out this value </div>").insertAfter(".render-error-message");
    }
    if ( ($('.rating_internship_start_year').find('.internship-start-year-hover')).length < 1 ) {
      console.log(($('.rating_internship_start_year').find('.internship-start-year-hover')).length < 1);

      $("<div class='error-message-section-2'> <div class='exclamationmark'></div>  You need to check a value </div>").insertAfter(".append-error-message-year");
    }


    if (($('.rating_internship_duration').find('.internship-duration-hover')).length < 1) {
      console.log((($('.rating_internship_duration').find('.internship-duration-hover')).length < 1));
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div>  You need to check a value </div>").insertAfter(".append-error-message-duration");
    }


    if (($('.rating_professional_status').find('.internship-professional-status-hover')).length < 1) {

      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to check a value </div>").insertAfter(".append-error-message-status");
    }


    if (($('.rating_net_salary_per_month').find('.internship-net-salary-hover')).length < 1) {
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to check a value </div>").insertAfter(".append-error-message-salary");
    }
    if ($("input[name='rating[job_offered]']").is(":checked") == false) {
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to check these boxes </div>").insertAfter(".append-error-message-joboffer");

    }
    if ($("input[name='rating[contract_signed]']").is(":checked") == false) {
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to check these boxes </div>").insertAfter(".append-error-message-contract");

    }
    if ($("input[name='rating[read_conditions]']").is(":checked") == false) {
      $("<div class='error-message-section-2'> <div class='exclamationmark'></div> You need to check this box</div>").insertAfter(".append-error-message-conditions");
    }
  } else {
    $('#new_rating').submit();
  }
  return false;
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
      // First checks if it already contains a full error message, if so
      // first remove it, and than add it again
      if ($('.button-container').find('.erorr-switch-section')) {
        $('.erorr-switch-section').remove();
      }
      $(this).parent().prepend('<div class="erorr-switch-section"><p> Please fill out all the fields on this page before continuing</p></div>')
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
      if ($('.rating-stars-item').find('.star_error_message')) {
        // Checks if there is already an error message
        // and if so removes the last one first
        $('.star_error_message').remove();
      }

      $(this).parent().append("<div class='star_error_message'><p><span>!</span> Please fill in these fields</p></div>")
    }
  });
  $('.rating-stars-item').each(function(){
    if (!$('.radio_buttons', this).hasClass('checked')) {
      // console.log('button that have been checked!');
      // console.log(this);
      $(this).append("<div class='star_error_message' id='" + $(this).attr('id') + "_star_error_message'><p><span>!</span> Please fill in this rating</p></div>")
    }
  });
}

  // CALL TO THE FUNCTION 'checkFields' THAT CHECKS IN 1 SECOND INTERVALS IF THE FIELDS ARE FILLED OUT

  setInterval(checkFields, 1000);
