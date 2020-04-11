showDate=1;
showDirectory=0;
showLightBox=0;
showAutor=1;
showDirLink=0;
showTime=1;
/*** ***/
selectedDir=''; // /lantri/hemeroteca-ris-brasil-vigevani-miyamoto
/*** LRSelect :: begin ***/
jQuery(document).ready(function($){
	if(showTime==1){
		$("#found small").show();
	}
	if(showAutor==1&&showDate==0){
		$("#results .search-result .search-result-author").css('border','0px');
	}
	
	
	reforceAscendente=0;
	if(showDirLink==0){
		$(".search-result").each(function(){
			searchResult=$(this);
			linkoftitle=$(this).find(".search-result-title a");
			linkoftitle=linkoftitle.attr('href');
			linkoftitle=linkoftitle.substring(linkoftitle.length - 4, linkoftitle.length);
			console.log("linkoftitle:"+linkoftitle);
			searchResultNumber=$(this).find(".search-result-number");
			searchResultNumber.hide();
		});
	}
	$("#OrdernarPor #sort").val("relevancyrating");
	$(".LRSelect_num_1 option").removeClass('selected');
	$(".LRSelect_num_1 option:nth-child(5)").addClass('selected');
	if(showAutor==0){
		$("#results .search-result-author").hide();
	}
	var url = window.location.href;
	linkUrl=url;
	urlQueryString=linkUrl.split('?',2);
	//console.log('urlQueryString:'+urlQueryString);
	selectedDir='';
	if(urlQueryString.length>1){
		optionsLoad=urlQueryString[1].split("&");

		$.each( optionsLoad, function( key, value ) {
			//console.log('urlQueryString:VALUE:'+value);
  			option=value.split("=");
  			if(option[0]=='query'){
  				query=decodeURI(option[1].replace(/\+/g, ' '));
  				$("#PainelDaConsulta input[name='query']").val(query);
  				if(showDirectory==0){
  					$("#found b i").html(query);
  				}
  			}
  			if(option[0]=='dir'){
  				selectedDir=option[1];
  				selectedDir=decodeURIComponent(selectedDir.replace(/\+/g, ' '));
				$("#foldersInput").val(selectedDir);
  			}
  			if(option[0]=='sort' && option[1]!=""){
  				$("#OrdernarPor").show();
  				$("#OrdernarPor #sort").val(option[1]);
  				$(".filtrosBox span:nth-child(2)").addClass('open');
  			}
  			if(option[0]=='ascending' && option[1]!=''){		
  				$("#OrdenarSentido").show();
  				$("#OrdernarPor #ordem").val(option[1]);
  				$(".filtrosBox span:nth-child(3)").addClass('open');
  				//console.log(".LRSelect.LRSelect_num_2 .option:nth-child(2)");
  				$(".LRSelect.LRSelect_num_2 .option").removeClass('selected');
  				$(".LRSelect.LRSelect_num_2 .option:nth-child(2)").addClass('selected teste');
  				console.log('option[1]:'+option[1]);
  				if(option[1]==1){
  					reforceAscendente=1;	
  				}	
  			}
  			if(option[0]=='after' && option[1]!=''){		
  				$(".filtrosBox span:nth-child(4)").addClass('open');
  				$("#EntreDadas").show();
  				$("#EntreDadas input[name='after']").val(option[1]);
  			}
  			if(option[0]=='before' && option[1]!=''){		
  				$(".filtrosBox span:nth-child(4)").addClass('open');
  				$("#EntreDadas").show();
  				$("#EntreDadas input[name='before']").val(option[1]);
  			}
		});
	}
	htmlPais='';
	htmlFilhos='';
	controle=0;
	//console.log('selectedDir:'+selectedDir);
	$("#Pastas .pasta").each(function(index){
		pai=$(this).find('.pai');
		filhos=$(this).find('.filho');
		if(filhos.length>0){
			htmlFilhos+="<div data-index='"+index+"' data-value="+pai.data("endereco")+" class='subOption option-"+index+" selected'>Todos as pastas</div>";	
			$(filhos).each(function(key,element){
				htmlFilhos+="<div data-index='"+index+"' data-value="+$(element).data("endereco")+" class='subOption option-"+index+"'>"+$(element).html()+"</div>";
			});
		}
		if(pai.length>0){
			if(selectedDir!=''){
				if(selectedDir==pai.data("endereco")){isSelected='selected';}
				else{isSelected='';}
				$(".filtrosBox span:nth-child(1)").addClass('open');
				$("#NaPasta").show();
			}else{
				if(controle==0){
					isSelected='selected';	
				}else{
					isSelected='';
				}
			}
			htmlPais+="<div data-index='"+index+"' data-value="+pai.data("endereco")+" class='option root-"+index+" "+isSelected+"'>"+pai.html()+"</div>";
		}
		controle++;
	});
	$(".LRSelect.directories").html(htmlPais);
	$(".LRSubSelect").html(htmlFilhos);
	$('.LRSubSelect .subOption').each(function(){
		valueSubOption=$(this).data('value');
		if(selectedDir==valueSubOption){
			dataIndex=$(this).data('index');
			$(".LRSubSelect .subOption.option-"+dataIndex).removeClass("selected");
			$(this).addClass("selected");
			$(".LRSelect .option.root-"+dataIndex).addClass("selected");
			$(".LRSubSelect .subOption.option-"+dataIndex).addClass("parentSelected");
		}
	});
	$(".LRSelect .option").each(function(){
		valueSubOption=$(this).data('value');
		if(selectedDir==valueSubOption){
			$(this).addClass("selected");
		}
	});
	if(showDate==1){
		$("#results .search-result .search-result-date").show();
	}else{
		$("#results .search-result .search-result-date").hide();
	}
	if(showDirectory==1){
		$("#results .search-result .search-result-url").show();
		$("#results .search-result .search-result-url a").show();
	}
	linkUrl=linkUrl.split("#");
	if(linkUrl[1]==undefined){
		$("#PainelDaConsulta").show();
	}else{
		$('section#page-'+linkUrl[1]).show();
	}
	$("a.carregarPagina").on('click',function(){
		linkUrl=$(this).attr('href');
		linkUrl=linkUrl.split("#");
		$("#PainelDaConsulta").hide();
		$('section.PaginasInternas').hide();
		$('section#page-'+linkUrl[1]).show();
		window.scrollTo(0,0);
		//console.log('scroll Top witch window');
		if(window.innerWidth<992){
			$("#MenuPrincipal").hide(80);	
		}
		$("#MenuBotao").removeClass('opened');
	});
	controlSelect=1;
	LrSelectsList=[];
	$("#OrdernarPor .LRSelect,#OrdenarSentido .LRSelect").each(function( index ) {
		
		select=$(this).data('select');
		html="";
		$(select).hide();
		Selected=$(select).val();
		selected_id="LRSelect_num_"+controlSelect;
		LrSelectsList.push('.'+selected_id);
		$(select+" option").each(function( index ) {
			value=$(this).val();			
			texto=$(this).data('texto');
			if(Selected==value) isSelected='selected';
			else isSelected='';
			if(texto!=undefined)	html+="<div data-value='"+value+"' data-select='."+selected_id+"' class='option "+isSelected+"' data-target='"+select+"'>"+texto+"</div>";
		});
		$(this).addClass(selected_id);
		$(this).html(html);
		controlSelect++;
	});
	$(document).mouseup(function(e){
		$.each(LrSelectsList, function( select_index, select_value ) {
  			var container = $(select_value);
  			if (!container.is(e.target) && container.has(e.target).length === 0){
	        	$(select_value).removeClass('open');
	    	}
		});
	});
	$(".LRSelect").on('click',function(){
		if($(this).hasClass('open')){
			$(this).removeClass('open');
		}else{
			$(this).addClass('open');			
		}
	});
	$(".LRSelect .option").on('click',function(){
		endereco=$(this).data('value');
		parentIndex=$(this).data('index');
		parentTarget=$(this).parent().data('select');

		kids=$(this).parent().children();
		//console.log("parentIndex:"+parentIndex);
		//console.log("parentTarget:"+parentTarget);
		//console.log("endereco:"+endereco);
		$(kids).removeClass('selected');
		$(this).addClass('selected');
		$(parentTarget).val(endereco);
		$(".LRSubSelect .subOption").removeClass('parentSelected');
		$(".LRSubSelect .subOption.option-"+parentIndex).addClass('parentSelected');
		$(".LRSubSelect .subOption.option-"+parentIndex).eq(0).addClass('selected');
	});
	$(document).on('click',".LRSubSelect .subOption.parentSelected",function(){
		if($(this).hasClass('open')){
			endereco=$(this).data('value');
			$("#foldersInput").val(endereco);
			$(".LRSubSelect .subOption").removeClass("open");
			$(".LRSubSelect .subOption").removeClass("selected");
			$(this).addClass('selected');
		}else{
			parentIndex=$(this).data('index');
			$(".LRSubSelect .subOption.option-"+parentIndex).addClass("open");
		}
	});
	$("#MenuBotao").on('click',function(){
		if($(this).hasClass('opened')){
			$("#MenuPrincipal").hide(250);
			$(this).removeClass('opened');
		}else{
			$("#MenuPrincipal").show(250);
			$(this).addClass('opened');
		}
	});
	$(".showHidden").on('click',function(){
		target=$(this).data('target');
		//console.log("target:"+target);
		if($(this).hasClass('open')){
			$($(this).data('target')).hide();
			$(this).removeClass('open');
		}else{
			$($(this).data('target')).show();
			$(this).addClass('open');
		}
	});
	$(".search-result-title a").attr('target','_blank');
	$("#results .search-result .search-result-title a").on('click',function(event){
		if(showLightBox==1){
			url=$(this).attr('href');
			texto=$(this).html();
			event.preventDefault();
			$("#lightBox").show().css('display','flex');
			$("#lightBox a").attr('href',url).html(texto);
		}
	});
	$("#lightBox .content .sair").on('click',function(){
		$("#lightBox").hide();
	});
	$("#lightBox .content a").on('click',function(){
		$("#lightBox").hide();
	});
	if($("#settings-box").length>0){
		$("#PainelDaConsulta").hide();
		$("#InstituicoesEnvolvidas").hide();
	}
	console.log("reforceAscendente:"+reforceAscendente);
	if(reforceAscendente==1){
		$("#OrdenarSentido #ordem").val('1');
		$(".LRSelect.LRSelect_num_2 .option").removeClass('selected');
  		$(".LRSelect.LRSelect_num_2 .option:nth-child(2)").addClass('selected teste');
	}

	$("#results .search-result .search-result-date").each(function(){
		dataBuscadaParaMudar=$(this).html().trim();
		console.log("dataBuscadaParaMudar:"+dataBuscadaParaMudar);
		var date=new Date(dataBuscadaParaMudar);
		var day = date.getDate();
		var monthIndex = date.getMonth()+1;
		var year = date.getFullYear();
		if(monthIndex<10){
			monthIndex='0'+monthIndex;
		}
		console.log("day:"+day);
		console.log("monthIndex:"+monthIndex);
		console.log("year:"+year);
		dateResult=day+'/'+monthIndex+'/'+year;
		console.log("dateResult:"+dateResult);
		console.log('----------------------------------------');
		$(this).html(dateResult);

		/*
		var day = date.getDate();
		var monthIndex = date.getMonth();
		var year = date.getFullYear();
		
		
		//console.log("dateResult:"+dateResult);
		
		*/
	})
});
/*** LRSelect :: end ***/
function clearForm(form){
	$(form).trigger("reset");	
}
