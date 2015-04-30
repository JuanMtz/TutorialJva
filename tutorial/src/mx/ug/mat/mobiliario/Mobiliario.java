/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.ug.mat.mobiliario;

/**
 *
 * @author Rolando
 */
public class Mobiliario {

    public String color;
    public String material;
    public String codigoBarras;

    @Override
    public String toString() {
        return this.getClass().getName() + "-" + "Mobiliario{" + "color=" + color + ", material=" + material + ", codigoBarras=" + codigoBarras + '}';
    }

}
