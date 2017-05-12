/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.entidades;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ROED26
 */
@Entity
@Table(name = "actualizacion_odo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ActualizacionOdo.findAll", query = "SELECT a FROM ActualizacionOdo a"),
    @NamedQuery(name = "ActualizacionOdo.findById", query = "SELECT a FROM ActualizacionOdo a WHERE a.id = :id"),
    @NamedQuery(name = "ActualizacionOdo.findByAcompanante", query = "SELECT a FROM ActualizacionOdo a WHERE a.acompanante = :acompanante"),
    @NamedQuery(name = "ActualizacionOdo.findByTelefono", query = "SELECT a FROM ActualizacionOdo a WHERE a.telefono = :telefono"),
    @NamedQuery(name = "ActualizacionOdo.findByCelular", query = "SELECT a FROM ActualizacionOdo a WHERE a.celular = :celular"),
    @NamedQuery(name = "ActualizacionOdo.findByParentesco", query = "SELECT a FROM ActualizacionOdo a WHERE a.parentesco = :parentesco"),
    @NamedQuery(name = "ActualizacionOdo.findByFecha", query = "SELECT a FROM ActualizacionOdo a WHERE a.fecha = :fecha"),
    @NamedQuery(name = "ActualizacionOdo.findByHora", query = "SELECT a FROM ActualizacionOdo a WHERE a.hora = :hora"),
    @NamedQuery(name = "ActualizacionOdo.findByTipo", query = "SELECT a FROM ActualizacionOdo a WHERE a.tipo = :tipo"),
    @NamedQuery(name = "ActualizacionOdo.findByPaciente", query = "SELECT a FROM ActualizacionOdo a WHERE a.idPaciente.id = :idPaciente")
})
public class ActualizacionOdo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 40)
    @Column(name = "ACOMPANANTE")
    private String acompanante;
    @Size(max = 40)
    @Column(name = "TELEFONO")
    private String telefono;
    @Size(max = 40)
    @Column(name = "CELULAR")
    private String celular;
    @Size(max = 30)
    @Column(name = "PARENTESCO")
    private String parentesco;
    @Column(name = "FECHA")
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 5)
    @Column(name = "HORA")
    private String hora;
    @Size(max = 40)
    @Column(name = "TIPO")
    private String tipo;
    @JoinColumn(name = "ID_PACIENTE", referencedColumnName = "ID")
    @ManyToOne
    private Paciente idPaciente;
    @JoinColumn(name = "ID_USUARIO", referencedColumnName = "ID")
    @ManyToOne
    private UsuariosSistema idUsuario;

    public ActualizacionOdo() {
    }

    public ActualizacionOdo(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAcompanante() {
        return acompanante;
    }

    public void setAcompanante(String acompanante) {
        this.acompanante = acompanante;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Paciente getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Paciente idPaciente) {
        this.idPaciente = idPaciente;
    }

    public UsuariosSistema getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(UsuariosSistema idUsuario) {
        this.idUsuario = idUsuario;
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
        if (!(object instanceof ActualizacionOdo)) {
            return false;
        }
        ActualizacionOdo other = (ActualizacionOdo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.unicauca.divsalud.entidades.ActualizacionOdo[ id=" + id + " ]";
    }


}
