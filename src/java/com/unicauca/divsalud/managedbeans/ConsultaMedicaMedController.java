package com.unicauca.divsalud.managedbeans;

import com.unicauca.divsalud.entidades.AcompanianteMed;
import com.unicauca.divsalud.entidades.AntFamiliarConsultaMed;
import com.unicauca.divsalud.entidades.AntFamiliaresMed;
import com.unicauca.divsalud.entidades.CitaMedicaMed;
import com.unicauca.divsalud.entidades.ConsultaMedicaMed;
import com.unicauca.divsalud.entidades.Paciente;
import com.unicauca.divsalud.managedbeans.util.JsfUtil;
import com.unicauca.divsalud.managedbeans.util.JsfUtil.PersistAction;
import com.unicauca.divsalud.sessionbeans.AcompanianteMedFacade;
import com.unicauca.divsalud.sessionbeans.ConsultaMedicaMedFacade;

import java.io.Serializable;
import java.util.ArrayList;
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
    @EJB    
    private com.unicauca.divsalud.sessionbeans.AntFamiliarConsultaMedFacade ejbFacadeAntFamiliarConsultaMed;
    
    /*adiciones para antFamiliares*/
    private List<AntFamiliaresMed> itemsAntFamiliares;
    private AntFamiliaresMedController antFamiliaresCon = new AntFamiliaresMedController();
    private AntFamiliaresMed antFamiliares;
    private AntFamiliarConsultaMed antFamiliarConsulta;
    private AntFamiliarConsultaMedController antFamiliarMedCon = new AntFamiliarConsultaMedController();
    
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

    public AntFamiliaresMedController getAntFamiliaresCon() {
        return antFamiliaresCon;
    }

    public void setAntFamiliaresCon(AntFamiliaresMedController antFamiliaresCon) {
        this.antFamiliaresCon = antFamiliaresCon;
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
    
    

    public void create(CargarVistaController cargarVista, List<AntFamiliaresMed> item) {
        ejbFacadeAcompaniante.create(acompaniante);        
        selected.setAcompanianteMedIdx(acompaniante);
        selected.setPacienteIdx(paciente);
        ejbFacade.create(selected);
        /*
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/BundleConsultaMedicaMed").getString("ConsultaMedicaMedCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }*/
        this.guardarAntecedentes(selected,item);  
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
            
    
    public void prepareCreateconsultaMedicaMedPaciente(CitaMedicaMed cita, CargarVistaController cargarVista){
        selected = new ConsultaMedicaMed();
        acompaniante = new AcompanianteMed();
        antFamiliarConsulta = new AntFamiliarConsultaMed();
        
        initializeEmbeddableKey();        
        paciente = new Paciente();
        paciente = cita.getPacienteID();
        
        antFamiliares = new AntFamiliaresMed();
        antFamiliaresCon.prepareCreate();
        
        cargarVista.cargarHistoriaMedicaMed();        
    }    
    
    public void prepareCreateconsultaMedicaMed(CargarVistaController cargarVista){
        selected = new ConsultaMedicaMed();
        acompaniante = new AcompanianteMed();
        antFamiliarConsulta = new AntFamiliarConsultaMed();
        
        initializeEmbeddableKey();       
        
        antFamiliares = new AntFamiliaresMed();
        antFamiliaresCon.prepareCreate();
//        paciente = new Paciente();
//        paciente = cita.getPacienteID();
        cargarVista.cargarHistoriaMedicaMed();        
    }                    
    
    //funciones para guardar antFamiliares
    public List<AntFamiliaresMed> getItemsAntFamiliares() {
        return itemsAntFamiliares;
    }

    public void setItemsAntFamiliares(List<AntFamiliaresMed> itemsAntFamiliares) {
        this.itemsAntFamiliares = itemsAntFamiliares;
    }

    public AntFamiliaresMed getAntFamiliares() {
        return antFamiliares;
    }

    public void setAntFamiliares(AntFamiliaresMed antFamiliares) {
        this.antFamiliares = antFamiliares;
    }

    public AntFamiliarConsultaMed getAntFamiliarConsulta() {
        return antFamiliarConsulta;
    }

    public void setAntFamiliarConsulta(AntFamiliarConsultaMed antFamiliarConsulta) {
        this.antFamiliarConsulta = antFamiliarConsulta;
    }
    
    
    
    /* METODOS PARA AJAX*/
    List<AntFamiliaresMed> padre = new ArrayList<>(); 
    List<AntFamiliaresMed> abueloP = new ArrayList<>(); 
    List<AntFamiliaresMed> abuelaP = new ArrayList<>(); 
    List<AntFamiliaresMed> madre = new ArrayList<>(); 
    List<AntFamiliaresMed> abueloM = new ArrayList<>(); 
    List<AntFamiliaresMed> abuelaM = new ArrayList<>(); 
    List<AntFamiliaresMed> hermanos = new ArrayList<>();
    List<AntFamiliaresMed> observaciones = new ArrayList();
    
    public void guardarPadre(AntFamiliaresMed item){
        System.out.println(item.toString());
        if(!padre.contains(item))
            padre.add(item);
        else
            padre.remove(item);        
    }
    
    public void guardarAbueloP(AntFamiliaresMed item){
        System.out.println(item.getIdx() + " " + item.getNombre());                
        if(!abueloP.contains(item))
            abueloP.add(item);
        else
            abueloP.remove(item);
    }
    
    public void guardarAbuelaP(AntFamiliaresMed item){
        System.out.println(item.toString());                
        if(!abuelaP.contains(item))
            abuelaP.add(item);
        else
            abuelaP.remove(item);
    }
    
    public void guardarMadre(AntFamiliaresMed item){
        System.out.println(item.toString());                
        if(!madre.contains(item))
            madre.add(item);
        else
            madre.remove(item);
    }
    
    public void guardarAbueloM(AntFamiliaresMed item){
        System.out.println(item.toString());                
        if(!abueloM.contains(item))
            abueloM.add(item);
        else
            abueloM.remove(item);
    }
    
    public void guardarAbuelaM(AntFamiliaresMed item){
        System.out.println(item.toString());                
        if(!abuelaM.contains(item))
            abuelaM.add(item);
        else
            abuelaM.remove(item);
    }
    
    public void guardarHermanos(AntFamiliaresMed item){
        System.out.println(item.toString());                
        if(!hermanos.contains(item))
            hermanos.add(item);
        else
            hermanos.remove(item);
    }       
    
    public void guardarObservaciones(AntFamiliaresMed item){
        System.out.println("observacion con item: " + item.toString());
        System.out.println("valor de obs: " + antFamiliarConsulta.getObservaciones());
    }
    
    private void guardarAntecedentes(ConsultaMedicaMed select, List<AntFamiliaresMed> item) {
        for (AntFamiliaresMed it : item) {
            if(padre.contains(it))
                antFamiliarConsulta.setPadre(1);
            else
                antFamiliarConsulta.setPadre(0);
            
            if(abueloP.contains(it))
                antFamiliarConsulta.setAbueloP(1);
            else
                antFamiliarConsulta.setAbueloP(0);
            
            if(abuelaP.contains(it))
                antFamiliarConsulta.setAbuelaP(1);
            else
                antFamiliarConsulta.setAbuelaP(0);
            
            if(abuelaP.contains(it))
                antFamiliarConsulta.setMadre(1);
            else
                antFamiliarConsulta.setMadre(0);
            
            if(abuelaP.contains(it))
                antFamiliarConsulta.setAbueloM(1);
            else
                antFamiliarConsulta.setAbueloM(0);
            
            if(abuelaP.contains(it))
                antFamiliarConsulta.setAbuelaM(1);
            else
                antFamiliarConsulta.setAbuelaM(0);
            
            if(hermanos.contains(it))
                antFamiliarConsulta.setHermanos(1);
            else
                antFamiliarConsulta.setHermanos(0);
            
            antFamiliarConsulta.setObservaciones("observacion en proceso de programar");
           
            antFamiliarConsulta.setAntFamiliaresMedIdx(it);
            antFamiliarConsulta.setConsultaMedicaMedIdx(select);
            
            ejbFacadeAntFamiliarConsultaMed.create(antFamiliarConsulta);
            antFamiliarConsulta = new AntFamiliarConsultaMed();
        }                
    }

        public String getEstadoPaciente(){
            if(paciente.getEstado().equals("1")){
                return "Activo";
            }else{
                return "Inactivo";
            }
        }    
    
}
