package com.cxs.db;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.model.naming.ImplicitNamingStrategyJpaCompliantImpl;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
public class MyHibernateSessionFactory {
	private static SessionFactory sessionFactory;
	private static Session session = null;
	
	//构造方法私有化，单例模式
	private MyHibernateSessionFactory(){
		
	}
	//获得回话工厂对象
	public static Session getSession(){
		if(sessionFactory==null){
			StandardServiceRegistry standardRegistry = new StandardServiceRegistryBuilder()
				      .configure()
				      .build();
				Metadata metadata = new MetadataSources(standardRegistry).getMetadataBuilder()
				.applyImplicitNamingStrategy(ImplicitNamingStrategyJpaCompliantImpl.INSTANCE).build();
				sessionFactory = metadata.getSessionFactoryBuilder().build();
			session = sessionFactory.openSession();
			return session;
		}
		else
		{
			return session;
		}
	}
}
