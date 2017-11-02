<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*" errorPage="404.jsp" %>
<jsp:useBean id="servBean" class="managed.ServicoManaged"></jsp:useBean>
<jsp:useBean id="prodBean" class="managed.ProdutoManaged"></jsp:useBean>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <title>HidemiPhone | Conserto de iPhone</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  
  <link rel="icon" type="image/png" sizes="32x32" href="img/favicon-32x32.png">
  
  <link rel="stylesheet" href="css/efeito-parallax.css" />

  <!-- inserindo css do Font Awesome -->
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all" />
  <link rel="stylesheet" href="css/estilo.css">
  <link rel="stylesheet" href="css/efeito-modal-imagem.css" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/efeito-mostrar-imagem.js"></script>
  
    <link rel="stylesheet" href="css/carousel.css" />
    
  <meta property="og:url" content="http://www.hidemiphone.atwebpages.com/index.html" />
  <meta property="og:type" content="website" />
  <meta property="og:title" content="HidemiPhone" />
  <meta property="og:description" content="Uma loja especializada em produtos e conserto da marca apple, iPhone, iPad entre outros e acessórios!" />
  <meta property="og:image og:image:width og:image:height" content="http://www.hidemiphone.atwebpages.com/path/image.jpg" />
  <meta property="fb:app_id" content="1518140674937267" />
    

  <style>
  .aparelho img{
    background: #E0FFFF;"
    border: 1px solid black;
}

 .custab {
      border: 0px solid #ccc;
      padding: 5px;
      margin: 5% 0;
      box-shadow: 3px 3px 2px #ccc;
      transition: 0.5s;
      text-align: left;
    }
    .custab:hover{
      box-shadow: 2px 2px 0px transparent;
      transition: 0.5s;
    }
    .thumbnail_prod{
      width: 300px;

    }
    .text-center.img-responsive{
      margin:0 auto;
      width: 80%;
    }

button.close {
	-webkit-appearance: none;
	padding: 0;
	cursor: pointer;
	background: 0 0;
	border: 0;
}

.close {
	float: right;
	font-size: 21px;
	font-weight: 700;
	line-height: 1;
	color: #555;
	text-shadow: 0 1px 0 #000;
	filter: alpha(opacity = 20);
	opacity: inherit;
}

  /*FOOTER START///////////////////*/

.footer1 {
    padding: 50px 0 20px 0;
    background-color: #e6e6e6;
    color: #fff;
}
.footer1 .title{
    text-align: center;
    color:#000;
    font-size:25px;}


.footer1 .facebook {
    width:100%;
    text-decoration: none;
    color: #fff;
    display: inline-block;
    padding: 5px 2px;
    margin: 1px;
    border-radius:4px;
    margin-top: 6px;
    background-color: #d4d4d4;
    border: solid 1px #fff;
}


  </style>


<!-- OUTRA FORMA -->

<script type="text/javascript" >
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('rua').value=("");
            document.getElementById('bairro').value=("");
            document.getElementById('cidade').value=("");
            document.getElementById('uf').value=("");
            document.getElementById('ibge').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('rua').value=(conteudo.logradouro);
            document.getElementById('bairro').value=(conteudo.bairro);
            document.getElementById('cidade').value=(conteudo.localidade);
            document.getElementById('uf').value=(conteudo.uf);
            document.getElementById('ibge').value=(conteudo.ibge);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
    }
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('rua').value="...";
                document.getElementById('bairro').value="...";
                document.getElementById('cidade').value="...";
                document.getElementById('uf').value="...";
                document.getElementById('ibge').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                cep.replace(".","");
                cep.replace("-","");
                script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };

    </script>
<script type="text/javascript">
  var controle = 4;
  function mudaEstilo() {
    var objDiv = document.getElementById('myPage');

    if (controle == 0) {
      controle++;
      objDiv.style.color = "#000000";
      objDiv.style.background = "#FFFFFF";

    } else if (controle == 1) {controle++;
      objDiv.style.color = "#FFFFFF";
      objDiv.style.background = "#FE2E2E";

    }  else if (controle == 2) {controle++;
      objDiv.style.color = "#000000";
      objDiv.style.background = "#A9E2F3";

    } else if (controle == 3) {controle++;
      objDiv.style.color = "#FFFFFF";
      objDiv.style.background = "#848484";

    } else {controle = 0;
      objDiv.style.color = "#FF0000";
      objDiv.style.background = "#FFFFD4";

    }
  }
</script>

<!-- FIM DA OUTRA FORMA -->
<style type="text/css" media="screen">
@media (max-width: 320px) 
{
  body
  {
    width: 100% !important;
  }
}
</style>
 <style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Oswald:300,400,700);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic);

/* Override UGG site */
#main {width: 100%; padding:0;}
.content-asset p {margin:0 auto;}
.breadcrumb {display:none;}

/* Helpers */
/**************************/
.margin-top-10 {padding-top:10px;}
.margin-bot-10 {padding-bottom:10px;}

/* Typography */
/**************************/
#parallax-world-of-ugg h1 {font-family:'Oswald', sans-serif; font-size:24px; font-weight:400; text-transform: uppercase; color:black; padding:0; margin:0;}
#parallax-world-of-ugg h2 {font-family:'Oswald', sans-serif; font-size:70px; letter-spacing:10px; text-align:center; color:white; font-weight:400; text-transform:uppercase; z-index:10; opacity:.9;}
#parallax-world-of-ugg h3 {font-family:'Oswald', sans-serif; font-size:14px; line-height:0; font-weight:400; letter-spacing:2px; text-transform: uppercase; color:black;}
#parallax-world-of-ugg p {font-family:'Source Sans Pro', sans-serif; font-weight:400; font-size:14px; line-height:24px;}
.first-character {font-weight:400; float: left; font-size: 84px; line-height: 64px; padding-top: 4px; padding-right: 8px; padding-left: 3px; font-family: 'Source Sans Pro', sans-serif;}

