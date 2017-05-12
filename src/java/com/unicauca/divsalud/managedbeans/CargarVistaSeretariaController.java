/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.managedbeans;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import org.primefaces.context.RequestContext;


@Named(value = "cargarVistaSecretariaController")
@SessionScoped
public class CargarVistaSeretariaController implements Serializable {
   
   private String ruta;
   public String getRuta() {
      return ruta;
   }
   
   public CargarVistaSeretariaController() {
      this.ruta = "/usuariodelsistema/secretaria/inicio/opciones.xhtml";
   }
   public void cargarInicio(){
       this.ruta = "/usuariodelsistema/secretaria/inicio/opciones.xhtml";
   }
   public void cargarPerfilUsuario() {
        this.ruta = "/usuariodelsistema/perfilUsuario.xhtml";
    }
   /*Ruta para la gestión de usuarios*/
   public void cargarGestionarUsuarios(){
        this.ruta = "/usuariodelsistema/secretaria/usuariosSistema/List.xhtml";
   }
   /*Rutas para la gestión de pacientes*/
   public void cargarListaPacientes() {
        this.ruta = "/usuariodelsistema/profesionalsalud/enComun/paciente/List.xhtml";
    }
   public void cargarRegistrarPaciente() {
        this.ruta = "/usuariodelsistema/profesionalsalud/enComun/paciente/Create.xhtml";
    }
    public void cargarEditarPaciente() {
        this.ruta = "/usuariodelsistema/profesionalsalud/enComun/paciente/Edit.xhtml";
    }
    public void cargarVerPaciente() {
        this.ruta = "/usuariodelsistema/profesionalsalud/enComun/paciente/View.xhtml";
    }
    /*Rutas para gestionar recursos*/
    public void cargarRecursos(){
       this.ruta = "/usuariodelsistema/secretaria/inicio/recursos_inicio.xhtml";
    }
    public void cargarEps(){
       this.ruta = "/usuariodelsistema/secretaria/eps/List.xhtml";
    }
    /*Rutas para la gestión de citas*/
   public void cargarGestionarCitas() {
        this.ruta = "/usuariodelsistema/profesionalsalud/enComun/citaMedicaMed/List.xhtml";
    }
}
