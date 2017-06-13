/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ROED26
 */
@Entity
@Table(name = "diagnostico_odo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DiagnosticoOdo.findAll", query = "SELECT d FROM DiagnosticoOdo d"),
    @NamedQuery(name = "DiagnosticoOdo.findById", query = "SELECT d FROM DiagnosticoOdo d WHERE d.id = :id"),
    @NamedQuery(name = "DiagnosticoOdo.findByDx", query = "SELECT d FROM DiagnosticoOdo d WHERE d.dx = :dx")
})    
public class DiagnosticoOdo implements Serializable {

    @Size(max = 8)
    @Column(name = "DX1")
    private String dx1;
    @Size(max = 8)
    @Column(name = "DX2")
    private String dx2;
    @Size(max = 8)
    @Column(name = "DX3")
    private String dx3;
    @Lob
    @Size(max = 65535)
    @Column(name = "NDX1")
    private String ndx1;
    @Lob
    @Size(max = 65535)
    @Column(name = "NDX2")
    private String ndx2;
    @Lob
    @Size(max = 65535)
    @Column(name = "NDX3")
    private String ndx3;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 8)
    @Column(name = "DX")
    private String dx;
    @Lob
    @Size(max = 65535)
    @Column(name = "NDX")
    private String ndx;

    @JoinColumn(name = "ID_ACTUALIZACION", referencedColumnName = "ID")
    @ManyToOne
    private ActualizacionOdo idActualizacion;
    @JoinColumn(name = "TIPODIAGNOSTICO", referencedColumnName = "ID")
    @ManyToOne
    private Tipodiagnostico tipodiagnostico;

    public DiagnosticoOdo() {
    }

    public DiagnosticoOdo(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDx() {
        return dx;
    }

    public void setDx(String dx) {
        this.dx = dx;
    }

    

    public String getNdx() {
        return ndx;
    }

    public void setNdx(String ndx) {
        this.ndx = ndx;
    }

    

    public ActualizacionOdo getIdActualizacion() {
        return idActualizacion;
    }

    public void setIdActualizacion(ActualizacionOdo idActualizacion) {
        this.idActualizacion = idActualizacion;
    }

    public Tipodiagnostico getTipodiagnostico() {
        return tipodiagnostico;
    }

    public void setTipodiagnostico(Tipodiagnostico tipodiagnostico) {
        this.tipodiagnostico = tipodiagnostico;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DiagnosticoOdo)) {
            return false;
        }
        DiagnosticoOdo other = (DiagnosticoOdo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.unicauca.divsalud.entidades.DiagnosticoOdo[ id=" + id + " ]";
    }

    public String getDx1() {
        return dx1;
    }

    public void setDx1(String dx1) {
        this.dx1 = dx1;
    }

    public String getDx2() {
        return dx2;
    }

    public void setDx2(String dx2) {
        this.dx2 = dx2;
    }

    public String getDx3() {
        return dx3;
    }

    public void setDx3(String dx3) {
        this.dx3 = dx3;
    }

    public String getNdx1() {
        return ndx1;
    }

    public void setNdx1(String ndx1) {
        this.ndx1 = ndx1;
    }

    public String getNdx2() {
        return ndx2;
    }

    public void setNdx2(String ndx2) {
        this.ndx2 = ndx2;
    }

    public String getNdx3() {
        return ndx3;
    }

    public void setNdx3(String ndx3) {
        this.ndx3 = ndx3;
    }
    
}
