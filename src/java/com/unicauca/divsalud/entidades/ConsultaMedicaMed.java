/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Danilo
 */
@Entity
@Table(name = "consulta_medica_med")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ConsultaMedicaMed.findAll", query = "SELECT c FROM ConsultaMedicaMed c"),
    @NamedQuery(name = "ConsultaMedicaMed.findByIdx", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.idx = :idx"),
    @NamedQuery(name = "ConsultaMedicaMed.findByFecha", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.fecha = :fecha"),
    @NamedQuery(name = "ConsultaMedicaMed.findByPeso", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.peso = :peso"),
    @NamedQuery(name = "ConsultaMedicaMed.findByTalla", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.talla = :talla"),
    @NamedQuery(name = "ConsultaMedicaMed.findByImc", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.imc = :imc"),
    @NamedQuery(name = "ConsultaMedicaMed.findByTemperatura", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.temperatura = :temperatura"),
    @NamedQuery(name = "ConsultaMedicaMed.findByFrecCardiaca", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.frecCardiaca = :frecCardiaca"),
    @NamedQuery(name = "ConsultaMedicaMed.findByFrecRespiratoria", query = "SELECT c FROM ConsultaMedicaMed c WHERE c.frecRespiratoria = :frecRespiratoria")})
public class ConsultaMedicaMed implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "IDX")
    private Integer idx;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "MOTIVO")
    private String motivo;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "ENFERMEDAD_ACTUAL")
    private String enfermedadActual;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "PESO")
    private BigDecimal peso;
    @Column(name = "TALLA")
    private BigDecimal talla;
    @Column(name = "IMC")
    private BigDecimal imc;
    @Column(name = "TEMPERATURA")
    private BigDecimal temperatura;
    @Column(name = "FREC_CARDIACA")
    private BigDecimal frecCardiaca;
    @Column(name = "FREC_RESPIRATORIA")
    private BigDecimal frecRespiratoria;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "ANALISIS")
    private String analisis;
    @JoinColumn(name = "PACIENTE_IDX", referencedColumnName = "ID")
    @ManyToOne
    private Paciente pacienteIdx;
    @JoinColumn(name = "ACOMPANIANTE_MED_IDX", referencedColumnName = "IDX")
    @ManyToOne
    private AcompanianteMed acompanianteMedIdx;

    public ConsultaMedicaMed() {
    }

    public ConsultaMedicaMed(Integer idx) {
        this.idx = idx;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getEnfermedadActual() {
        return enfermedadActual;
    }

    public void setEnfermedadActual(String enfermedadActual) {
        this.enfermedadActual = enfermedadActual;
    }

    public BigDecimal getPeso() {
        return peso;
    }

    public void setPeso(BigDecimal peso) {
        this.peso = peso;
    }

    public BigDecimal getTalla() {
        return talla;
    }

    public void setTalla(BigDecimal talla) {
        this.talla = talla;
    }

    public BigDecimal getImc() {
        return imc;
    }

    public void setImc(BigDecimal imc) {
        this.imc = imc;
    }

    public BigDecimal getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(BigDecimal temperatura) {
        this.temperatura = temperatura;
    }

    public BigDecimal getFrecCardiaca() {
        return frecCardiaca;
    }

    public void setFrecCardiaca(BigDecimal frecCardiaca) {
        this.frecCardiaca = frecCardiaca;
    }

    public BigDecimal getFrecRespiratoria() {
        return frecRespiratoria;
    }

    public void setFrecRespiratoria(BigDecimal frecRespiratoria) {
        this.frecRespiratoria = frecRespiratoria;
    }

    public String getAnalisis() {
        return analisis;
    }

    public void setAnalisis(String analisis) {
        this.analisis = analisis;
    }

    public Paciente getPacienteIdx() {
        return pacienteIdx;
    }

    public void setPacienteIdx(Paciente pacienteIdx) {
        this.pacienteIdx = pacienteIdx;
    }

    public AcompanianteMed getAcompanianteMedIdx() {
        return acompanianteMedIdx;
    }

    public void setAcompanianteMedIdx(AcompanianteMed acompanianteMedIdx) {
        this.acompanianteMedIdx = acompanianteMedIdx;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idx != null ? idx.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ConsultaMedicaMed)) {
            return false;
        }
        ConsultaMedicaMed other = (ConsultaMedicaMed) object;
        if ((this.idx == null && other.idx != null) || (this.idx != null && !this.idx.equals(other.idx))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.unicauca.divsalud.entidades.ConsultaMedicaMed[ idx=" + idx + " ]";
    }
    
}
