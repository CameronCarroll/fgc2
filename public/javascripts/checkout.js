(function($){
  $(document).ready(function(){

    $('#checkout_form_address').validate();

    var get_states = function(region){
      country = $('p#' + region + 'country' + ' span#' + region + 'country :only-child').val();
      return state_mapper[country];
    }
    
    var update_state = function(region) {
      states = get_states(region);

      state_select = $('p#' + region + 'state select');
      state_input = $('p#' + region + 'state input');

      if(states) {
        selected = state_select.val();
        state_select.html('');
        states_with_blank = [["",""]].concat(states);
        $.each(states_with_blank, function(pos,id_nm) {
          var opt = $(document.createElement('option'))
                    .attr('value', id_nm[0])
                    .html(id_nm[1]);
          if(selected==id_nm[0]){
            opt.attr('selected', 'selected');
          }
          state_select.append(opt);
        });
        state_select.removeAttr('disabled').show();
        state_input.hide().attr('disabled', 'disabled');

      } else {
        state_input.removeAttr('disabled').show();
        state_select.hide().attr('disabled', 'disabled');
      }

    };

    // Show fields for the selected payment method
    $("input[type='radio'][name='order[payments_attributes][][payment_method_id]']").click(function(){
      $('#payment-methods li').hide();
      if(this.checked){ $('#payment_method_'+this.value).show(); }
    }).triggerHandler('click');

    $('p#bcountry select').change(function() { update_state('b'); });
    $('p#scountry select').change(function() { update_state('s'); });
    update_state('b');
    update_state('s');

    $('input#order_use_billing').click(function() {
      if($(this).is(':checked')) {
        $('#shipping .inner').hide();
        $('#shipping .inner input, #shipping .inner select').attr('disabled', 'disabled');
      } else {
        $('#shipping .inner').show();
        $('#shipping .inner input, #shipping .inner select').removeAttr('disabled', 'disabled');
        //only want to enable relevant field
        if(get_states('s')){
          $('span#sstate input').hide().attr('disabled', 'disabled');
        }else{
          $('span#sstate select').hide().attr('disabled', 'disabled');
        }

      }
    }).triggerHandler('click');

    $('form.edit_checkout').submit(function() {
      $(this).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass('disabled');
    });


  });
})(jQuery);
