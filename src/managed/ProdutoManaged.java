package managed;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.Bean1;
import entidade.Produto;
import persistencia.ProdutoDao;

public class ProdutoManaged extends Bean1{
 
 private List<Produto> listaProd;
 
 
 public List<Produto> getListaProd() throws Exception {
  ProdutoDao pd = new ProdutoDao();
  
  return pd.listarProduto();
 }
 public void setListaProd(List<Produto> listaProd) {
  this.listaProd = listaProd;
 }
 
}