package br.com.unisys.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

@SuppressWarnings("deprecation")
public class HibernateUtil {
	
private static SessionFactory factory;
	
	static {
			AnnotationConfiguration cfg = new AnnotationConfiguration();
			cfg.addAnnotatedClass(Perfil.class);
			cfg.addAnnotatedClass(Usuario.class);
			cfg.addAnnotatedClass(Categoria.class);
			cfg.addAnnotatedClass(Produto.class);
			cfg.addAnnotatedClass(Logradouro.class);
			cfg.addAnnotatedClass(Cliente.class);
			
		    factory = cfg.buildSessionFactory();
			}
	
	public Session getSession() {
		return factory.openSession();
	}	
}
