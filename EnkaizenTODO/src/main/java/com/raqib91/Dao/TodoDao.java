package com.raqib91.Dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.raqib91.Entities.TODO;

public class TodoDao {

	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Transactional
	public void CreateTODO(TODO t) {
		hibernateTemplate.save(t);
	}

	@Transactional
	public void UpdateTODO(TODO t) {
		hibernateTemplate.update(t);
	}

	@Transactional
	public void DeleteTODO(int todoId) {
		TODO t = hibernateTemplate.get(TODO.class, todoId);
		hibernateTemplate.delete(t);
	}

	public TODO GetSingleTODO(int todoId) {
		TODO t = hibernateTemplate.get(TODO.class, todoId);
		return t;
	}

	public List<TODO> GetAllTODO() {
		List<TODO> todos = hibernateTemplate.loadAll(TODO.class);
		return todos;
	}

}
