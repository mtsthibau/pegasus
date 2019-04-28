package modelo;

import java.sql.*;

public class BaseDados {

    private static BaseDados Instancia = null;
    private Connection Conexao = null;

    private BaseDados() {
        Conexao=connectDatabase();
    }

    public static BaseDados getInstancia() {
        if (Instancia == null) {
            Instancia = new BaseDados();
        }
        return Instancia;
    }

    private Connection connectDatabase(){
        String jdbcURL = "jdbc:mysql://localhost:3306/pegasus";
        String user = "root";
        String password = "";

        Connection Con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Con = DriverManager.getConnection(jdbcURL, user, password);
            Con.setAutoCommit(true);
        } catch (Exception e) {
            System.out.println(e);
        }finally{
             return Con;
        }
   
    }

    public int executeUpdate(String sql) throws SQLException {
        Statement St = getConnection().createStatement();
        return St.executeUpdate(sql);
    }

    public ResultSet executeQuery(String sql) throws SQLException {
        Statement St = getConnection().createStatement();
        return St.executeQuery(sql);
    }

    public PreparedStatement prepareStatement(String sql) throws SQLException{
        return Conexao.prepareStatement(sql);
    }

    public Connection getConnection() throws SQLException{
        if(Conexao.isClosed() || !Conexao.isValid(0)){
            Conexao=connectDatabase();
        }
        return Conexao;
    }

}
