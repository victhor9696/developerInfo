//= require lib_third/jquery
//= require lib_third/jquery-ui
//= require lib_third/jquery.mask.js
//= require jquery_ujs
//= require lib_third/tag-it.js
//= require lib_third/jquery.maskMoney.js
//= requite lib_third/jquery-ui.min
//= require lib_third/gritter
//= require lib_third/bootstrap.min
//= require lib_third/microplugin.js
//= require lib_third/sifter.js
//= require lib_third/selectize.js
//= require lib_third/jquery.raty.js
//= require lib_third/labs.js
//= require_tree ./lib_own
//= require_tree ./views

function redirect_search(){
  window.location = "?query="+$("#search").val();
}

function tag_names(){
  $('#tag_names_br').tagit({
     allowSpaces: true,
     tagSource: function(search, showChoices) {
       var that = this;
       $.ajax({
         url: "/find_tags.json",
         data: search,
         success: function(choices) {
           var arraySector = [];
           $.each(choices,function(index,tag){
             arraySector.push(tag.name);
           });
           showChoices(arraySector);
         }
       });
     }
  });

  $('#tag_names_es').tagit({
     allowSpaces: true,
     tagSource: function(search, showChoices) {
       var that = this;
       $.ajax({
         url: "/find_tags.json",
         data: search,
         success: function(choices) {
           var arraySector = [];
           $.each(choices,function(index,tag){
             arraySector.push(tag.name);
           });
           showChoices(arraySector);
         }
       });
     }
  });
}


$(document).ready(function(){
  insertIconPresence();
  $(".closeAlert").click(function(){
    $(".alert").hide(300);
  });

  $(".searchBtn").click(function(){
    redirect_search();
  });

  $("#search").keypress(function(e) {
    if(e.which == 13) {
      redirect_search();
    }
  });

  $(".search").click(function(){
    window.location = "/search?query="+$("#query").val();
  });


});
