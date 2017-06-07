package com.unicauca.divsalud.managedbeans;

import com.unicauca.divsalud.entidades.UsuariosSistema;
import com.unicauca.divsalud.sessionbeans.GrupoUsuarioTipoFacade;
import com.unicauca.divsalud.sessionbeans.UsuariosSistemaFacade;
import com.unicauca.divsalud.utilidades.Utilidades;
import java.io.IOException;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.primefaces.context.RequestContext;
import org.primefaces.model.StreamedContent;

@ManagedBean
@SessionScoped
public class UsuarioSessionController implements Serializable {

    @EJB
    private GrupoUsuarioTipoFacade ejbUsuarioTipo;
    private UsuariosSistemaFacade ejbUsuarios;

    private String nombreDeUsuario;
    private String contrasenia;
    private String nombreMostrar;
    private String identificacion;
    private boolean haySesion;
    private boolean errorSesion;
    private UsuariosSistema actual;
    private static UsuariosSistema actualSingleton;

    public UsuarioSessionController() {
    }

    public UsuariosSistema getActual() {
        return actual;
    }
    public static UsuariosSistema getActualSingleton() {
        return actualSingleton;
    }

    public void setActual(UsuariosSistema actual) {
        if (actualSingleton==null) {
            actualSingleton = new UsuariosSistema();
        }
        this.actual = actual;
        UsuarioSessionController.actualSingleton = this.actual;
    }
    

    public String getNombreDeUsuario() {
        return nombreDeUsuario;
    }

    public void setNombreDeUsuario(String nombreDeUsuario) {
        this.nombreDeUsuario = nombreDeUsuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getNombreMostrar() {
        return nombreMostrar;
    }

    public void setNombreMostrar(String nombreMostrar) {
        this.nombreMostrar = nombreMostrar;
    }

    public boolean isHaySesion() {
        return haySesion;
    }

    public void setHaySesion(boolean haySesion) {
        this.haySesion = haySesion;
    }

    public boolean isErrorSesion() {
        return errorSesion;
    }

    public void setErrorSesion(boolean errorSesion) {
        this.errorSesion = errorSesion;
    }

    public String getIdentificacion() {
        return identificacion;
    }

    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    public void login() throws IOException, ServletException {
        FacesContext fc = FacesContext.getCurrentInstance();
        /*try {
            actual = ejbUsuarios.buscarPorNombreUsuarioYcontrasena(this.nombreDeUsuario, this.contrasenia);
            if (actual != null) {
                if (this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 9 || this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 12) {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/usuario/principal.xhtml");
                    identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getUsuariosSistema().getIdentificacion();
                    this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getUsuariosSistema().getNombres();
                } else if (this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 8){
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/secretaria/principal.xhtml");
                    identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getUsuariosSistema().getIdentificacion();
                    this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(actual.getLogin()).get(0).getUsuariosSistema().getNombres();
                }
            }
        } catch (Exception e) {
            System.out.println("No pasa nada"+nombreDeUsuario+" ,"+contrasenia);
        }*/
            
        RequestContext requestContext = RequestContext.getCurrentInstance();
        HttpServletRequest req = (HttpServletRequest) fc.getExternalContext().getRequest();

        if (req.getUserPrincipal() == null) {
            try {
                req.login(this.nombreDeUsuario, this.contrasenia);
                actual = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema();
                actualSingleton = actual;
                req.getServletContext().log("Autenticacion exitosa");
                this.haySesion = true; 
                this.errorSesion = false;

                if (this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 9 || 
                    this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 12|| 
                    this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 1) {
                    
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/usuario/principal.xhtml");
                    identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getIdentificacion();
                    this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getNombres();
                } else if (this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 8){
                    FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/secretaria/principal.xhtml");
                    identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getIdentificacion();
                    this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getNombres();
                }
            } catch (ServletException e) {

                this.errorSesion = true;

            }
        }else{
            if (this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 9 || 
                    this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 12|| 
                    this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 1) {
                FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/usuario/principal.xhtml");
                identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getIdentificacion();
                this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getNombres();
            } else if (this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getGrupoUsuarioTipoPK().getIdTipo() == 8){
                FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/secretaria/principal.xhtml");
                identificacion = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getIdentificacion();
                this.nombreMostrar = this.ejbUsuarioTipo.buscarPorNombreUsuario(req.getUserPrincipal().getName()).get(0).getUsuariosSistema().getNombres();
            }
        }

//        FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/faces/usuario/principal.xhtml");
    }

    public StreamedContent getImagenFlujo() {
        return Utilidades.getImagenPorDefecto("foto");
    }
    

    public void logout() throws IOException, ServletException {
        FacesContext fc = FacesContext.getCurrentInstance();
        HttpServletRequest req = (HttpServletRequest) fc.getExternalContext().getRequest();
        try {
            req.logout();
            req.getSession().invalidate();
            fc.getExternalContext().invalidateSession();
            FacesContext.getCurrentInstance().getExternalContext().redirect("/divisionsalud/");

        } catch (ServletException e) {
            fc.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "FAILED", "Logout failed on backend"));
        }

    }

  
}
