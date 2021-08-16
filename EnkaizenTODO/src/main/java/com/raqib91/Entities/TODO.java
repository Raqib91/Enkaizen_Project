package com.raqib91.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TodoTable")
public class TODO {

	@Id
	@GeneratedValue
	private int todoId;
	private String todoTitle;
	private String todoDescription;
	private String todoStatus;

	public TODO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TODO(String todoTitle, String todoDescription, String todoStatus) {
		super();
		this.todoTitle = todoTitle;
		this.todoDescription = todoDescription;
		this.todoStatus = todoStatus;
	}

	public int getTodoId() {
		return todoId;
	}

	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}

	public String getTodoTitle() {
		return todoTitle;
	}

	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}

	public String getTodoDescription() {
		return todoDescription;
	}

	public void setTodoDescription(String todoDescription) {
		this.todoDescription = todoDescription;
	}

	public String getTodoStatus() {
		return todoStatus;
	}

	public void setTodoStatus(String todoStatus) {
		this.todoStatus = todoStatus;
	}

	@Override
	public String toString() {
		return "TODO [todoId=" + todoId + ", todoTitle=" + todoTitle + ", todoDescription=" + todoDescription
				+ ", todoStatus=" + todoStatus + "]";
	}

}
