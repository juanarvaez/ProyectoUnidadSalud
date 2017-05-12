package com.unicauca.divsalud.managedbeans;

import com.unicauca.divsalud.entidades.AcompanianteMed;
import com.unicauca.divsalud.entidades.CitaMedicaMed;
import com.unicauca.divsalud.entidades.ConsultaMedicaMed;
import com.unicauca.divsalud.entidades.Paciente;
import com.unicauca.divsalud.managedbeans.util.JsfUtil;
import com.unicauca.divsalud.managedbeans.util.JsfUtil.PersistAction;
import com.unicauca.divsalud.sessionbeans.AcompanianteMedFacade;
import com.unicauca.divsalud.sessionbeans.ConsultaMedicaMedFacade;

import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@Named("consultaMedicaMedController")
@SessionScoped
public class ConsultaMedicaMedController implements Serializable {

    @EJB
    private com.unicauca.divsalud.sessionbeans.ConsultaMedicaMedFacade ejbFacade;
    @EJB
    private com.unicauca.divsalud.sessionbeans.AcompanianteMedFacade ejbFacadeAcompaniante;
    
    private List<ConsultaMedicaMed> items = null;
    private ConsultaMedicaMed selected;
    private Paciente paciente;
    private CitaMedicaMed citaMedica;
    private AcompanianteMed acompaniante;

    public ConsultaMedicaMedController() {
    }

    public ConsultaMedicaMed getSelected() {
        return selected;
    }

    public void setSelected(ConsultaMedicaMed selected) {
        this.selected = selected;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }

    public CitaMedicaMed getCitaMedica() {
        return citaMedica;
    }

    public void setCitaMedica(CitaMedicaMed citaMedica) {
        this.citaMedica = citaMedica;
    }

    public AcompanianteMed getAcompaniante() {
        return acompaniante;
    }

    public void setAcompaniante(AcompanianteMed acompaniante) {
        this.acompaniante = acompaniante;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private ConsultaMedicaMedFacade getFacade() {
        return ejbFacade;
    }

    public AcompanianteMedFacade getEjbFacadeAcompaniante() {
        return ejbFacadeAcompaniante;
    }

    public void setEjbFacadeAcompaniante(AcompanianteMedFacade ejbFacadeAcompaniante) {
        this.ejbFacadeAcompaniante = ejbFacadeAcompaniante;
    }

    public ConsultaMedicaMed prepareCreate() {
        selected = new ConsultaMedicaMed();
        initializeEmbeddableKey();
        return selected;
    }
    
    

    public void create(CargarVistaController cargarVista) {
        ejbFacadeAcompaniante.create(acompaniante);        
        selected.setAcompanianteMedIdx(acompaniante);
        selected.setPacienteIdx(paciente);
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("ConsultaMedicaMedCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
        cargarVista.cargarGestionarAgenda();

        
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("ConsultaMedicaMedUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("ConsultaMedicaMedDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<ConsultaMedicaMed> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
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
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("PersistenceErrorOccured"));
            }
        }
    }

    public ConsultaMedicaMed getConsultaMedicaMed(java.lang.Integer id) {
        return getFacade().find(id);
    }

    public List<ConsultaMedicaMed> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<ConsultaMedicaMed> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = ConsultaMedicaMed.class)
    public static class ConsultaMedicaMedControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            ConsultaMedicaMedController controller = (ConsultaMedicaMedController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "consultaMedicaMedController");
            return controller.getConsultaMedicaMed(getKey(value));
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
            if (object instanceof ConsultaMedicaMed) {
                ConsultaMedicaMed o = (ConsultaMedicaMed) object;
                return getStringKey(o.getIdx());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), ConsultaMedicaMed.class.getName()});
                return null;
            }
        }

    }

    
    
    /*NUEVOS METODOS*/  
    
//    AcompanianteMedController acompanianteMedCon = new AcompanianteMedController();  
//    AntFamiliarConsultaMedController antFamiliarCon = new AntFamiliarConsultaMedController();
//    ConsultaSistemasCuerpoMedController consultaSisCuerpoMedCon = new ConsultaSistemasCuerpoMedController();
//    DiagnosticosController diagnosticoCon = new DiagnosticosController();
    
    /*NUEVAS VARIABLES*/
    
    //prepara los objetos para que se cargue la vista
//    public void prepareCreateconsultaMedicaMed(CargarVistaController cargarVista){
//        
//        selected = new ConsultaMedicaMed();
//        initializeEmbeddableKey();
//        
//        acompanianteMedCon.prepareCreate();
//        antFamiliarCon.prepareCreate();
//        consultaSisCuerpoMedCon.prepareCreate();
//        diagnosticoCon.prepareCreate();                
//        
//        cargarVista.cargarHistoriaMedicaMed();        
//    }
    
    public void prepareCreateconsultaMedicaMedPaciente(CitaMedicaMed cita, CargarVistaController cargarVista){
        selected = new ConsultaMedicaMed();
        acompaniante = new AcompanianteMed();
        initializeEmbeddableKey();        
        paciente = new Paciente();
        paciente = cita.getPacienteID();
        cargarVista.cargarHistoriaMedicaMed();        
    }    
    
        public void prepareCreateconsultaMedicaMed(CargarVistaController cargarVista){
        selected = new ConsultaMedicaMed();
        acompaniante = new AcompanianteMed();
        initializeEmbeddableKey();        
//        paciente = new Paciente();
//        paciente = cita.getPacienteID();
        cargarVista.cargarHistoriaMedicaMed();        
    } 
    
//    public void guardarConsulta(){
//        persist(PersistAction.CREATE, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("ConsultaMedicaMedCreated"));
//        if (!JsfUtil.isValidationFailed()) {
//            items = null;    // Invalidate list of items to trigger re-query.
//        }
//        
//    }
    
}
