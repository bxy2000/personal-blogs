package com.bosic.blog.repository;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericRepository<T, PK extends Serializable>{
	private Class<T> clazz;

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public GenericRepository() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();

		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}
	
	public void add(T t) {
		sessionFactory.getCurrentSession().save(t);
	}

	public void update(T t) {
		sessionFactory.getCurrentSession().update(t);
	}

	public void delete(PK id) {
		Object t = sessionFactory.getCurrentSession().get(clazz, id);

		if (t != null) {
			sessionFactory.getCurrentSession().delete(t);
		}
	}

	public void delete(PK[] ids) {
		for (PK id : ids) {
			delete(id);
		}
	}

	public T find(PK id) {
		return (T) sessionFactory.getCurrentSession().get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public T find(String where, Object... params) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + clazz.getSimpleName() + " as u ";
		Query<T> query = session.createQuery(hql + " " + where);

		int i = 0;
		for (Object param : params) {
			query.setParameter(i++, param);
		}

		return (T) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(String where, String orderBy, Object... params) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + clazz.getSimpleName() + " as u ";
		Query<T> query = session.createQuery(hql + " " + where + " " + orderBy);

		int i = 0;
		for (Object param : params) {
			query.setParameter(i++, param);
		}

		return query.list();
	}

	@SuppressWarnings("unchecked")
	public long totalCount(String where, Object... params) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "select count(u) from " + clazz.getSimpleName() + " as u ";
		Query<T> query = session.createQuery(hql + " " + where);

		int i = 0;
		for (Object param : params) {
			query.setParameter(i++, param);
		}
		return (Long) query.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<T> findPage(int pageIndex, int pageSize, String where, String orderBy, Object... params) {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from " + clazz.getSimpleName() + " as u ";

		Query<T> query = session.createQuery(hql + " " + where + " " + orderBy);

		int i = 0;
		for (Object param : params) {
			query.setParameter(i++, param);
		}

		query.setFirstResult((pageIndex - 1) * pageSize);
		query.setMaxResults(pageSize);

		return query.list();
	}
}
