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
	
	//���췽��˽�л�������ģʽ
	private MyHibernateSessionFactory(){
		
	}
	//��ûػ���������
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
