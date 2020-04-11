<div class="hidden" id="Pastas">
    <div class="pasta">
        <div class="pai" data-endereco="/lantri/acervo_redalint">Todas as Pastas</div>
    </div>
    <div class="pasta">
        <div class="pai" data-endereco="/lantri/acervo_redalint/livros">Livros</div>
        <div class="filho" data-endereco="/lantri/acervo_redalint/livros/livros_inteiros">Capítulos de livros</div>
        <div class="filho" data-endereco="/lantri/acervo_redalint/livros/cap_livros">Livros inteiros</div>
    </div>
    <div class="pasta">
        <div class="pai" data-endereco="/lantri/acervo_redalint/teses_dissertacoes">Teses e Dissertações</div>
        <div class="filho" data-endereco="/lantri/acervo_redalint/teses_dissertacoes/teses">Teses de Doutorado</div>
        <div class="filho" data-endereco="/lantri/acervo_redalint/teses_dissertacoes/dissertacoes">Dissertações de Mestrado</div>
        </div>
    <div class="pasta">
        <div class="pai" data-endereco="/lantri/acervo_redalint/artigos_periodicos">Artigos Acadêmicos</div>
    </div>
</div>
			                
<section id="Consulta">
	<div id="PainelDaConsulta">
		<div class="container">
			<form action="results" method="get">
				<div class="row">
					<div class="col col-12 col-pc-12">
						<label>Consulta</label>
						<input type="text" name="query">
						
					</div>
					<div class="col col-12 col-pc-6 filtrosBox">
						<span class="showHidden" data-target="#NaPasta">Na pasta</span>
						<span class="showHidden" data-target="#OrdernarPor">Ordenar por</span>
						<span class="showHidden" data-target="#OrdenarSentido">Ordem</span>
					        <span class="showHidden" data-target="#EntreDadas">Entre Datas</span>
						
					</div>
					<div class="col col-12 col-pc-6">
						<div class="flex" id="searchClean">
								<button><i class="fas fa-search"></i> Buscar</button>
								<button onclick="clearForm('form')" type=button><i class="fas fa-eraser"></i>Limpar</button>
						</div>
					</div>
					<div class="col col-12 col-pc-4 hidden pt40" id="NaPasta">
						<label>Pastas</label>


						<!-- <input id="foldersInput" name="dir" class="hidden" value="/lantri/acervo_redalint" /> -->
						<!--
						<select id="folders" class="hidden">
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto" data-texto="Todas as Pastas">
			                	hemeroteca-ris-brasil-vigevani-miyamoto
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-africa" data-texto="Brasil - África">
			                	brasil-africa
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-america_latina" data-texto="Brasil - América Latina">
			                	brasil-america_latina
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-argentina" data-texto="Brasil - Argentina">
			                	brasil-argentina
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-asia" data-texto="Brasil - Ásia">
			                	brasil-asia
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-dialogo_subnacional" data-texto="Brasil - Diálogo subnacional">
			                	brasil-dialogo_subnacional
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-economia_internacional" data-texto="Brasil - Economia Internacional">
			                	brasil-economia_internacional
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-eua" data-texto="Brasil - Estados Unidos">
 			                	brasil-eua
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-europa" data-texto="Brasil - Europa">
			                	brasil-europa
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-informatica_e_direitos_autorais" data-texto="Brasil - Informática e Direitos Autorais">
			                	brasil-informatica_e_direitos_autorais
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-meio_ambiente" data-texto="Brasil - Meio Ambiente">
			                	brasil-meio_ambiente
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-oriente_medio" data-texto="Brasil - Oriente Médio">
			                	brasil-oriente_medio
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/brasil-politica_exterior" data-texto="Brasil - Política Exterior">
			                	brasil-politica_exterior
			                </option>
			                <option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/gazeta_mercantil_especial" data-texto="Brasil - Gazeta Mercantil Especial">
			                	gazeta_mercantil_especial
			                </option>
			                <option style="margin-left: 0em" selected="" value="<all>" data-texto="Todas as Pastas">
			                	Todas as pastas
			                </option>
					<option  value="/lantri/hemeroteca-ris-brasil-vigevani-miyamoto/Brasil_Brasileiro_ptbr" data-texto="Brasil - Tullo Vigevani">
                                                Brasil_Brasileiro_ptbr
                                        </option>
						</select>
					-->
						<div class="LRSelect directories" data-select="#foldersInput"></div>
						<div class="LRSubSelect" data-select="#foldersInput"></div>
					</div>
					<div class="col col-12 col-pc-4 hidden pt40" id="OrdernarPor">
						<label>Ordenar por</label>
						<select name="sort" id="sort">
							<option selected="" value="mtime" data-texto="Data">
								Data
							</option>
							<option selected="" value="title" data-texto="Título da Notícia">
                                                                Título da Notícia
                                                        </option>
						 	<option value="url" data-texto="Caminho">
								Caminho
							</option>
							<option value="filename" data-texto="Nome do Arquivo">
								Nome do Arquivo
							</option>
							<option value="relevancyrating" data-texto="Relevância">
								Relevância
							</option>
							<option value="fbytes" data-texto="Tamanho do Arquivo">
								Tamanho do Arquivo
							</option>
	                		<option value="author" data-texto="Autor">Autor</option>
						</select>
						<div class="LRSelect" data-select="select#sort"></div>
					</div>
					<div class="col col-12 col-pc-4 hidden pt40" id="OrdenarSentido">
						<label>Ordem</label>
						<select name="ascending" id="ordem">
							<option value="0" selected data-texto="Descendente">Descendente</option>
							<option value="1" data-texto="Ascendente">Ascendente</option>
						</select>
						<div class="LRSelect" data-select="select#ordem"></div>
					</div>
					<input type="hidden" name="page" value="1">
					<div class="col col-12 col-pc-4 hidden pt40" id="EntreDadas">
					 	Datas
						Depois de<input type="date" name="after" value="" autocomplete="off" placeholder="YYYY[-MM][-DD]">
						Até <input type="date" name="before" value="" autocomplete="off" placeholder="YYYY[-MM][-DD]">
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
