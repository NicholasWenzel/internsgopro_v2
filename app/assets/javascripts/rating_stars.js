// FUNCTION THAT COLORS STARS ON PAGE RELOAD WITH PERSISTING DATA

$(document).ready(function(){
  // Activates when the page loads in for the first time
  $('.rating-stars-item .radio_buttons').each(function( index, item ){
    // Iterate over each star picker
    var fieldHasData = $(this).find('#selected_value').data('value')
      // If the page has reloaded, on validation fail, the data-value on the star element will be adjusted.
      // This value is stored in a variable
      if (fieldHasData > 0 && fieldHasData < 5) {
        // If fieldHasData is higher than 0 it means a form validation error is occuring,
        // the data cannot be higher than 5, this check is a bit redundant
        $(this).find('.radio').each(function( index, item ){
          // Iterate over every radio button in the collection that retains data from a validation error
          if ($('label', this).attr('id') == fieldHasData) {
            // Check if the attribute id on the current button is equal to the number received from reload
            starColor($('label', this), true)
            // Color the stars with permanence
          }
        })
      }
    })
});

// FUNCTION THAT COLORS THE STARS ON HOVER

$('.star-rating-display').hover(function() {
  // Check if a label for a star is being hovered, this triggers two functions
  // the first for mouse-enter, the second for mouse-leave
  if (!$(this).parent().parent().hasClass('checked')) {
    // Check if the parent group of the label has the class checked
    // this indicates that an answer is filled in, if it's not filled in
    // the next line is executed
    starColor($(this), false);
    // Call the starColor method, with permanence = false. This will make the stars
    // change on hover but revert back to black on exit
  }
},
function() {
  // This function is triggered on mouse-leave
  if (!$(this).parent().parent().hasClass('checked')) {
        // Check if the parent group of the label has the class checked
    // this indicates that an answer is filled in, if it's not filled in
    // the next line is executed
    $(this).parent().parent().each(function( index, item ){
      // Loop over all items in the current group
      $('i', this).css('color', '#d1d1d1');
      // Color all stars in the current group black
    });
  }

}
);


// FUNCTION TO COLOR THE STARS

function starColor(starSelected, starPermanence){
  // Record a click on the label and initiate action
  var starNumber = parseInt($(starSelected).attr('id'));
  // Assign integer number of stars associated with item clicked on to variable
  var groupSelector = $(starSelected).data('target');
  // Find out which group the clicked item belongs to and store it to a variable
  if (starPermanence == true) {
    // If the method is passed the second parameter with a value of true
    // the next code is executed, in practice the true/false difference lies
    // with the difference between hover and click
    var starUpdate = $(starSelected).parent().parent();
    // Find the group the current star is a part of
    starUpdate.addClass('checked')
    // Add the class 'checked' to the group
    $(starUpdate.data('target')).fadeOut( "fast", function() {
      // When a star is checked, this will find the error box and fade it out
      $(this).remove();
      // After fading out the error box this will remove it from the DOM altogether
    });
  }
  $(groupSelector).find('i').css('color', '#d1d1d1');
    // Set all stars in the set to the inactive color
    $(groupSelector).find('.radio').each(function( index, item ) {
    // Select all the radio buttons within the same group as the item that is clicked and iterate
    if(parseInt($(this).find('label').attr('id')) <= starNumber ) {
      // Check condition if radio button is of a lower or equal number as the one that is clicked
      $(this).find('i').css('color', '#ffbd23');
      // Change color of item to the active colour
    }
  });
  }
  // When star gets clicked, the starColor method will get called and
  // color the stars
  $('.rating-stars-item label').on('click', function(event) {
    starColor(this, true);
  });

// FUNCTION TO ACTIVATE THE POPOVER PER STAR ITEM

$('.star-information-popover-link').hover(function(){
  var popoverLocation = $('div', this).data('target');
  $(popoverLocation).slideDown( "fast", function() {
    $(popoverLocation).css('display', 'block');
  });
},
function(){
  var popoverLocation = $('i', this).data('target');
  $(popoverLocation).delay(200).slideUp( "fast", function() {
    $(popoverLocation).css('display', 'none');
  });
}
);
