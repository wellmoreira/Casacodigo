package br.com.casacodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.casacodigo.loja.daos.ProdutoDAO;
import br.com.casacodigo.loja.models.Produto;
import br.com.casacodigo.loja.models.TipoPreco;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {
	
	@Autowired
	private ProdutoDAO produtoDao;

	@RequestMapping("/form")
	public ModelAndView form(Produto produto){
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());// inicialmente usamos modelandviwes pq queriamos mandar o objeto preço pro form.jsps
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	public String gravar(Produto produto){
		produtoDao.gravar(produto);
		return "produtos/ok";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar(){
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("/produtos/lista");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
}