 <jsp:include page="header.jsp"></jsp:include>
<header id="main-header" class="py-2 bg-primary text-white">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h2><i class="fa fa-user"></i> Cadastrar Cliente</h2>
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
          ${msg }
            <div class="card-header">
              <h4>Cadastrar Cliente</h4>
            </div>
            <div class="card-block">
              <form action="cadastro" method="post">
                <div class="form-group">
                  <label for="title" class="form-control-label">Nome</label>
                  <input type="text" name="nome" class="form-control" value="">
                </div>
                <div class="form-group">
                  <label for="title" class="form-control-label">Email</label>
                  <input type="text" name="email" class="form-control" value="">
                </div>
                <div class="form-group">
                    <label>Telefone</label>
                    <div class="form-group input-group">
                         <input type="text" name="telefone" class="form-control">  
                    </div>
                    <label>Telefone 2</label>
                    <div class="form-group input-group">
                       <input type="text" name="telefone" class="form-control">  
                    </div>
                </div>
                <div class="form-group">
                  <label for="title" class="form-control-label">CEP</label>
                  <input type="text" name="cep" class="form-control" value="">
                </div>
                
                <div class="form-group">
                <div class="row">
                <div class="col-md-9">
                  <label for="title" class="form-control-label">Endereço</label>
                  <input type="text" name="endereco" class="form-control" value="">
                </div>
                <div class="col-md-3">
                  <label for="title" class="form-control-label">Nº </label>
                  <input type="text" name="numero" class="form-control" value="">
                  </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="title" class="form-control-label">Bairro</label>
                  <input type="text" name="bairro" class="form-control" value="">
                </div>
                <div class="form-group">
                  <label for="title" class="form-control-label">Cidade</label>
                  <input type="text" name="cidade" class="form-control" value="">
                </div>
                <div class="form-group">
                
                   <button type="submit" class="btn btn-success btn-md"><i class="fa fa-pencil"></i> 
          Cadastrar</button>
          			<a href="cliente.jsp" class="btn btn-info btn-md"><i class="fa fa-list-alt"></i> 
          Lista de clientes</a>
                </div>
               
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
<jsp:include page="footer.jsp"></jsp:include>