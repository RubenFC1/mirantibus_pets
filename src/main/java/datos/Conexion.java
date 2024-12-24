package datos;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Objects;

public class Conexion {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mirantibus2_db?useSSL=false&useTimezone=true&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "admin";

    private static BasicDataSource dataSource;

    public static DataSource getDataSource() {
        if (dataSource == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                dataSource = new BasicDataSource();
                dataSource.setUrl(JDBC_URL);
                dataSource.setUsername(JDBC_USER);
                dataSource.setPassword(JDBC_PASSWORD);
                dataSource.setInitialSize(50);
                return dataSource;
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                return null;
            }
        }
        return dataSource;
    }

    public static Connection getConnection() throws SQLException {
        return Objects.requireNonNull(getDataSource()).getConnection();
    }

    public static void close(ResultSet resultSet) {
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(CallableStatement callableStatement) {
        try {
            callableStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(PreparedStatement preparedStatement) {
        try {
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void close(Connection connection) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}