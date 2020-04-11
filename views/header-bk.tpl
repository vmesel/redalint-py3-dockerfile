<html>
<head>
    <title>Hemeroteca PEB {{title}}</title>
    <link rel="stylesheet" type="text/css" href="static/style.css">
    <script type="text/javascript" src="static/jquery.js"></script>
    <script type="text/javascript" src="static/extra.js"></script>

    <script type="text/javascript" src="static/jdpicker.js"></script>
    <link rel="stylesheet" type="text/css" href="static/jdpicker.css">
    <link rel="icon" type="image/png" href="static/recoll.png">

    <!-- Adicionado 08-2018 :: inicio -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/assets/css/style.css?v=2019-02-04-1327" />
    <link rel="stylesheet" media="(max-width: 992px)" href="/static/assets/css/style-mobile.css?v=2019-02-04-1327" />
    <link rel="stylesheet" media="(min-width: 993px)" href="/static/assets/css/style-desktop.css?v=2019-02-04-1327" />
    <script src="/static/assets/js/jquery.min.js"></script>
    <script src="/static/assets/js/script.js?v=2019-02-04-1828"></script>
    <link href="https://www2.unesp.br/imagens/icones/unesp.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="https://www2.unesp.br/imagens/icones/unesp.ico" rel="icon" />

    <!-- Adicionado 08-2018 :: inicio -->

</head>
<body>
<header>
        <div class="container">
            <div class="row itemsCenter justifyBetween mobile-ph10">
                <div class="col col-9 pc-hidden flex justifyCenter">
                    <a href="https://acervo.redalint.org/recoll/"><img src="/static/assets/img/hemeroteca.jpg"></a>
                </div>
                <div class="col col-3 pc-hidden flex justifyCenter">
                    <div id="MenuBotao">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
        <nav id="MenuPrincipal">
            <div class="container">
                <ul class="menu">
                    <li id="MenuLogo">
                        <a href="https://acervo.redalint.org/recoll/"><img src="/static/assets/img/hemeroteca.jpg">
                        </a>
                    </li>
                    <li><a href="https://acervo.redalint.org/recoll/#SobreEsteSite" class="carregarPagina">Sobre este site</a></li>
                    <li><a href="https://acervo.redalint.org/recoll/#historico" class="carregarPagina">Histórico</a></li>
                    <li><a href="https://acervo.redalint.org/recoll/#ComoPesquisa" class="carregarPagina">Como Pesquisar</a></li>
                    <li><a href="https://acervo.redalint.org/recoll/#Equipe" class="carregarPagina">Equipe</a></li>
		   <!-- <li><a href="settings" tabindex="-1">Configurações</li> -->
                    <li class="pc-hidden"><a href="https://acervo.redalint.org/recoll/#instituicoes_envolvidas" class="carregarPagina">Instituições Envolvidas</a></li>
                </ul>
            </div>
        </nav>
</header>
<div id="fade"></div>
%include consulta
%include sobreestesite
%include historico
%include comopesquisa
%include equipe
%include instituicoesenvolvidas
