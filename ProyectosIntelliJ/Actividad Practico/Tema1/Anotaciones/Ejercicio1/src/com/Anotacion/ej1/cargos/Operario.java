package com.Anotacion.ej1.cargos;

import com.Anotacion.ej1.Empleado;

public class Operario extends Empleado {
    private int codigoTaller;

    public Operario(String nombre, String apellidos, String dni, String direccion, String telefono, int codigoTaller) {
        super(nombre, apellidos, dni, direccion, telefono);
        this.codigoTaller = codigoTaller;
    }

    @Override
    public String toString() {
        return super.toString() + " | Código Taller: " + codigoTaller;
}
}