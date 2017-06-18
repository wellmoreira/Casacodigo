package br.com.casacodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casacodigo.loja.daos.ProdutoDAO;
import br.com.casacodigo.loja.models.Produto;
import br.com.casacodigo.loja.models.TipoPreco;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.validation.ProdutoValidation;

@Controller
@RequestMapping("/produtos")
public class ProdutosController {
	
	@Autowired
	private ProdutoDAO produtoDao;
	
	@Autowired
	private FileSaver fileSaver;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder){
		binder.addValidators(new ProdutoValidation());
	}

	@RequestMapping("/form")
	public ModelAndView form(Produto produto){
		ModelAndView modelAndView = new ModelAndView("produtos/form");
		modelAndView.addObject("tipos", TipoPreco.values());// inicialmente usamos modelandviwes pq queriamos mandar o objeto preço pro form.jsps
		return modelAndView;
	}

	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value="produtosHome", allEntries=true)// limpa o cache quando chamar este metodo
	public ModelAndView gravar(MultipartFile sumario, @Valid Produto produto, BindingResult result,  RedirectAttributes redirectAttributes){
		
		if(result.hasErrors()){
			return form(produto);
		}
		
		String path = fileSaver.write("arquivos-sumario", sumario);
		produto.setSumarioPath(path);
		
		produtoDao.gravar(produto);
		redirectAttributes.addFlashAttribute("message","Produto cadastrado com sucesso");
		return new ModelAndView("redirect:produtos");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar(){
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("/produtos/lista");// permite ir pra lista dentro do webinf
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id){
		ModelAndView modelAndView = new ModelAndView("/produtos/detalhe");
		Produto produto = produtoDao.find(id);
		modelAndView.addObject("produto", produto);
		return modelAndView;
	}
}