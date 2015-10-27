$(document).ready(function(){

  $("#reminder").hide();
  $("#urls_table").hide();

  $("#submit_button").mouseenter(function(){
    $(this).fadeTo('fast', 1);
    $("#reminder").fadeIn();
  });

  $("#submit_button").mouseleave(function(){
      $(this).fadeTo('fast', 0.9);
      $("#reminder").fadeOut();
  });

  $("#table_title_button").click(function(){
    $("#urls_table").slideToggle();
  });

  $("#url_input_form").submit(function(event){
    event.preventDefault();
    $(this).validate();
// send ajax to server
    $.ajax({
      type: $(this).attr("method"),
      url: $(this).attr("action"),
      data: $(this).serialize(),
    }).done(function(return_data){
      // if done, run if else

      if(return_data != "false"){
         var  data = JSON.parse(return_data);
         $('table#urls_table > tbody').html("")
        $.each(data, function(id, whole_data){

          $('table#urls_table > tbody').append("<tr>\
                                        <td><a href=\" "+ whole_data.long_url + "\">" + whole_data.long_url + "</a></td>\
                                        <td><a href= \"http://localhost:9393/" + whole_data.short_url + " \">localhost:9393/" + whole_data.short_url + "</a></td>\
                                        <td id=\"click_count_col\">" + whole_data.click_count + "</td>\
                                      </tr>");
        });
      }else{
        $("div#error_message").html("");
        $('div#error_message').append("Please insert a valid URL!");
      };

    });
  });
});
