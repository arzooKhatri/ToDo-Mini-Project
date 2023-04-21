package com.todo.dao;

import java.sql.SQLException;
import java.util.List;

import com.todo.model.Todo;

public interface TodoDao {

	void insertTodo(Todo todo) throws SQLException, Exception;

	Todo selectTodo(long todoId);

	List<Todo> selectAllTodos();

	boolean deleteTodo(int id) throws SQLException;

	boolean updateTodo(Todo todo) throws SQLException;
}