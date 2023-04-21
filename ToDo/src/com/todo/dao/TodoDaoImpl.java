package com.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.todo.model.Todo;
import com.todo.utils.JDBCUtils;

/**
 * This DAO class provides CRUD database operations for the table todos in the
 * database.
 *
 * @author Arzoo khatri
 */

public class TodoDaoImpl implements TodoDao {

	private static final String INSERT_TODOS_SQL = "INSERT INTO todos"
			+ "  (title, username, description,  is_done) VALUES " + " (?, ?, ?, ?);";

	private static final String SELECT_TODO_BY_ID = "select id,title,username,description,is_done from todos where id =?";
	private static final String SELECT_ALL_TODOS = "select * from todos";
	private static final String DELETE_TODO_BY_ID = "delete from todos where id = ?;";
	private static final String UPDATE_TODO = "update todos set title = ?, username= ?, description =?, is_done = ? where id = ?;";

	public TodoDaoImpl() {
	}

	@Override
	public void insertTodo(Todo todo) throws Exception {
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TODOS_SQL)) {
			preparedStatement.setString(1, todo.getTitle());
			preparedStatement.setString(2, todo.getUsername());
			preparedStatement.setString(3, todo.getDescription());
			preparedStatement.setBoolean(4, todo.getStatus());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
			e.printStackTrace();
		}
	}

	@Override
	public Todo selectTodo(long todoId) {
		Todo todo = null;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TODO_BY_ID);) {
			preparedStatement.setLong(1, todoId);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String title = rs.getString("title");
				String username = rs.getString("username");
				String description = rs.getString("description");
				boolean isDone = rs.getBoolean("is_done");
				todo = new Todo(id, title, username, description, isDone);
			}
		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
			e.printStackTrace();
		}
		return todo;
	}

	@Override
	public List<Todo> selectAllTodos() {
		List<Todo> todos = new ArrayList<>();
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TODOS);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				long id = rs.getLong("id");
				String title = rs.getString("title");
				String username = rs.getString("username");
				String description = rs.getString("description");
				boolean isDone = rs.getBoolean("is_done");
				todos.add(new Todo(id, title, username, description, isDone));
			}
		} catch (SQLException e) {
			JDBCUtils.printSQLException(e);
			e.printStackTrace();
		}
		return todos;
	}

	@Override
	public boolean deleteTodo(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_TODO_BY_ID);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	@Override
	public boolean updateTodo(Todo todo) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = JDBCUtils.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_TODO);) {
			statement.setString(1, todo.getTitle());
			statement.setString(2, todo.getUsername());
			statement.setString(3, todo.getDescription());
			statement.setBoolean(4, todo.getStatus());
			statement.setLong(5, todo.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
}
