package com.bosic.blog.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bosic.blog.repository.GenericRepository;

@Transactional
public class GenericService<T, PK extends Serializable>{
	@Autowired
	protected GenericRepository<T, PK> genericRepository;
	
	public void add(T t) {
		genericRepository.add(t);
	}

	public void update(T t) {
		genericRepository.update(t);
	}

	public void delete(PK id) {
		genericRepository.delete(id);
	}
	
	public void delete(PK[] ids) {
		for(PK id : ids){
			genericRepository.delete(id);
		}
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public T find(PK id) {
		return genericRepository.find(id);
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public T find(String where, Object...params) {
		return genericRepository.find(where, params);
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public List<T> findAll() {
		return findAll("", "");
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public List<T> findAll(String where, String orderBy, Object...params) {
		return genericRepository.findAll(where, orderBy, params);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public PagedList<T> findPage(int pageIndex, int pageSize) {
		return findPage(pageIndex, pageSize, "", "");
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED, readOnly=true)
	public PagedList<T> findPage(int pageIndex, int pageSize, String where,
			String orderBy, Object... params) {
		long totalCount = genericRepository.totalCount(where, params);
		List<T> pages = genericRepository.findPage(pageIndex, pageSize, where, orderBy, params);
		
		return new PagedList<T>(pageIndex, pageSize, totalCount, pages);
	}
}