.sc {color: #3b8595;}
.ny {color: #3d3c3a;}
.atw {color: #c48660;}

/* Section - Title */
/**************************/
#parallax-world-of-ugg .title {background: white; padding: 60px; margin:0 auto; text-align:center;}
#parallax-world-of-ugg .title h1 {font-size:35px; letter-spacing:8px; margin-left: -20px;}

/* Section - Block */
/**************************/
#parallax-world-of-ugg .block {background: white; padding: 60px; width:450px; margin:0 auto; text-align:justify;}
#parallax-world-of-ugg .block-gray {background: #f2f2f2;padding: 60px;}
#parallax-world-of-ugg .section-overlay-mask {position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: black; opacity: 0.70;}

/* Section - Parallax */
/**************************/
#parallax-world-of-ugg .parallax-one {padding-top: 200px; padding-bottom: 200px; overflow: hidden; position: relative; width: 100%; background-image: url(img/hidemi-parallax-1.jpg?dpr=1&auto=format&fit=crop&w=1500&h=938&q=80&cs=tinysrgb&crop=); background-attachment: fixed; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover; background-repeat: no-repeat; background-position: top center;}
#parallax-world-of-ugg .parallax-two {padding-top: 200px; padding-bottom: 200px; overflow: hidden; position: relative; width: 100%; background-image: url(img/hidemi-parallax-3.jpg?dpr=1&auto=format&fit=crop&w=1500&h=1000&q=80&cs=tinysrgb&crop=); background-attachment: fixed; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover; background-repeat: no-repeat; background-position: center center;}
#parallax-world-of-ugg .parallax-three {padding-top: 200px; padding-bottom: 200px; overflow: hidden; position: relative; width: 100%; background-image: url(img/hidemi-parallax-2.png?dpr=1&auto=format&fit=crop&w=1500&h=1001&q=80&cs=tinysrgb&crop=); background-attachment: fixed; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover; background-repeat: no-repeat; background-position: center center;}
#parallax-world-of-ugg .parallax-four {padding-top: 200px; padding-bottom: 200px; overflow: hidden; position: relative; width: 100%; background-image: url(img/hidemi-parallax-9.jpg?dpr=1&auto=format&fit=crop&w=1500&h=1001&q=80&cs=tinysrgb&crop=); background-attachment: fixed; background-size: cover; -moz-background-size: cover; -webkit-background-size: cover; background-repeat: no-repeat; background-position: center center;}
/* Extras */
/**************************/
#parallax-world-of-ugg .line-break {border-bottom:1px solid black; width: 150px; margin:0 auto;}

/* Media Queries */
/**************************/
@media screen and (max-width: 959px) and (min-width: 768px) {
  #parallax-world-of-ugg .block {padding: 40px; width:620px;}
}
@media screen and (max-width: 767px) {
  #parallax-world-of-ugg .block {padding: 30px; width:420px;}
  #parallax-world-of-ugg h2 {font-size:30px;}
  #parallax-world-of-ugg .block {padding: 30px;}
  #parallax-world-of-ugg .parallax-one, #parallax-world-of-ugg .parallax-two, #parallax-world-of-ugg .parallax-three, #parallax-world-of-ugg .parallax-four {padding-top:100px; padding-bottom:100px;}
}
@media screen and (max-width: 479px) {
  #parallax-world-of-ugg .block {padding: 30px 15px; width:290px;}
}
 
 </style>

<script>
$(function(){
	$('#div').fadeOut(5000);
});
</script>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<!-- CURTIR -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.10&appId=1518140674937267';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<!-- COMENTARIOS -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.10&appId=1518140674937267';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<!-- TIMELINE -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.10&appId=1518140674937267';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<!-- PAINEL DO FACEBOOK -->
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1518140674937267',
      xfbml      : true,
      version    : 'v2.10'
    });
    FB.AppEvents.logPageView();
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/pt_BR/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>

  <nav class="navbar navbar-default navbar-fixed-top">
    <!-- <input class="btn btn-outline btn-default btn-xs btn-block" type="button" onclick="mudaEstilo()" value="Alterar fonte e background">
    <button class="btn btn-outline btn-default btn-xs btn-block"> Escolha sua cor de preferência?</button> -->

    <!-- Top Navbar -->
    <div class="top_nav hidden-xs">
      <div class="container">
        <ul class="list-inline info">
          <li><a href="#"><span class="fa fa-phone"></span> 21 3619-7990</a></li>
          <li><a href="mailto:consertoapple@live.com"><span class="fa fa-envelope"></span> consertoapple@live.com</a></li>
          <li><a href="#"><span class="fa fa-clock-o"></span> Segunda/Sexta 9hs-18hs- Sábado 9hs-13hs</a></li>
        </ul>
        <ul class="list-inline social_icon">
          <li><a href="https://www.facebook.com/hidemiphone/" target="_blanck"><span class="fa fa-facebook" style="font-size: 14px;"></span></a></li>
          <li><a href="https://www.instagram.com/hidemiphone/" target="_blanck"><span class="fa fa-instagram" style="font-size: 14px;"></span></a></li>
          <li><a href="#" target="_blanck"><span class="fa fa-youtube" style="font-size: 14px;"></span></a></li>
          <li><a href="http://bit.ly/2gEbSXr" target="_blank"><span class="fa fa-whatsapp" style="font-size: 14px;"></span></a></li>
        </ul>			
      </div>
    </div><!-- Top Navbar end -->

    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#myPage"><img class="img img-responsive" src="img/logo-hidemi-header.png" alt="" style="width: 155px; margin-top:-14px;"></a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right text-center">
          <li><a href="#home">HOME</a></li>
          <li><a href="#servico">SERVIÇO</a></li>
          <li><a href="#produto">PRODUTO</a></li>
          <li><a href="#tabelaPreco">TABELA DE PREÇOS</a></li>
          <li><a href="#orcamento">ORÇAMENTO</a></li>
          <li><a href="#contato">CONTATO</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <!--  -->

<script>
		   $(function () {
            $('.navbar-collapse ul li a:not(.dropdown-toggle)').bind('click touchstart', function () {
                    $('.navbar-toggle:visible').click();
                   
                     $(".nav li a").click(function() {
                      $(".navbar-collapse").collapse('hide');

                    });

            });
    });
	</script>
  <!--  -->

<!--  MODAL MESSANGER-->
<div class="messenger">
 <div class="modal fade" id="myMenssager" role="dialog" style="z-index: 9999;margin-top: 76px;margin-left: 90px;">
   <div class="modal-dialog modal-sm">
    <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fhidemiphone%2F&tabs=messages&width=340&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=false&appId" width="340" height="500" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
    <div class="container">
     <div id="fb-root"></div>
   </div>
 </div>
</div>
</div>
<div class="row"></div>
<!-- Container (Carousel) -->
 <div id="myCarousel" class="carousel slide hidden-xs" data-ride="carousel" data-interval="4000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="img/banner01.jpg" alt="banner01">
      <div class="carousel-caption">
        <h3></h3>
        <p></p>
      </div>
    </div>

    <div class="item">
      <img src="img/banner02.jpg" alt="banner02">
      <div class="carousel-caption">
        <h3></h3>
        <p></p>
      </div>
    </div>

    <div class="item">
      <img src="img/banner03.jpg" alt="banner03">
      <div class="carousel-caption">
        <h3></h3>
        <p></p>
      </div>
    </div>
    
    <div class="item">
      <img src="img/banner04.jpg" alt="banner04">
      <div class="carousel-caption">
        <h3></h3>
        <p></p>
      </div>
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="jumbotron text-center">
  <img class="img img-responsive" src="img/logo-hidemi-faixa.png" alt="Hidemiphone" style="width: 450px;margin:0 auto;">
  <p>Especializados no conserto de iPhone e iPad</p>
    <button class="btn btn-outline btn-danger btn-md" style="color: white;"><a href="#orcamento" style="text-decoration: none; color: white;">Solicite seu Orçamento</a></button>
</div>


<div id="parallax-world-of-ugg">
  
<section>
  <div class="title">
    <h3>A loja feita pra você!</h3>
    <h1>HIDEMIPHONE</h1>
  </div>
</section>

<section>
    <div class="parallax-one">
      <h2>ATENDIMENTO PERSONALIZADO</h2>
    </div>
</section>

<!-- Container (Portfolio Seção) -->
<div id="#" class="container-fluid text-center bg-grey">
 
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/tela.png" alt="Tela do Celular" width="320" height="300">
        <p><strong>Display Touch</strong></p>
        <p>A tela</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/flat.png" alt="Cabo Flat" width="320" height="300">
        <p><strong>Flat de Carga</strong></p>
        <p>Responsável pelas funções de conexão do carregador</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/bateria.png" alt="Bateria" width="320" height="300">
        <p><strong>Bateria</strong></p>
        <p>Responsavel por alimentar os componentes do celular</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/camera.png" alt="Camera" width="320" height="300">
        <p><strong>Camera</strong></p>
        <p>Responsavel por tirar foto e gravar videos</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/auto_falante.png" alt="Auto Falante" width="320" height="300">
        <p><strong>Auto Falante</strong></p>
        <p>Responsavel pelo som que vai sair do celular</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="img/placa-logica.png" alt="Placa Lógica" width="320" height="300">
        <p><strong>Placa Logica</strong></p>
        <p>É ela que controla todas as funções do iPhone</p>
      </div>
    </div>
  </div>
  <br>

  <h2 style="color:black;">Avaliações de nossos clientes!</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel" data-interval="4000" style="margin-top:-50px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"Sempre fui muito bem atendida, sou cliente desde 2012, e eles prezam o melhor para o cliente,<br> em todas as questões! Serviço de ótima qualidade!!"<br><span style="font-style:normal;font-weight: bold;">Karen Patitucci avaliou HidemiPhone Conserto de iPhones e iPads </span></h4>
      </div>
      <div class="item">
        <h4>"Rápido, eficaz , resolveu o problema antes do imaginado... recomendo."<br><span style="font-style:normal;font-weight: bold;">Felippe Caçula avaliou HidemiPhone Conserto de iPhones e iPads</span></h4>
      </div>
      <div class="item">
        <h4>"Melhor atendimento, serviço confiável e rápido atendimento,<br> indico a todos para realizar serviços."<br><span style="font-style:normal;font-weight: bold;">Thiago Bonifácio F Ribeiro avaliou HidemiPhone Conserto de iPhones e iPads</span></h4>
      </div>
      <div class="item">
        <h4>"Atendimento delivery e Rápido!! Além do Rodrigo ser super gente boa!<br> Adorei e indico!!"<br><span style="font-style:normal;font-weight: bold;">Milena Alves avaliou HidemiPhone Conserto de iPhones e iPads</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<section>
  <div class="parallax-two">
    <!-- <h2 style="color:black !important;font-size:35pt;" class="text-right">LIGUE:<br><span class="fa fa-phone"></span> 21 3619-7990</h2> -->
  </div>
</section>

<!-- Container (Home seção) -->
<div id="home" class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-8">
      <h2 style="color:black !important;font-size:30pt;">Sobre a empresa</h2><br>
      <h4>A HidemiPhone a 6 anos busca atender a todos os clientes da maneira mais clara e objetiva possível.</h4><br>
      <p>Serviços de Manutenção e Reparos que seu iPhone precisava você encontra na HidemiPhone, serviços com 90 dias de Garantia e atendimento personalizado para esclarecer todas as dúvidas referentes ao iPhone/iPad. Aqui cuidamos do seu iPhone.</p>
      <br>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-5">
      <img src="img/mao-segurando-iphone-face.png" alt="" width="400" height="555" class="img img-responsive logo slideanim" style="margin: 0 auto;">
    </div>
    <div class="col-sm-1"></div>
    <div class="col-sm-6">
      <h2 style="color:black; !important;font-size:16pt;">Um pouco sobre a história <br><br> de <br><br> HidemiPhone </h2><br>
      <h4 style="font-size: 16pt;color: black;"><strong>HidemiPhone</strong> criada em 2011 com o intuito de atender seus clientes em residências, escritórios, empresas e demais.</h4><br> 
      <p style="font-size: 12pt;color: black;"><strong>Nascemos</strong>  com o foco de ter um melhor atendimento e qualidade nos nossos serviços presando sempre a satisfação total de nossos clientes e amigos. Após 01 ano de empresa aberta, devido ao sucesso absoluto de nossa empresa no ramo fomos obrigados a abrir uma loja física para atender melhor nossos clientes.</p> 
      <p style="font-size: 12pt;color: black;">Prezamos sempre pela satisfação total de nossos clientes buscando nosso sucesso profissional, afinal, aqui na HidemiPhone nós cuidamos do seu iPhone.</p>
      
    </div>
    <div class="col"></div>
  </div>
</div>

<section>
  <div class="parallax-three">
    <!-- <h2 style="color:#F00 !important;">SERVIÇO RÁPIDO</h2> -->
  </div>
</section>

<!-- Container (Serviços seção) -->
<div id="servico" class="container-fluid text-center">
  <h2 style="color:black;font-size:35pt;">SERVIÇO RÁPIDO</h2>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="img/dinheiro.png">
      <h4>Baixo Custo</h4>
      <p>O Mais Barato da Região</p>
    </div>
    <div class="col-sm-4">
      <img src="img/tempo.png">
      <h4>Curto Prazo</h4>
      <p>Em menos de 2 horas ja resolvemos o seu problema</p>
    </div>
    <div class="col-sm-4">
      <img src="img/trabalhador.png">
      <h4>Trabalho</h4>
      <p>Especialista Experiente e Qualificado</p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <img src="img/garantia.png">
      <h4>Garantia</h4>
      <p>Garantia de até 3 meses</p>
    </div>
    <div class="col-sm-4">
      <img src="img/estudo.png">
      <h4>Estudo</h4>
      <p>Estudo comprovado !</p>
    </div>
    <div class="col-sm-4">
      <img src="img/milagre.png">
      <h4 style="color:#303030;">Não Fazemos Milagre</h4>
      <p>Consertarmos o aparelho em condições de uso</p>
    </div>
  </div>
</div>

<section>
    <div class="parallax-four">
      <!-- <h2>VENDA DE PRODUTOS E ACESSÓRIOS</h2> -->
    </div>
</section>
  


<!-- Container (Produto sessão) -->
<div id="produto" class="container-fluid text-center bg-grey">
  <div class="text-center">
    <h2 style="color:black;font-size:35pt;">PRODUTOS</h2>
    <h4>Vendas de aparelhos e acessórios</h4>
    <hr>
  </div>
  <div class="row slideanim">
  <c:forEach items="${prodBean.listaProd }" var="p">
    <div class="col-md-4">
      <div class="panel panel-default text-center img-produto">
        <!-- NOME DO RPODUTO -->
        <div class="panel-heading" style="background:black !important;">
          <h3 style="color:white;">${p.nome }</h3>
        </div>
        <!-- IMAGEM DO PRODUTO -->
        <img src="admin/imgProdutos/${p.foto }" class="img-responsive" alt="a" style="width:70%;margin:0 auto;"/>
        <!-- DESCRIÇÃƒO DO PRODUTO -->
        <div class="panel-body">
   			<p>${p.descricao }</p>
   			<br>
        </div>
        <!-- PREÇO DO PRODUTO -->
        <div class="panel-footer">
          <h3><fmt:formatNumber value="${p.preco }" type="currency"></fmt:formatNumber></h3>
          <h4>Garantia 90 dias</h4>
          <button class="btn btn-danger btn-block">Consulte outros Serviços</button>
        </div>
      </div>
    </div>
    </c:forEach>

  </div>
</div>

</div><!-- FIM DO PARALLAX -->
<!-- Container (Preço Sessão) -->
<div id="tabelaPreco" class="container-fluid bg-grey">
  <div  class="text-center">
    <h2>TABELA DE PREÇOS</h2>
   
    <hr>
  </div>
  <div class="row slideanim">
  <c:forEach items="${servBean.listaServ }" var="s">
     <div class="col-sm-4">
      <h4 class="text-center">${s.nome }</h4>
      <hr>
      <img class="text-center img img-responsive" src="admin/imgProdutos/${s.foto }">

      <table class="table table-striped custab">

        <thead>
          <tr>

            <th>Serviço</th>
            <th>Preço</th>
            
          </tr>
        </thead>
        <tbody> 

          
             
                    <c:forEach items="${servBean.getListaDesc(s.getCodigo())}" var="d">
                   		<tr><td> ${d.descricao }</td><td><fmt:formatNumber value="${d.valor }" type="currency"></fmt:formatNumber></td></tr>
                    </c:forEach>
            
                    

          
         </tbody>  
        <div class="panel-footer" id="painelP">
          <a href="#" class="btn btn-default btn-block btnServ">Consulte outros Serviços</a>
        </div>
      </table>

    </div>
    </c:forEach>
 
  </div>
</div>

<!-- Container (Pricing Section) -->
<div id="orcamento" class="container-fluid">
  <div class="text-center">
    <h2>ORÇAMENTO</h2>
    <h4>Estamos aguardando seu orçamento!</h4>
  </div>
  <div class="row">
${message }

    <form id="orcamCliente" name="formorc" method="POST" action="orcamento" data-toggle="validator" role="form" enctype="multipart/form-data">
      <div class="col-sm-6 col-sm-offset">
        <h2 style="margin-bottom:10px;" class="text-center"><i class="glyphicon glyphicon-log-in"></i> Dados do Cliente</h2>
        <hr>
        <div class="form-group">
         <label>Nome Completo</label>
         <input type="text" name="nome" class="form-control" placeholder="Digite seu nome..." required="required" data-error="* Por favor, informe seu nome completo.">  
         <div class="help-block with-errors"></div>
       </div>
       <div class="form-group">
         <label>Email</label>
         <input type="email" name="email" size="40" class="form-control" placeholder="Digite seu email..." required="required" data-error="* Por favor, informe seu email.">  
         <div class="help-block with-errors"></div>
       </div>
       <div class="form-group">
         <label>Telefone</label>
         <input type="text" name="telefone" size="40" class="form-control" placeholder="Digite seu Telefone..." required="required" data-error="* Por favor, informe seu telefone.">
         <div class="help-block with-errors"></div>
       </div>
       <div class="form-group">
         <label>CEP</label>
         <input type="text" name="cep" onblur="pesquisacep(this.value)" size="40" class="form-control" placeholder="Digite seu CEP..." required="required" data-error="* Por favor, informe um CEP válido.">  
         <div class="help-block with-errors"></div>
       </div>
       <div class="form-group">
         <label>Endereço</label>
         <input type="text" name="rua" id="rua" size="40" class="form-control" placeholder="Exemplo: Rua Almirante Teffé" required="required" data-error="* Por favor, informe seu endereço.">  
         <div class="help-block with-errors"></div>
       </div>
        <div class="form-group">
         <label>Numero</label>
         <input type="text" name="num" id="num" size="5" class="form-control" placeholder="Exemplo: 657" required="required" data-error="* Por favor, informe o numero da sua Ruo.">  
         <div class="help-block with-errors"></div>
         <script>
         
         $(function(){
  			$("#num").focus(function(){

  				if($("#num").val() == ""){
  					$("#num").val("Nº ");
  				}else if($("#num").val() != "Nº "){
  					//$("#num").val("teste");
  				}
  			}
  				);      	
  			
  			$("#num").focusout(function(){
  				if($("#num").val()== "Nº ")
  				$("#num").val("");
  			}
  				); 
        
         });

         </script>
       </div>
       <div class="form-group">
        <label>Bairro</label>
        <input type="text" name="bairro" id="bairro" size="40" class="form-control" placeholder="Digite seu Bairro..." required="required" data-error="* Por favor, informe seu Bairro.">  
        <div class="help-block with-errors"></div>
      </div>
      <div class="form-group">
        <label>Cidade</label>
        <input type="text" name="cidade" id="cidade" size="40" class="form-control" placeholder="Digite sua Cidade..." required="required" data-error="* Por favor, informe sua Cidade.">  
        <div class="help-block with-errors"></div>
      </div>

      <div class="">
        <hr>
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title text-center">Enviar imagem do aparelho.</h3>
          </div>
          <div class="panel-body">
            <ul>
              <li>Caso não consiga informar o modelo do aparelho.</li>
              <li>Envie 3 imagens do aparelho: da frente, verso e lateral para agilizar o atendimento.</li>
              <li>Envie somente arquivos de imagem no formato (<strong>JPG, PNG</strong>).</li> 
            </ul>
            <div class="col-md-6">
              <a href="#" class="btn btn-warning btn-block" data-toggle="modal" data-target="#addImagemModal" style="background-color: #630000 !important;"><i class="fa fa-plus"></i> Adicionar Imagem</a>
              <!-- MODAL IMAGENS -->
        <div class="modal fade" id="addImagemModal" style="margin-top: 86px;">
          <div class="modal-dialog modal-lg">
            <div class="modal-content" style="background-color:rgba(0, 0, 0, 0.91);">
              <div class="modal-header bg-warning text-white">
                <h2 class="modal-title text-center titulo" id="addImagemModalLabel">Adicionar Imagem</h2>
                <button class="close" data-dismiss="modal" id="modalImagem">
                  <span>&times;</span>
                </button>
              </div>

                <div class="modal-body" style="padding:2px; ">
                  <div class="col-md-10" style="margin-top: 20px;">
                    <div class="form-group">
                      <div class="main-img-preview">
                        <img class="thumbnail img-visualizar-1" src="img/iphone-parte-frente.jpg" title="iPhone de Frente">
                      </div>
                      <div class="input-group">
                        <div class="input-group-btn">
                          <div class="fileUpload btn btn-danger fake-shadow">
                            <span><i class="glyphicon glyphicon-upload"></i> Upload da imagem</span>
                            <input id="frente" name="frente" type="file" class="anexo_upload-1">
                          </div>
                        </div>
                        <input id="fakeUploadImagem-1" class="form-control fake-shadow" placeholder="Imagem do Frente" disabled="disabled">
                      </div>
                      <p class="help-block">* Imagem da frente do iPhone</p>
                    </div>

                    <div class="form-group">
                      <div class="main-img-preview">
                        <img class="thumbnail img-visualizar-2" src="img/iphone-parte-traz.jpg" title="iPhone a parte de traz">
                      </div>
                      <div class="input-group">
                        <div class="input-group-btn">
                          <div class="fileUpload btn btn-danger fake-shadow">
                            <span><i class="glyphicon glyphicon-upload"></i> Upload da imagem</span>
                            <input id="verso" name="verso" type="file" class="anexo_upload-2">
                          </div>
                        </div>
                        <input id="fakeUploadImagem-2" class="form-control fake-shadow" placeholder="Imagem do Verso" disabled="disabled">
                      </div>
                      <p class="help-block">* Imagem de trás do iPhone</p>
                    </div>

                    <div class="form-group">
                      <div class="main-img-preview">
                        <img class="thumbnail img-visualizar-3" src="img/iphone-lateral.jpg" title="iPhone de lateral">
                      </div>
                      <div class="input-group">
                        <div class="input-group-btn">
                          <div class="fileUpload btn btn-danger fake-shadow">
                            <span><i class="glyphicon glyphicon-upload"></i> Upload da imagem</span>
                            <input id="lateral" name="lateral" type="file" class="anexo_upload-3">
                          </div>
                        </div>
                        <input id="fakeUploadImagem-3" class="form-control fake-shadow" placeholder="Imagem do Lateral" disabled="disabled">
                      </div>
                      <p class="help-block">* Imagem da lateral do iPhone</p>
                    </div>
                  </div>
                </div>
              
              <div class="modal-footer">
                <button class="btn btn-secondary" data-dismiss="modal">Voltar</button>
              </div>
            </div>
          </div>
        </div>
              
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-sm-6">
      <h2 style="margin-bottom:10px;" class="text-center"><i class="glyphicon glyphicon-log-in"></i> Dados do Aparelho</h2>
      <hr>
      <div class="form-group">
       <label data-toggle="popover" data-trigger="hover" data-content="Envie uma Mensagem" data-placement="right" title="Digite *#06# para obter IMEI do aparelho.">Número de IMEI</label>
       <input type="text" name="serie" size="50" class="form-control" placeholder="Digite o numero do IMEI..." required="required" data-error="Por favor, informe o IMEI do aparelho.">  
       <div class="help-block with-errors"></div>
     </div>
     <div class="form-group">
      <label>Equipamento</label>
      <select name="equipamento" class="form-control" required="required" data-error="Por favor, informe qual equipamento.">
        <option value="">Selecione o tipo de aparelho</option>  
        <option value="iPhone">iPhone</option>
        <option value="iPad">iPad</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    <div class="form-group">
      <label>Modelo</label>
      <select name="modelo" class="form-control" required="required" data-error="Por favor, informe o modelo do aparelho.">
        <option value="">Selecione o modelo do aparelho</option>  
        <option value="iPhone 4">iPhone 4</option>
        <option value="iPhone 4S">iPhone 4S</option>
        <option value="iPhone 5">iPhone 5</option>
        <option value="iPhone 5C">iPhone 5C</option>
        <option value="iPhone 5S">iPhone 5S</option>
        <option value="iPhone 6">iPhone 6</option>
        <option value="iPhone 6 Plus">iPhone 6 Plus</option>
        <option value="iPhone 6S">iPhone 6S</option>
        <option value="iPhone 6S Plus">iPhone 6S Plus</option>
        <option value="iPhone SE">iPhone SE</option>
        <option value="iPhone 7">iPhone 7</option>
        <option value="iPhone 7 Plus">iPhone 7 Plus</option>
        <option value="iPhone 8">iPhone 8</option>
        <option value="iPhone 8 Plus">iPhone 8 Plus</option>
        <option value="iPad 2">iPad 2</option>
        <option value="iPad 3">iPad 3</option>
        <option value="iPad 4">iPad 4</option>
        <option value="iPad Air">iPad Air</option>
        <option value="iPad Air 2">iPad Air 2</option>
        <option value="iPad Mini">iPad Mini</option>
        <option value="iPad Mini 2">iPad Mini 2</option>
        <option value="iPad Mini 3">iPad Mini 3</option>
        <option value="iPad Mini 4">iPad Mini 4</option>
        <option value="iPad Pro">iPad Pro</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    <hr class="no_line">
    <div class="form-group">
      <label>Origem</label>
      <select name="origem" class="form-control" required="required" data-error="Por favor, informe a origem do aparelho.">
        <option value="">Selecione o País de origem do aparelho</option>
        <option value="Nacional">Nacional</option>
        <option value="Importado">Importado</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    <div class="form-group">
      <label>Cor da Tela</label>
      <select name="cor" class="form-control" required="required" data-error="Por favor, informe a cor do aparelho.">
        <option value="">Selecione a cor do aparelho</option> 
        <option value="Preto">Preto</option>
        <option value="Branco">Branco</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    <div class="form-group">
      <label>Selecione o problema do aparelho:</label>
      <select name="problema" class="form-control" required="required" data-error="Por favor, informe o problema do aparelho.">  
        <option value="">Selecione o problema do aparelho</option>
        <option value="Tela quebrada, apagada, manchada ou sensor de toque">Tela quebrada, apagada, manchada ou sensor de toque</option>
        <option value="Bateria dura pouco tempo">Bateria dura pouco tempo</option>
        <option value="Celular nao liga">Celular não liga</option>
        <option value="Celular molhou">Celular molhou</option>
        <option value="Celular nao carrega">Celular não carrega</option>
        <option value="Botao de Volume">Botão de Volume</option>
        <option value="Botao home nao funciona">Botão home não funciona</option>
        <option value="Alto falante (da orelha) nao funciona direito">Alto falante (da orelha) não funciona direito</option>
        <option value="Problema na camera dianteira">Problema na câmera dianteira</option>
        <option value="Problema na camera traseira">Problema na câmera traseira</option>
        <option value="Microfone">Microfone</option>
        <option value="Alto falante (viva voz)">Alto falante (viva voz)</option>
        <option value="Celular não vibra">Celular não vibra</option>
        <option value="Outros">Outros</option>
      </select>
      <div class="help-block with-errors"></div>
    </div>
    <hr style="margin-bottom: 20px;">
    <div class="form-group">
      <label>Descrição do problema apresentado</label>
      <textarea name="descricao" rows="6" maxlength="1000" placeholder="Descreva o defeito, máximo de 1000 caracteres" class="form-control" style="resize: none;" required="required" data-error="* Por favor, deixe-nos uma mensagem."></textarea>
      <div class="help-block with-errors"></div>
    </div>
    <div class="form-group">
      <input type="submit" class="btn btn-outline btn-danger btn-block btn-send" 
      name="enviarOrcam" value="Enviar Orçamento" onclick="validarOrcamento();" style="color: white;"/>
    </div>
  </div>

</form>
</div>

<hr>
</div>

<!-- Container (Contato sessão) -->
<div id="contato" class="container-fluid">
  <h2 class="text-center">CONTATO</h2>
  <h4 class="text-center">Entre em contato conosco e retornaremos o mais breve possível.</h4>
  <div class="row">
    <div class="col-sm-5">
      <div class="panel-heading">
        <h4 class="panel-title text-center titulo">
          <span class="glyphicon glyphicon-map-marker"></span> ENDEREÇO
        </h4>
      </div>
      <div class="panel panel-primary" style="background: rgba(0,0,0,0.10); border-radius:4px; height: 468px;">

        <div class="panel-body text-left">
          <p><span class="glyphicon glyphicon-map-marker logo-map"></span><a href="https://www.google.com.br/maps/dir/''/hidemiiphone/@-22.8966891,-43.1228013,20.08z/data=!4m8!4m7!1m0!1m5!1m1!1s0x9983db4775a5e9:0xa28d39fd436fddd9!2m2!1d-43.1225676!2d-22.8967325" target="_blanck"> Rua Almirante Teffé 657, Loja 28</a></p>
          <p><span class="glyphicon glyphicon-ok logo-map"></span> Shopping de Informática - INFO NITERÓI</p>
          <p><span class="glyphicon glyphicon-ok logo-map"></span>  Niterói, Centro</p>
          <p><span class="glyphicon glyphicon-phone logo-map"></span>  21 3619-7990</p>
          <p><span class="glyphicon glyphicon-envelope logo-map"></span> <a href="mailto:consertoapple@live.com"> consertoapple@live.com</a></p>
      <!--    <a  href="https://api.whatsapp.com/send?phone=5521999244944&text=Deixe%20uma%20%20mensagem%20com%20seu%20problema!%20Retornaremos%20o%20contato%20o%20mais%20rápido%20possível.%20Desde%20já%20agradecemos%20o%20contato!" target="_blank"><img src="img/whatsapp-ios-7-icon.png" class="img-responsive" alt="whatsapp" style="width:25px;height: 25px;"/></a>
          <a href="https://goo.gl/4UoCFJ" title="whatsapp" target="_blank"  style="float: left; margin-top: -25px; margin-left:27px;font-size: 11pt;text-decoration: none;color: black;">Enviar Mensagem Whatsapp</a>  --> 

        </div>

      </div>

    </div>
 
    <!-- <div class="col-sm-5">
      
      <p><span class="glyphicon glyphicon-map-marker"></span> Niterói, Centro</p>
      <p><span class="glyphicon glyphicon-phone"></span> 21 3619-7990</p>
      <p><span class="glyphicon glyphicon-envelope"></span> consertoapple@live.com</p>
    </div> -->

    <form id="faleConosco" name="formcad" method="POST" action="" data-toggle="validator" role="form">

      <div class="col-sm-7">
        <div class="panel-heading">

          <h4 class="panel-title text-center titulo">
            <span class="glyphicon glyphicon-log-in"></span>&nbsp; FALE CONOSCO
          </h4>

        </div>
        <div class="panel panel-primary" style="background: rgba(0,0,0,0.10); border-radius:4px;">

          <div class="panel-body text-left">
            <div class="form-group">
              <label>Nome *</label> 
              <input type="text" name="nome" class="form-control" placeholder="Digite seu Nome..." size="40" required="required" data-error="* Por favor, informe seu nome completo.">  
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
              <label>Email *</label> 
              <input type="email" name="email" class="form-control"
              placeholder="Digite seu email..." size="40" required="required" data-error="Por favor, informe um e-mail válido.">  
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
              <label>Telefone</label>
              <input type="text" name="tel" value="" size="40" class="form-control" placeholder="Digite seu Telefone..." required="required" data-error="* Por favor, informe seu telefone.">
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group">
              <label>Mensagem</label>
              <textarea name="mensagem" cols="30" rows="5" maxlength="1000" placeholder="Digite sua mensagem, máximo de 1000 caracteres" class="form-control" style="resize: none;" required="required" data-error="* Por favor, deixe-nos uma mensagem."></textarea>
              <div class="help-block with-errors"></div>
            </div>
            <hr style="color: white;">
            <input class="btn btn-outline btn-danger btn-block btn-send" type="submit"
            name="enviarContato" value="Enviar" onclick="validarContato();"  style="color: white;"/>

          </div>
          <!-- ${msg } -->
          <p class="text-center text-danger" id="v" style="color:red;font-size: 10pt;"></p>
        </div>
      </div>
    </form>
  </div>
</div>
<div class="panel-heading">
  <h3 class="panel-title text-center titulo" style="color:white;font-size: 145%;">
    <span class="glyphicon glyphicon-map-marker"></span> ONDE ESTAMOS!
  </h3>
</div>
<div class="googleMaps" style="margin-bottom: -8px;">
  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d229.71568970579722!2d-43.12256300000001!3d-22.896729!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa28d39fd436fddd9!2zSGlkZW1pUGhvbmUg76O_!5e0!3m2!1spt-BR!2sus!4v1506691022041" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>

<!-- ABRIR MENSSAGER NO MODAL-->
<script>

  <script>(function(d, s, id) {
   var js, fjs = d.getElementsByTagName(s)[0];
   if (d.getElementById(id)) return;
   js = d.createElement(s); js.id = id;
   js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.10";
   fjs.parentNode.insertBefore(js, fjs);
 }(document, 'script', 'facebook-jssdk'))
      <div class="fb-page" data-href="https://www.facebook.com/hidemiphone/" data-tabs="messages" data-width="350" data-height="500" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false">
      <blockquote cite="https://www.facebook.com/hidemiphone/" class="fb-xfbml-parse-ignore">
      <a href="https://www.facebook.com/hidemiphone/">Conserto de iPhones e iPads</a>
      </blockquote>
      </div>
    </script>
    <!-- FIM MENSSAGER NO MODAL-->

    <!-- MENSAGEM DO ICONE -->
    <div id="titulo_fixo">
      <h4 style="color: red;"></h4>
    </div>
    <!-- ICONES REDES SOCIAIS -->
    <div>
      <a class="btn btn-link btn-xs" id="botao_fixo" data-placement="left" data-toggle="popover" data-trigger="hover" data-content="Envie uma Mensagem">
        <img src="img/icone-compartilhar-preto.png" width="50" height="50" position="fixed" float="right" class="img-circle" style="border-radius: 50%;"></a>
      </div>
      <div id="redes_sociais" class="Rsocial text-center" position="fixed" style="height:170px;width:40px;display:none;bottom:60px;float: right; margin-right: 10px;">
        <br>
        <a href="https://www.instagram.com/hidemiphone/" target="_blanck">
          <img src="img/icone-instagram.png" class="img-responsive" alt="instagram" alt="" onclick="instagram()" float="left" style="width: 40px;">
        </a>
        <a href="http://bit.ly/2gEbSXr" target="_blanck">
          <img src="img/icone-whatsapp-iphone.png" class="img-resnposive" alt="whatsapp" alt="" onclick="whatsapp()" float="left" style="width: 40px;">
        </a>
        <a href="#" data-toggle="modal" data-target="#myMenssager" target="_blanck"><img src="img/icone-facebook-messenger.png" class="img-responsive" alt="menssager" alt="" onclick="menssager()" float="left" style="width: 40px;">
        </a>
      </div>
      
      <!-- TESTE PAGINA FACEBOOK NO SITE-->
  
  <div class="container-fluid">
    
    <footer class="footer1">
    <div class="container">
        <div class="row">
        <div class="col-md-5">
            <div class="text-center">
            <h4 class="title text-left">Curta nossa página!</h4>
            <center>
            <iframe class="timeline" src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fhidemiphone%2F&tabs&width=380&height=340&medium_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="380" height="320" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true">
              </iframe>
              </center>
            </div>
            </div>
        <div class="col-md-1"></div>
        
        <div class="col-md-6">
            <h4 class="title text-center">Comentários</h4>
            <div class="text-center">
            <div class="fb-comments facebook" data-href="http://hidemiphone.atwebpages.com/" data-width="420" data-numposts="5" data-colorscheme="light"></div>
               <br>
            <div class="fb-like facebook" data-href="https://www.facebook.com/hidemiphone" data-share="true" data-width="310" data-show-faces="true" data-colorscheme="light"></div>         
            </div>
            </div>
        
        </div>
        </div>
    </footer>
    </div>


  <footer id="rodape" class="container-fluid text-center">
    <a href="#myPage" title="To Top">
      <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p><a href="https://www.hidemiphone.com.br" target="_blank" title="HidEMiPhone">&copy; 2017 Todos direitos reservados </a>| Designed by Turma 2016.3</p>
  </footer>

  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  
  <script src="js/efeito-pagina.js"></script>
  
  <script src="js/contato.js"></script>
  <script src="js/orcamento.js"></script>
  <script src="js/validator.js"></script>
  

</body>
</html>