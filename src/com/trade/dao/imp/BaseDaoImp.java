package com.trade.dao.imp;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.trade.common.Constants;
import com.trade.dao.BaseDao;

public class BaseDaoImp implements BaseDao{

	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void delete(Object entity) {
		this.hibernateTemplate.delete(entity);
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> findByPage(final String hql, final int currentPage) {
		return (List<Object>) hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createQuery(hql);
				query.setFirstResult(Constants.TotalPage*(currentPage-1));
				query.setMaxResults(Constants.TotalPage);
				return query.list();
			}
			
		});
	}

	@SuppressWarnings("unchecked")
	public List<Object> findByhql(String hql) {
		return hibernateTemplate.find(hql);
	}

	@SuppressWarnings("unchecked")
	public List<Object> findBysql(final String sql) {
		return (List<Object>) hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createSQLQuery(sql);
				return query.list();
			}
			
			
		});
	}

	public void save(Object entity) {
		this.hibernateTemplate.save(entity);
	}

	public void update(Object entity) {
		this.hibernateTemplate.update(entity);
	}

	public void delete(final String hql) {
		this.hibernateTemplate.execute(new HibernateCallback(){

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				session.createQuery(hql).executeUpdate();
				return null;
			}
			
		});
	}

	public Long countByhql(final String hql) {
		return (Long) hibernateTemplate.execute(new HibernateCallback(){

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createQuery(hql);
				return query.uniqueResult();
			}
		});
	}

	public Object getObj(Class cls, int id) {
		return hibernateTemplate.get(cls, id);
	}

	public List findByPage(final String hql, final int currentPage,final int total) {
		return (List<Object>) hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createQuery(hql);
				query.setFirstResult(total*(currentPage-1));
				query.setMaxResults(total);
				return query.list();
			}
			
			
		});
	}

	public List findBysqlPage(final String sql, final int currentPage) {
		return (List<Object>) hibernateTemplate.execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createSQLQuery(sql);
				query.setFirstResult(Constants.TotalPage*(currentPage-1));
				query.setMaxResults(Constants.TotalPage);
				return query.list();
			}
			
			
		});
	}

	public long countBysql(final String sql) {
		return (Long) hibernateTemplate.execute(new HibernateCallback(){

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query=session.createSQLQuery(sql);
				BigInteger total=(BigInteger) query.uniqueResult();
				return total.longValue();
			}
		});
	}

	public Object getObj(Class cls, long id) {
		return this.hibernateTemplate.get(cls, id);
	}

	
}
