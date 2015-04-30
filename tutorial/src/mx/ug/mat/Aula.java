/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.ug.mat;

import mx.ug.mat.mobiliario.Mobiliario;
import java.util.List;

/**
 *
 * @author Rolando
 */
public class Aula {

    List<Mobiliario> muebles;
    List<Alumno> alumnos;
    Profesor profesor;
    int piso;
    int numero;

    public Aula(List<Mobiliario> muebles, List<Alumno> alumnos, Profesor profesor, int piso, int numero) {
        this.muebles = muebles;
        this.alumnos = alumnos;
        this.profesor = profesor;
        this.piso = piso;
        this.numero = numero;
    }

}
