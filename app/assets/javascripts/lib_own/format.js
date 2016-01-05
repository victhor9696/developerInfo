var selectizeControl;
function float2int (value) {
    return Math.round(value)
}

function float2currency(amount){
  var i = parseFloat(amount);
  if(isNaN(i)) { i = 0.00; }
  var minus = '';
  if(i < 0) { minus = '-'; }
  i = Math.abs(i);
  i = parseInt((i + .005) * 100);
  i = i / 100;
  s = new String(i);
  if(s.indexOf('.') < 0) { s += '.00'; }
  if(s.indexOf('.') == (s.length - 2)) { s += '0'; }
  s = minus + s;
  return s;
}

function currency(){
  $(".currency").maskMoney({
    allowNegative: false,
    thousands:'.',
    decimal:',',
    affixesStay: false});
}

function intervaloDatas(date1, date2){
  var d1 = converteData(date1);
  var d2 = converteData(date2);


  d1 = d1.split("/");
  d2 = d2.split("/");


  var ano = ((parseInt(d2[2])) - (parseInt(d1[2])));
  var mes = ((parseInt(d2[1])) - (parseInt(d1[1])));
  var dia = ((parseInt(d2[0])) - (parseInt(d1[0])));

  if(ano == 0) ano = "";
  if(ano < 0 ) ano = ano * -1;
  if(ano == 1) ano = ano+" ano,";
  if(ano > 1 ) ano = ano+" anos,";

  if(mes == 0) mes = "";
  if(mes < 0 ) mes = mes * -1;
  if(mes == 1) mes = mes+" mês,";
  if(mes > 1 ) mes = mes+" meses,";

  if(dia == 0) dia = "";
  if(dia < 0 ) dia = dia * -1;
  if(dia == 1) dia = dia+" dia";
  if(dia > 1 ) dia = dia+" dias";

  return " aproximadamente "+ano+" "+mes+" "+dia+" ";
}

function converteData(data){

   if((data == "")||(data == null)||(data == "null")||(data=="nil")){
    d = new Date();
    dia = d.getDate();
    mes = d.getMonth();
    ano = d.getFullYear();
    data = ano+"-"+mes+"-"+dia+"T 00:00";

  }
  var data2 = data.split("T");
  data2 = data2[0].split("-");
  return data2[2]+"/"+data2[1]+"/"+data2[0]
}

function date(){
  $(".dateGeral").datepicker();
  $.datepicker.regional['pt-BR'] = {
                closeText: 'Fechar',
                prevText: '&#x3c;Anterior',
                nextText: 'Pr&oacute;ximo&#x3e;',
                currentText: 'Hoje',
                monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho',
                'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
                'Jul','Ago','Set','Out','Nov','Dez'],
                dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
                dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
                weekHeader: 'Sm',
                dateFormat: 'dd/mm/yy',
                firstDay: 0,
                isRTL: false,
                showMonthAfterYear: false,
                yearSuffix: ''
   };
   $.datepicker.setDefaults($.datepicker.regional['pt-BR']);
}
function mask(){
  $(".phone").mask("(99) 99999-9999");
  $(".cep").mask("99999-999");
  date();
}

function selectizeField(id,url,url_save,title,setup_i){
  var theme_match = String(window.location).match(/[?&]theme=([a-z0-9]+)/);
  var theme = (theme_match && theme_match[1]) || 'bootstrap3';
  var themes = ['default','legacy','bootstrap2','bootstrap3'];
  $('head').append('<link rel="stylesheet" href="/assets/selectize.' + theme + '.css">');
  var $select = $("#"+id).selectize({
    create: function(input,callback){
      modalCreate({
        id: id,
        url: url+"?name="+input,
        title: title,
        save: url_save,
        setup: setup_i
      });
    },
    sortField: {
        field: 'text',
        direction: 'asc'
    },
    dropdownParent: 'body',

  });
}
