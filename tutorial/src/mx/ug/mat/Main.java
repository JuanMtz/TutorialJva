/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.ug.mat;

import mx.ug.mat.mobiliario.Mesa;
import mx.ug.mat.mobiliario.Librero;
import mx.ug.mat.mobiliario.Silla;
import mx.ug.mat.mobiliario.Mobiliario;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rolando
 */
public class Main {

    public static void main(String[] args) {
        List<Alumno> lstAlumnos = new ArrayList<>();
        //Todo el código aquí
        Alumno a1 = new Alumno();
        a1.nombres = "Juan Antonio";
        a1.apellidos = "Martinez Herrera";
        a1.edad = 20;
        a1.nua = "14489";
        a1.sexo = 1;
        //--
        Alumno a2 = new Alumno();
        a2.nombres = "Mayra Yadira";
        a2.apellidos = "Mejía Sierra";
        a2.edad = 20;
        a2.nua = "14487";
        a2.sexo = 0;
        //--
        lstAlumnos.add(a1);
        lstAlumnos.add(a2);

        //--Mobiliario
        List<Mobiliario> lstMobiliario = new ArrayList<>();
        //Sillas
        Silla s1 = new Silla();
        s1.codigoBarras = "11100";
        s1.color = "Naranja";
        s1.material = "Metal";
        s1.numeroPatas = 1;
        //--
        Silla s2 = new Silla();
        s2.codigoBarras = "11101";
        s2.color = "Naranja";
        s2.material = "Metal";
        s2.numeroPatas = 1;
        //--
        lstMobiliario.add(s1);
        lstMobiliario.add(s2);

        //Mesas
        Mesa m1 = new Mesa();
        m1.codigoBarras = "11000";
        m1.color = "Marrón";
        m1.dimension = 2;
        m1.material = "Madera";
        m1.tieneCajones = 0;
        //--
        lstMobiliario.add(m1);

        //Libreros
        Librero l1 = new Librero();
        l1.codigoBarras = "00001";
        l1.color = "Marrón";
        l1.material = "Madera";
        l1.numeroPuertas = 2;
        //--
        lstMobiliario.add(l1);

        //Profesor
        Profesor p1 = new Profesor();
        p1.apellidos = "Ávila García";
        p1.nombres = "Susana";
        p1.id = 1;
        p1.especialidad = "Ingeniería de Software";

        //Aula
        Aula aula = new Aula(lstMobiliario, lstAlumnos, p1, 2, 202);

        //Impresión
        System.out.println("Bienvenidos a la clase de Administración de Proyectos de Software");
        System.out.println("El aula está en el piso " + aula.piso + ", número " + aula.numero);
        System.out.println("La profesor a a cargo " + aula.profesor);
        System.out.println("------");
        System.out.println("Los alumnos son ");
        for (Alumno a : aula.alumnos) {
            System.out.println(a);
        }
        System.out.println("------");
        System.out.println("El mobiliario es ");
        for (Mobiliario mobiliario : aula.muebles) {
            System.out.println(mobiliario);
        }

    }
}
