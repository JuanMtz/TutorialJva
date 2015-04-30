/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.ug.mat.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.ug.mat.Alumno;
import mx.ug.mat.utilidades.Conexion;

/**
 *
 * @author Rolando
 */
public class AlumnoSQL {

    public static List<Alumno> obtenerAlumnos() {
        List<Alumno> lstAlumnos = new ArrayList<>();
        String query = "SELECT numAlumnoID, strNombres, strApellidos, strDireccion FROM alumno;";
        Connection cn = Conexion.getConexion();
        try {
            PreparedStatement pst = cn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String nombres = rs.getString(2);
                String apellidos = rs.getString(3);
                String direccion = rs.getString(4);
                Alumno a = new Alumno();
                a.setNombres(nombres);
                a.setApellidos(apellidos);
                a.setDireccion(direccion);
                a.setId(id);
                lstAlumnos.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lstAlumnos;
    }

    public static void main(String[] args) {
        List<Alumno> lstAlumnos = obtenerAlumnos();
        for (Alumno alumno : lstAlumnos) {
            System.out.println(alumno);
        }
    }
}
