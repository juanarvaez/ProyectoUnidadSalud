package com.unicauca.divsalud.managedbeans;

import com.unicauca.divsalud.entidades.CategoriaAfiliado;
import com.unicauca.divsalud.entidades.Depto;
import com.unicauca.divsalud.entidades.Eps;
import com.unicauca.divsalud.entidades.Escolaridad;
import com.unicauca.divsalud.entidades.EstadoCivil;
import com.unicauca.divsalud.entidades.Estrato;
import com.unicauca.divsalud.entidades.Facultad;
import com.unicauca.divsalud.entidades.Municipio;
import com.unicauca.divsalud.entidades.Paciente;
import com.unicauca.divsalud.entidades.Parentesco;
import com.unicauca.divsalud.entidades.Programas;
import com.unicauca.divsalud.entidades.Raza;
import com.unicauca.divsalud.entidades.TipoAfiliado;
import com.unicauca.divsalud.entidades.TipoIdentificacion;
import com.unicauca.divsalud.entidades.TipoRegimen;
import com.unicauca.divsalud.managedbeans.util.JsfUtil;
import com.unicauca.divsalud.managedbeans.util.JsfUtil.PersistAction;
import com.unicauca.divsalud.sessionbeans.ActualizacionOdoFacade;
import com.unicauca.divsalud.sessionbeans.PacienteFacade;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.faces.event.ValueChangeEvent;
import org.primefaces.context.RequestContext;

@Named("pacienteController")
@SessionScoped
public class PacienteController implements Serializable {

    @EJB
    private com.unicauca.divsalud.sessionbeans.PacienteFacade ejbFacade;
    @EJB
    private ActualizacionOdoFacade ejbActualizacionOdo;
    private List<Paciente> items = null;
    private Paciente selected;
    private String busquedaPaciente;
    private TipoIdentificacion tipoIdentificacion;
    private Raza raza;
    private Facultad facultad;
    private Programas programa;
    private EstadoCivil estadoCivil;
    private Escolaridad escolaridad;
    private Estrato estrato;
    private CategoriaAfiliado categoriaAfiliado;
    private TipoAfiliado tipoAfiliado;
    private TipoRegimen tipoRegimen;
    private Eps eps;
    private Municipio municipioResidencia;
    private Depto deptoResidencia;
    private Municipio municipioNacimiento;
    private Depto deptoNacimiento;
    private Parentesco parentesco;

    public PacienteController() {

    }

    @PostConstruct
    public void init() {
        cargarPacientes();
        selected = new Paciente();
        selected.setSexo('F');
        selected.setEstado("1");
        selected.setZonaResidencia('U');
        this.tipoIdentificacion = new TipoIdentificacion();
        this.raza = new Raza();
        facultad = new Facultad();
        programa = new Programas();
        estadoCivil = new EstadoCivil();
        escolaridad = new Escolaridad();
        estrato = new Estrato();
        categoriaAfiliado = new CategoriaAfiliado();
        tipoAfiliado = new TipoAfiliado();
        tipoRegimen = new TipoRegimen();
        eps = new Eps();
        municipioResidencia = new Municipio();
        deptoResidencia = new Depto();
        municipioNacimiento = new Municipio();
        deptoNacimiento = new Depto();
        parentesco= new Parentesco();
    }

    public Paciente getSelected() {
        return selected;
    }

    public void setSelected(Paciente selected) {
        this.selected = selected;
    }

