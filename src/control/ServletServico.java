package control;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidade.DescricaoServico;
import entidade.Servico;
import service.ServiceServico;
import util.Upload;

/**
 * Servlet implementation class ServletServico
 */
@WebServlet({ "/admin/cadastrar_servico", "/admin/editar_servico", "/admin/atualizar_servico", "/admin/excluir_servico" })
@MultipartConfig
public class ServletServico extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletServico() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getServletPath();
		if (url.equalsIgnoreCase("/admin/editar_servico")) {
			editarServico(request, response);
		}
		if (url.equalsIgnoreCase("/admin/excluir_servico")) {
			deletarServico(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getServletPath();
		if (url.equalsIgnoreCase("/admin/cadastrar_servico")) {
			cadastrarServico(request, response);
		}
		if (url.equalsIgnoreCase("/admin/atualizar_servico")) {
			atualizarServico(request, response);
		} else {

		}
	}

	private void cadastrarServico(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String nomeServ = request.getParameter("nome");

			// Salvar os dados do formulário

			String path = getServletContext().getRealPath("/admin/imgProdutos") + "//";
			System.out.println(path);
			String[] descricaoServ = request.getParameterValues("descricaoServ");
			String[] valor = request.getParameterValues("precoServ");

			DescricaoServico d = null;

			Servico serv = new Servico();
			String imagem_servico = Upload.upload(request, response, request.getPart("servico_imagem"), path);
			serv.setNome(nomeServ);
			serv.setFoto(imagem_servico);
			List<DescricaoServico> lista = new ArrayList<DescricaoServico>();

			for (int i = 0; i < valor.length; i++) {

				d = new DescricaoServico();
				d.setCodigo(null);
				d.setDescricao(descricaoServ[i]);
				d.setValor(Double.parseDouble(valor[i].replace("R$", "").replace(",", ".")));
				lista.add(d);
				serv.setDesc(lista);

			}

			 new ServiceServico().save(serv);
			System.out.println(serv.toString());
			request.setAttribute("msg",
					"<div class='alert alert-success text-center' id='div' style='heigth:30px;'><button type='button' class='close' data-dismiss='alert'>×</button><span class='glyphicon glyphicon-thumbs-up' style='font-size:20px;'></span> Cadastro Realizado com Sucesso!</div>");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg",
					"<div class='alert alert-danger text-center' id='div'><button type='button' class='close' data-dismiss='alert'>×</button><span class='glyphicon glyphicon-thumbs-down' style='font-size:20px;'></span> Falha ao Cadastrar!</div>");
		} finally {
			request.getRequestDispatcher("cadastrar_servico.jsp").forward(request, response);
		}
	}

	private void atualizarServico(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String nomeServ = request.getParameter("nome");

			// Salvar os dados do formulário

			String path = getServletContext().getRealPath("/admin/imgProdutos") + "//";

			String[] descricaoServ = request.getParameterValues("descricaoServ");
			String[] valor = request.getParameterValues("precoServ");

			DescricaoServico d = null;

			Servico serv = new Servico();
			String imagem_servico = Upload.upload(request, response, request.getPart("servico_imagem"), path);
			serv.setCodigo(Long.parseLong(request.getParameter("idServ")));
			serv.setNome(nomeServ);
			serv.setFoto(imagem_servico);
			Integer size = Integer.parseInt(request.getParameter("descsize"));
			List<DescricaoServico> lista = new ArrayList<DescricaoServico>();
			for (int i = 0; i < descricaoServ.length; i++) {

				valor[i].trim();
				if (size > descricaoServ.length) {
					valor = request.getParameterValues("adprecoServ");
					d = new DescricaoServico();
					d.setCodigo(null);
					d.setDescricao(descricaoServ[i]);
					d.setValor(Double.parseDouble(valor[i].replace("R$", "").replace(",", ".")));
					lista.add(d);
					serv.setDesc(lista);
				} else {
					valor = request.getParameterValues("precoServ");
					d = new DescricaoServico();
					d.setCodigo(Long.parseLong(request.getParameter("idDesc")));
					d.setDescricao(descricaoServ[i]);
					d.setValor(Double.parseDouble(valor[i].replace("R$", "").replace(",", ".")));
					lista.add(d);
					serv.setDesc(lista);
				}
			}

			new ServiceServico().save(serv);
			System.out.println(serv.toString());
			request.setAttribute("msg",
					"<div class='alert alert-success text-center' id='div' style='heigth:30px;'><button type='button' class='close' data-dismiss='alert'>×</button><span class='glyphicon glyphicon-thumbs-up' style='font-size:20px;'></span> Servico editado com Sucesso!</div>");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("msg",
					"<div class='alert alert-danger text-center' id='div' style='heigth:30px;'><button type='button' class='close' data-dismiss='alert'>×</button><span class='glyphicon glyphicon-thumbs-up' style='font-size:20px;'></span> Falha ao Editar Servico!</div>");

			e.printStackTrace();

		} finally {
			request.getRequestDispatcher("servico.jsp").forward(request, response);
		}

	}

	private void editarServico(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ServiceServico s = new ServiceServico();
			Long id = Long.parseLong(request.getParameter("cod"));

			request.setAttribute("s", s.SelectById(id));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("editar_servico.jsp").forward(request, response);
		}

	}

	private void deletarServico(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String path = getServletContext().getRealPath("/admin/imgProdutos") + "//";

			File f = new File(path+request.getParameter("f"));
			f.delete();
			new ServiceServico().deleteDesc(Long.parseLong(request.getParameter("cod")));
			new ServiceServico().delete(Long.parseLong(request.getParameter("cod")));
			request.setAttribute("msg","<div class='alert alert-success text-center' id='div' style='heigth:30px;'><button type='button' class='close' data-dismiss='alert'>×</button><span class='glyphicon glyphicon-thumbs-up' style='font-size:20px;'></span> Servico Apagado!</div>");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("servico.jsp").forward(request, response);
		}
	}

}
