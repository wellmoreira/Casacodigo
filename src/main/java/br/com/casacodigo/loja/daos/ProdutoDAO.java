package br.com.casacodigo.loja.daos;


import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.casacodigo.loja.models.Produto;
import br.com.casacodigo.loja.models.TipoPreco;

@Repository
@Transactional
public class ProdutoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(Produto produto){
		manager.persist(produto);
	}
	
	@SuppressWarnings("unchecked")
	public List<Produto> listar(){
		return manager.createQuery("select distinct (p) from Produto p join fetch p.precos").getResultList();
	}
	
	public Produto find(int id){
		return manager.createQuery("select distinct(p) from Produto p join fetch p.precos precos where p.id = :id", Produto.class).setParameter("id", id).getSingleResult();
	}

	public BigDecimal somaPrecosPorTipo(TipoPreco tipoPreco) {
		TypedQuery<BigDecimal> query = manager
			.createQuery("select sum(preco.valor) from Produto p "
				+ " join p.precos preco where preco.tipo = :tipoPreco", BigDecimal.class);
		query.setParameter("tipoPreco", tipoPreco);
		
		return query.getSingleResult();
	}
	
}
