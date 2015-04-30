/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.mat;

/**
 *
 * @author Jan Jan
 */
public class Maestro {

    public String nombre;
    public String Apellido;
    public String especialidad;

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

      @Override
    public String toString() {
        return "Maestro{" + "Nombre=" + nombre + ", Apellido=" + Apellido + ", Especialidad=" + especialidad + '}';
    }

}
