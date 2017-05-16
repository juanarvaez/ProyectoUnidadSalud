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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Albert Muñoz
 */
@Entity
@Table(name = "medicamento_med")
@NamedQueries({
    @NamedQuery(name = "MedicamentoMed.findAll", query = "SELECT m FROM MedicamentoMed m"),
    @NamedQuery(name = "MedicamentoMed.findByCodigo", query = "SELECT m FROM MedicamentoMed m WHERE m.codigo = :codigo"),
    @NamedQuery(name = "MedicamentoMed.findByNombre", query = "SELECT m FROM MedicamentoMed m WHERE m.nombre = :nombre"),
    @NamedQuery(name = "MedicamentoMed.findByEstado", query = "SELECT m FROM MedicamentoMed m WHERE m.estado = :estado"),
    @NamedQuery(name = "MedicamentoMed.findByConcentracion", query = "SELECT m FROM MedicamentoMed m WHERE m.concentracion = :concentracion")})
public class MedicamentoMed implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "CODIGO")
    private String codigo;
    @Size(max = 300)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ESTADO")
    private boolean estado;
    @Size(max = 60)
    @Column(name = "CONCENTRACION")
    private String concentracion;
    @JoinColumn(name = "VIA_IDX", referencedColumnName = "IDX")
    @ManyToOne(optional = false)
    private ViaAdministracionMed viaIdx;
    @JoinColumn(name = "PRE_IDX", referencedColumnName = "IDX")
    @ManyToOne(optional = false)
    private PresentacionMedicamentoMed preIdx;

    public MedicamentoMed() {
    }

    public MedicamentoMed(String codigo) {
        this.codigo = codigo;
    }

    public MedicamentoMed(String codigo, boolean estado) {
        this.codigo = codigo;
        this.estado = estado;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean getEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getConcentracion() {
        return concentracion;
    }

    public void setConcentracion(String concentracion) {
        this.concentracion = concentracion;
    }

    public ViaAdministracionMed getViaIdx() {
        return viaIdx;
    }

    public void setViaIdx(ViaAdministracionMed viaIdx) {
        this.viaIdx = viaIdx;
    }

    public PresentacionMedicamentoMed getPreIdx() {
        return preIdx;
    }

    public void setPreIdx(PresentacionMedicamentoMed preIdx) {
        this.preIdx = preIdx;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MedicamentoMed)) {
            return false;
        }
        MedicamentoMed other = (MedicamentoMed) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.unicauca.divsalud.entidades.MedicamentoMed[ codigo=" + codigo + " ]";
    }
    
}
