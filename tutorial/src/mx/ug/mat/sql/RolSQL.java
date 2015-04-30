/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.mat.sql;

/**
 *
 * @author Jan Jan
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.ug.mat.rol;
import mx.ug.mat.utilidades.Conexion;

public class RolSQL {


  public static List<rol> obtenerrol() {
        List<rol> lstrol = new ArrayList<>();
        String query = "select numRolID, strNombre from rol;;";
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement pst = cn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String nombre = rs.getString(2);


                rol a = new rol();
                a.setNombre(nombre);
                a.setID(id);
                lstrol.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lstrol;
    }

    public static void main(String[] args) {
        List<rol> lstrol = obtenerrol();
        for (rol rol : lstrol) {
            System.out.println(rol);
        }
    }
}
