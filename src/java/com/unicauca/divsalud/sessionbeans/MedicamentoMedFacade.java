/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.sessionbeans;

import com.unicauca.divsalud.entidades.MedicamentoMed;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Albert Muñoz
 */
@Stateless
public class MedicamentoMedFacade extends AbstractFacade<MedicamentoMed> {

    @PersistenceContext(unitName = "divisionsaludPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MedicamentoMedFacade() {
        super(MedicamentoMed.class);
    }
    
}
