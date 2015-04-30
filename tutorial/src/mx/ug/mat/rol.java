/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.ug.mat;

/**
 *
 * @author Jan Jan
 */
public class rol {

public int ID;
public String nombre;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Rol{" + "ID=" + ID + ", NOMBRE=" + nombre + '}';
    }


}
