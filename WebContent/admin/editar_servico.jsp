 <jsp:include page="header.jsp"></jsp:include>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <header id="main-header" class="py-2 bg-primary text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h2>Editar Serviço</h2>
        </div>
      </div>
    </div>
  </header>

  <!-- ACTIONS -->
  <section id="actions" class="py-4 mb-4 bg-faded">
    <div class="container">
      <div class="row">
        <div class="col-md-5 mr-auto">
          <a href="index.jsp" class="btn btn-secondary btn-block"><i class="fa fa-arrow-left"></i> Voltar Painel de Controle</a>
        </div>
		<div class="col-md-2">
          
        </div>
        <div class="col-md-5">

        </div>
      </div>
    </div>
  </section>

  <!-- EDITAR PRODUTOS -->
  <section id="editar_produtos">
    <div class="container">
      <div class="row">
        <div class="col">
          <div class="card">
            <div class="card-header">
              <h4>Editar Serviço</h4>
            </div>
            <div class="card-block">
              <form action="atualizar_servico" method="POST" enctype="multipart/form-data">
                 <div class="form-group">
                          <div class="main-img-preview">
                            <img class="thumbnail img-mostrar-1" src="imgProdutos/${servico.foto }" title="Imagem do Serviço">
                        </div>
                        <hr>
                        <div class="input-group">
                            <div class="input-group-btn">
                              <div class="fileUpload btn btn-danger fake-shadow">
                                <span><i class="glyphicon glyphicon-upload"></i> Upload de imagem</span>
                                <input id="servico_imagem" name="servico_imagem" type="file" class="anexo_upload-1">
                            </div>
                        </div>
                        <input id="fakeUploadImagem-1" class="form-control fake-shadow" placeholder="Imagem do Serviço" disabled="disabled">
                    </div>
                    <small id="fileHelp" class="form-text text-muted">
                    <p class="help-block">* Imagem do serviço<br> Tamanho Máximo 3MB</p>
                    </small>
                </div>
                <div class="form-group">
                  <label for="title" class="form-control-label">Nome</label>
                  <input type="text" name="nome" class="form-control" value="${servico.nome }" placeholder="Nome do aparelho...">
                </div>
               <div class="form-group">
                <div class="row">
                <div class="col-md-9">
                  <label for="title" class="form-control-label">Descrição</label>
                  <input type="text" name="descricaoServ" class="form-control" value="${servico.descricao }" placeholder="Tipo de serviço...">
                </div>
                <div class="col-md-3">
                  <label for="title" class="form-control-label">Preço </label>
                  <input type="text" name="precoServ" class="form-control" value="<fmt:formatNumber value='${servico.valor }' type='currency'></fmt:formatNumber>" placeholder="Valor do serviço...">
                  </div>
                  </div>
                  <hr>
                   <span class="input-group-btn"><button type="button" class="btn btn-success btn-add btn-md" style="width: 40px;"><b>+</b></button></span>
                </div>
                <small id="fileHelp" class="form-text text-muted text-left">
                    <p class="help-block">* Pressione <span class="fa fa-plus"></span> para adicionar campo no formulário <br>* Pressione <span class="fa fa-minus"></span> para remover o campo do formulário</p>
                	</small>
                </div>
                <hr>
                <div class="form-group">
                   <button type="submit" class="btn btn-success btn-md"><i class="fa fa-cog"></i> 
          Editar</button>
          			<a href="servico.jsp" class="btn btn-info btn-md"><i class="fa fa-list-alt"></i> 
          Lista de serviços</a>
                </div>
                <small id="fileHelp" class="form-text text-muted">
                    <p class="help-block">* Pressione <span class="fa fa-plus"></span> para adicionar campo no formulário * Pressione <span class="fa fa-minus"></span> para remover o campo do formulário</p>
                	</small>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
<jsp:include page="footer.jsp"></jsp:include>