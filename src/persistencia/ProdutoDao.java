package persistencia;

import java.util.ArrayList;
import java.util.List;
import entidade.Produto;

public class ProdutoDao extends Dao {

	public List<Produto> listarProduto() throws Exception {
		abrirConexao();

		stmt = con.prepareStatement("select idProduto, nomeProd,imagem_produto,descricaoProd,preco from tb_produto");

		rs = stmt.executeQuery();

		Produto p = null;
		List<Produto> lista = new ArrayList<Produto>();
		while (rs.next()) {
			
			String codigo = rs.getInt("idProduto") + "";
			
			p = new Produto(Long.parseLong(codigo), rs.getString("nomeProd"), rs.getString("imagem_produto"),
					rs.getString("descricaoProd"), rs.getDouble("preco"));
			lista.add(p);
		}

		stmt.close();
		rs.close();
		fecharConexao();
		return lista;
	}

	public void inserirProduto(Produto p) throws Exception {
		abrirConexao();

		if (p.getCodigo() == null) {
			stmt = con.prepareStatement("insert into tb_produto (nomeProd,imagem_produto,descricaoProd,preco) values (?,?,?,?)");
		} else {
			stmt = con.prepareStatement("update tb_produto set nomeProd = ?,imagem_produto = ?,descricaoProd = ?,preco = ? where idProduto = ?");
		}

		stmt.setString(1, p.getNome());
		stmt.setString(2, p.getFoto());
		stmt.setString(3, p.getDescricao());
		stmt.setDouble(4, p.getPreco());

		if(p.getCodigo() != null)
			stmt.setLong(5, p.getCodigo());
		
		stmt.execute();
		stmt.close();
		fecharConexao();
	}

	public List<Produto> buscarProdutoPorNome(String nome) throws Exception {
		abrirConexao();
		stmt = con.prepareStatement(
				"select idProduto, nomeProd,imagem_produto,descricaoProd,preco from tb_produto where nomeProd like ? DELIMITER 5");
		stmt.setString(1, "%" + nome + "%");
		rs = stmt.executeQuery();

		List<Produto> lista = new ArrayList<Produto>();
		Produto p = null;
		while (rs.next()) {
			String codigo = rs.getInt("idProduto") + "";
			p = new Produto(Long.parseLong(codigo), rs.getString("nomeProd"), rs.getString("imagem_produto"),
					rs.getString("descricaoProd"), rs.getDouble("preco"));
			lista.add(p);
		}
		stmt.close();
		rs.close();
		fecharConexao();
		return lista;
	}

	public Produto buscarProdutoPorId(Long id) throws Exception {
		abrirConexao();
		stmt = con.prepareStatement("select idProduto, nomeProd,imagem_produto,descricaoProd,preco from tb_produto where idProduto = ? ");
		stmt.setLong(1, id);
		rs = stmt.executeQuery();

		Produto p = null;
		if (rs.next()) {
			String codigo = rs.getInt("idProduto") + "";

			p = new Produto(Long.parseLong(codigo), rs.getString("nomeProd"), rs.getString("imagem_produto"),
					rs.getString("descricaoProd"), rs.getDouble("preco"));

		}
		stmt.close();
		rs.close();
		fecharConexao();
		return p;
	}

	public void excluirProduto(Long id) throws Exception {
		abrirConexao();

		stmt = con.prepareStatement("delete from tb_produto where idProduto = ?");

		stmt.setLong(1, id);

		stmt.execute();
		stmt.close();
		fecharConexao();
	}

}
