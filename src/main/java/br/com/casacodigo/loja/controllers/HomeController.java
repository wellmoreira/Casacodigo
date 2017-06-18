package br.com.casacodigo.loja.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.casacodigo.loja.daos.ProdutoDAO;
import br.com.casacodigo.loja.models.Produto;

@Controller
@Cacheable(value="produtosHome")
public class HomeController {
	
	 @Autowired
	    ProdutoDAO produtoDao;

	    @RequestMapping("/")
	    public ModelAndView index(){
	        List<Produto> produtos = produtoDao.listar();
	        ModelAndView modelAndView = new ModelAndView("home");
	        modelAndView.addObject("produtos", produtos);
	        return modelAndView;
	    }

}
