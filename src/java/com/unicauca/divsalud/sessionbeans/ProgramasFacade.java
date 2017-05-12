/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.sessionbeans;

import com.unicauca.divsalud.entidades.Programas;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ROED26
 */
@Stateless
public class ProgramasFacade extends AbstractFacade<Programas> {

    @PersistenceContext(unitName = "divisionsaludPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProgramasFacade() {
        super(Programas.class);
    }

    public List<Programas> buscarPorIdPrograma(int idPrograma) {
        Query query = getEntityManager().createNamedQuery("Programas.findByIdPrograma");
        query.setParameter("idProgram", idPrograma);
        List<Programas> resultList = query.getResultList();
        return resultList;
    }

}
