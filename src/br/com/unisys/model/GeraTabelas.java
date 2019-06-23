package br.com.unisys.model;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

@SuppressWarnings("deprecation")
public class GeraTabelas {

	
		public static void main(String[] args) {
			AnnotationConfiguration cfg = new AnnotationConfiguration();
			//cfg.addAnnotatedClass(Perfil.class);
			//cfg.addAnnotatedClass(Usuario.class);
			//cfg.addAnnotatedClass(Categoria.class);
			//cfg.addAnnotatedClass(Produto.class);
			cfg.addAnnotatedClass(Logradouro.class);
			cfg.addAnnotatedClass(Cliente.class);
		    
			SchemaExport se = new SchemaExport(cfg);
			se.create(true, true);
		}
}
