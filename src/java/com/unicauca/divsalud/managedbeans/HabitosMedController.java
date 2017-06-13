package com.unicauca.divsalud.managedbeans;

import com.unicauca.divsalud.entidades.HabitosMed;
import com.unicauca.divsalud.managedbeans.util.JsfUtil;
import com.unicauca.divsalud.managedbeans.util.JsfUtil.PersistAction;
import com.unicauca.divsalud.sessionbeans.HabitosMedFacade;

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

@Named("habitosMedController")
@SessionScoped
public class HabitosMedController implements Serializable {

    @EJB
    private com.unicauca.divsalud.sessionbeans.HabitosMedFacade ejbFacade;
    private List<HabitosMed> items = null;
    private HabitosMed selected;

    public HabitosMedController() {
    }

    public HabitosMed getSelected() {
        return selected;
    }

    public void setSelected(HabitosMed selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
        selected.getHabitosMedPK().setIdxConsulta(selected.getConsultaMedicaMed().getIdx());
        selected.getHabitosMedPK().setIdTipoHabito(selected.getTipoHabito().getId());
    }

    protected void initializeEmbeddableKey() {
        selected.setHabitosMedPK(new com.unicauca.divsalud.entidades.HabitosMedPK());
    }

    private HabitosMedFacade getFacade() {
        return ejbFacade;
    }

    public HabitosMed prepareCreate() {
        selected = new HabitosMed();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/BundleHabitosMed").getString("HabitosMedCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/BundleHabitosMed").getString("HabitosMedUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/BundleHabitosMed").getString("HabitosMedDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<HabitosMed> getItems() {
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
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/BundleHabitosMed").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/BundleHabitosMed").getString("PersistenceErrorOccured"));
            }
        }
    }

    public HabitosMed getHabitosMed(com.unicauca.divsalud.entidades.HabitosMedPK id) {
        return getFacade().find(id);
    }

    public List<HabitosMed> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<HabitosMed> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = HabitosMed.class)
    public static class HabitosMedControllerConverter implements Converter {

        private static final String SEPARATOR = "#";
        private static final String SEPARATOR_ESCAPED = "\\#";

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            HabitosMedController controller = (HabitosMedController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "habitosMedController");
            return controller.getHabitosMed(getKey(value));
        }

        com.unicauca.divsalud.entidades.HabitosMedPK getKey(String value) {
            com.unicauca.divsalud.entidades.HabitosMedPK key;
            String values[] = value.split(SEPARATOR_ESCAPED);
            key = new com.unicauca.divsalud.entidades.HabitosMedPK();
            key.setIdTipoHabito(Integer.parseInt(values[0]));
            key.setIdxConsulta(Integer.parseInt(values[1]));
            return key;
        }

        String getStringKey(com.unicauca.divsalud.entidades.HabitosMedPK value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value.getIdTipoHabito());
            sb.append(SEPARATOR);
            sb.append(value.getIdxConsulta());
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof HabitosMed) {
                HabitosMed o = (HabitosMed) object;
                return getStringKey(o.getHabitosMedPK());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), HabitosMed.class.getName()});
                return null;
            }
        }

    }

}