    public TipoIdentificacion getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(TipoIdentificacion tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public Raza getRaza() {
        return raza;
    }

    public void setRaza(Raza raza) {
        this.raza = raza;
    }

    public Facultad getFacultad() {
        return facultad;
    }

    public void setFacultad(Facultad facultad) {
        this.facultad = facultad;
    }

    public Programas getPrograma() {
        return programa;
    }

    public void setPrograma(Programas programa) {
        this.programa = programa;
    }

    public EstadoCivil getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public Escolaridad getEscolaridad() {
        return escolaridad;
    }

    public void setEscolaridad(Escolaridad escolaridad) {
        this.escolaridad = escolaridad;
    }

    public Estrato getEstrato() {
        return estrato;
    }

    public void setEstrato(Estrato estrato) {
        this.estrato = estrato;
    }

    public CategoriaAfiliado getCategoriaAfiliado() {
        return categoriaAfiliado;
    }

    public void setCategoriaAfiliado(CategoriaAfiliado categoriaAfiliado) {
        this.categoriaAfiliado = categoriaAfiliado;
    }

    public TipoAfiliado getTipoAfiliado() {
        return tipoAfiliado;
    }

    public void setTipoAfiliado(TipoAfiliado tipoAfiliado) {
        this.tipoAfiliado = tipoAfiliado;
    }

    public TipoRegimen getTipoRegimen() {
        return tipoRegimen;
    }

    public void setTipoRegimen(TipoRegimen tipoRegimen) {
        this.tipoRegimen = tipoRegimen;
    }

    public Eps getEps() {
        return eps;
    }

    public void setEps(Eps eps) {
        this.eps = eps;
    }

    public Municipio getMunicipioResidencia() {
        return municipioResidencia;
    }

    public void setMunicipioResidencia(Municipio municipioResidencia) {
        this.municipioResidencia = municipioResidencia;
    }

    public Depto getDeptoResidencia() {
        return deptoResidencia;
    }

    public void setDeptoResidencia(Depto deptoResidencia) {
        this.deptoResidencia = deptoResidencia;
    }

    public Municipio getMunicipioNacimiento() {
        return municipioNacimiento;
    }

    public void setMunicipioNacimiento(Municipio municipioNacimiento) {
        this.municipioNacimiento = municipioNacimiento;
    }

    public Depto getDeptoNacimiento() {
        return deptoNacimiento;
    }

    public void setDeptoNacimiento(Depto deptoNacimiento) {
        this.deptoNacimiento = deptoNacimiento;
    }

    public Parentesco getParentesco() {
        return parentesco;
    }

    public void setParentesco(Parentesco parentesco) {
        this.parentesco = parentesco;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private PacienteFacade getFacade() {
        return ejbFacade;
    }

    public String getBusquedaPaciente() {
        return busquedaPaciente;
    }

    public void setBusquedaPaciente(String busquedaPaciente) {
        this.busquedaPaciente = busquedaPaciente;
    }

    public Paciente prepareCreate() {
        selected = new Paciente();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("PacienteCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("PacienteUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("PacienteDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<Paciente> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }

    public void buscarPaciente() {
        this.items = getFacade().buscarPacienteEjb(this.busquedaPaciente.toLowerCase());

    }

    public List<Paciente> getListaPacientesActivos() {
        return items;
    }

    public List<Paciente> getListaPacientesActivosAtencion() {
        List<Paciente> lista = new ArrayList<>();

        for (int i = 0; i < items.size(); i++) {
            boolean existeHistoria= ejbActualizacionOdo.buscarPorPacienteBool(items.get(i).getId());
            if (items.get(i).getEstado().equalsIgnoreCase("1")&& existeHistoria!=true) {
                lista.add(items.get(i));
            }
            
        }
        return lista;
    }

    public void cargarPacientes() {
        items = ejbFacade.findAll();
    }

    //registro de un nuevo paciente 
    public void registrarPaciente() {
        RequestContext requestContext = RequestContext.getCurrentInstance();
        selected.setTipoIdentificacion(tipoIdentificacion);
        selected.setRaza(raza);
        selected.setFacultad(facultad);
        selected.setPrograma(programa);
        selected.setEstadoCivil(estadoCivil);
        selected.setEscolaridad(escolaridad);
        selected.setEstrato(estrato);
        selected.setCategoriaAfiliado(categoriaAfiliado);
        selected.setTipoAfiliado(tipoAfiliado);
        selected.setTipoRegimen(tipoRegimen);
        selected.setEps(eps);
        selected.setMunicipioResidencia(municipioResidencia);
        selected.setDeptoResidencia(deptoResidencia);
        selected.setMunicipioNacimiento(municipioNacimiento);
        selected.setDeptoNacimiento(deptoNacimiento);
        selected.setParentesco(parentesco);
        asignarFechaApertura();
        ejbFacade.create(selected);
        requestContext.execute("PF('RegistroExitoso').show()");
        
        selected= new Paciente();
        tipoIdentificacion = new TipoIdentificacion();
        selected.setSexo('F');
        selected.setEstado("1");
        this.raza = new Raza();
        facultad = new Facultad();
        programa = new Programas();
        estadoCivil = new EstadoCivil();
        escolaridad = new Escolaridad();
        estrato = new Estrato();
        categoriaAfiliado = new CategoriaAfiliado();
        tipoAfiliado = new TipoAfiliado();
        tipoRegimen = new TipoRegimen();
        eps = new Eps();
        municipioResidencia = new Municipio();
        deptoResidencia = new Depto();
        municipioNacimiento = new Municipio();
        deptoNacimiento = new Depto();
        parentesco= new Parentesco();

    }

    //Nuevos cambios 
    

    public void seleccionarPacienteEdicion(Paciente paciente) {
        this.selected = paciente;
        this.tipoIdentificacion = paciente.getTipoIdentificacion();
        this.raza = paciente.getRaza();
        facultad = paciente.getFacultad();
        programa = paciente.getPrograma();
        estadoCivil = paciente.getEstadoCivil();
        escolaridad = paciente.getEscolaridad();
        estrato = paciente.getEstrato();
        categoriaAfiliado = paciente.getCategoriaAfiliado();
        tipoAfiliado = paciente.getTipoAfiliado();
        tipoRegimen = paciente.getTipoRegimen();
        eps = paciente.getEps();
        municipioResidencia = paciente.getMunicipioResidencia();
        deptoResidencia = paciente.getDeptoResidencia();
        municipioNacimiento = paciente.getMunicipioNacimiento();
        deptoNacimiento = paciente.getDeptoNacimiento();

    }
public void editarPaciente() {
        selected.setTipoIdentificacion(tipoIdentificacion);
        selected.setFacultad(facultad);
        selected.setPrograma(programa);
        selected.setEstadoCivil(estadoCivil);
        selected.setEscolaridad(escolaridad);
        selected.setEstrato(estrato);
        selected.setCategoriaAfiliado(categoriaAfiliado);
        selected.setTipoAfiliado(tipoAfiliado);
        selected.setTipoRegimen(tipoRegimen);
        selected.setEps(eps);
        selected.setMunicipioResidencia(municipioResidencia);
        selected.setDeptoResidencia(deptoResidencia);
        selected.setMunicipioNacimiento(municipioNacimiento);
        selected.setDeptoNacimiento(deptoNacimiento);
        selected.setParentesco(parentesco);
        ejbFacade.edit(selected);
        RequestContext requestContext = RequestContext.getCurrentInstance();
        requestContext.execute("PF('ActualizacionExitosa').show()");

    }

    public void limpiarCampos() {
        selected = new Paciente();
        selected.setSexo('F');
        selected.setEstado("1");
        this.tipoIdentificacion = new TipoIdentificacion();
        this.raza = new Raza();
        facultad = new Facultad();
        programa = new Programas();
        estadoCivil = new EstadoCivil();
        escolaridad = new Escolaridad();
        estrato = new Estrato();
        categoriaAfiliado = new CategoriaAfiliado();
        tipoAfiliado = new TipoAfiliado();
        tipoRegimen = new TipoRegimen();
        eps = new Eps();
        municipioResidencia = new Municipio();
        deptoResidencia = new Depto();
        municipioNacimiento = new Municipio();
        deptoNacimiento = new Depto();
        parentesco = new Parentesco();
    }
    public void seleccionar_CargarPaciente(Paciente selected) {
        this.selected = selected;
        this.raza = selected.getRaza();
        this.tipoIdentificacion = selected.getTipoIdentificacion();
        this.facultad = selected.getFacultad();
        this.programa = selected.getPrograma();
        this.estadoCivil = selected.getEstadoCivil();
        this.escolaridad = selected.getEscolaridad();
        this.estrato = selected.getEstrato();
        this.categoriaAfiliado = selected.getCategoriaAfiliado();
        this.tipoAfiliado = selected.getTipoAfiliado();
        this.tipoRegimen = selected.getTipoRegimen();
        this.eps = selected.getEps();
        this.municipioResidencia = selected.getMunicipioResidencia();
        this.deptoResidencia = selected.getDeptoResidencia();
        this.municipioNacimiento = selected.getMunicipioNacimiento();
        this.deptoNacimiento = selected.getDeptoNacimiento();
        this.parentesco = selected.getParentesco();

    }

    public void limpiarcamposformulario() {
        this.limpiarCampos();
        RequestContext requestContext = RequestContext.getCurrentInstance();
        requestContext.update("PacienteEditForm");
        requestContext.execute("PF('ActualizacionExitosa').hide()");
    }
    private void asignarFechaApertura() {
        GregorianCalendar c = new GregorianCalendar();
        selected.setFechaApertura(c.getTime());
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction != PersistAction.DELETE) {
                    getFacade().edit(selected);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            }
        }
    }

    public Paciente getPaciente(java.lang.Integer id) {
        return getFacade().find(id);
    }

    public List<Paciente> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<Paciente> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = Paciente.class)
    public static class PacienteControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            PacienteController controller = (PacienteController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "pacienteController");
            return controller.getPaciente(getKey(value));
        }

        java.lang.Integer getKey(String value) {
            java.lang.Integer key;
            key = Integer.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Integer value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof Paciente) {
                Paciente o = (Paciente) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), Paciente.class.getName()});
                return null;
            }
        }

    }

}
