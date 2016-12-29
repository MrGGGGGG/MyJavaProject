package com.cxs.dao;
import com.cxs.entity.User;
public class UserDaoimpl {
	public User userLogin(User u){
		return null;
		/*Transaction tx = null;
		String hql = "";
		try {
			
			Session session = MyHibernateSessionFactory.getSession();
			System.out.println(session.equals(null));
			tx = session.beginTransaction();
			//System.out.println(u.getCid()+u.getCpsd());
			hql = "from User where cid=? and cpsd=?";
			Query query=session.createQuery(hql);
			query.setParameter(0, u.getCid());
			query.setParameter(1, u.getCpsd());
			//System.out.println(hql);
			List list =query.getResultList();
			//System.out.println(list.size());
			tx.commit();
			if(list.size()>0){
				//System.out.println(list.get(0));
				return (User) list.get(0);
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			if (tx!=null) {
				tx=null;
			}
		}*/
	}
}
