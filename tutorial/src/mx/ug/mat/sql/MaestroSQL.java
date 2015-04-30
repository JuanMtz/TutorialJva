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
import mx.ug.mat.Maestro;
import mx.ug.mat.utilidades.Conexion;

public class MaestroSQL {


    public static List<Maestro> obtenerMaestro() {
        List<Maestro> lstMaestro = new ArrayList<>();
        String query = "SELECT strNombresMaestro, strApellidosMAestro, strEspecialidad  FROM maestro;";
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement pst = cn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                
                String nombre = rs.getString(1);
                String Apellido = rs.getString(2);
                String especialidad = rs.getString(3);
                Maestro a = new Maestro();
                a.setNombre(nombre);
                a.setApellido(Apellido);
                a.setEspecialidad(especialidad);

                lstMaestro.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lstMaestro;
    }

    public static void main(String[] args) {
        List<Maestro> lstMaestro = obtenerMaestro();
        for (Maestro maestro : lstMaestro) {
            System.out.println(maestro);
        }
    }
}
