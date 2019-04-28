package controlador;

import java.sql.SQLException;
import java.util.ArrayList;
import modelo.dao.ParamDao;
import modelo.entidade.Parametro;

/**
 *
 * @author matheus
 */
public class ControladorParam {

    public static ArrayList<Parametro> getParams() throws Exception {
        return ParamDao.getParams();
    }
}
