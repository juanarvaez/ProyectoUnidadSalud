/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicauca.divsalud.managedbeans;
import com.unicauca.divsalud.entidades.Facultad;
import com.unicauca.divsalud.entidades.Programas;

import com.unicauca.divsalud.entidades.ConsultaMedicaMed;
import com.unicauca.divsalud.entidades.Paciente;
import com.unicauca.divsalud.clases.ReportesMedicos;
import com.unicauca.divsalud.entidades.Diagnosticos;

import com.unicauca.divsalud.sessionbeans.FacultadFacade;
import com.unicauca.divsalud.sessionbeans.ProgramasFacade;
import com.unicauca.divsalud.sessionbeans.ConsultaMedicaMedFacade;
import com.unicauca.divsalud.sessionbeans.DiagnosticosFacade;
import com.unicauca.divsalud.sessionbeans.PacienteFacade;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.PieChartModel;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;

import javax.annotation.PostConstruct;
import java.io.Serializable;


@Named(value = "estadisticasMedController")
@SessionScoped
public class EstadisticasMedController implements Serializable
{
    
    
    
    
    @EJB
    private FacultadFacade ejbFacultad;
   
    @EJB
    private ProgramasFacade ejbProgramas;
    @EJB
    private ConsultaMedicaMedFacade ejbConsultaMedicaMed;
    @EJB
    private PacienteFacade ejbPaciente;
    @EJB
    private DiagnosticosFacade ejbDiagnosticos;
    @EJB
    private FacultadFacade ejbFacultades;

    private List<Diagnosticos> listaDiagnosticos;    
    private List<ConsultaMedicaMed> listaConsultaMedicaMed;
    private List<Paciente> listaPaciente;
    private List<Facultad> listaFacultades;
    private List<Programas> listaProgramas;
    
    
    private int contadordiagnosticosmedicas;
    private int contadormujeres;
    private int contadorhombres;
    private ReportesMedicos reportesmedicos;

   
    private BarChartModel barModel;
    private PieChartModel modeloResultadosMedicas;
    private PieChartModel pieModel2; //nueva grafica

    public EstadisticasMedController() {
        //diagnosticos = new ArrayList<>();
        listaDiagnosticos= new ArrayList<>();
        listaConsultaMedicaMed= new ArrayList<>();
        listaPaciente= new ArrayList<>();
        listaFacultades = new ArrayList<>();
        listaProgramas= new ArrayList<>();
        reportesmedicos= new ReportesMedicos();
        modeloResultadosMedicas = new PieChartModel();
        pieModel2=new PieChartModel();
    }

    @PostConstruct
    public void init() {
        createPieModel2(0,0);
        listaDiagnosticos= ejbDiagnosticos.findAll();
        listaConsultaMedicaMed=ejbConsultaMedicaMed.findAll();
        listaPaciente=ejbPaciente.findAll();
        listaFacultades = ejbFacultad.findAll();
        listaProgramas = ejbProgramas.findAll();
   
    }
    
      public PieChartModel getPieModel2() {
        return pieModel2;
    }
      public BarChartModel getBarModel() {
        return barModel;
        }

    public ReportesMedicos getReportesmedicos() {
        return reportesmedicos;
    }

    public void setReportesmedicos(ReportesMedicos reportesmedicos) {
        this.reportesmedicos = reportesmedicos;
    }


    public List<Facultad> getListaFacultades() {
        return listaFacultades;
    }

    public void setListaFacultades(List<Facultad> listaFacultades) {
        this.listaFacultades = listaFacultades;
    }

    public List<ConsultaMedicaMed> getListaConsultaMedicaMed() {
        return listaConsultaMedicaMed;
    }

    public void setListaConsultaMedicaMed(List<ConsultaMedicaMed> listaConsultaMedicaMed) {
        this.listaConsultaMedicaMed = listaConsultaMedicaMed;
    }

    public List<Paciente> getListaPaciente() {
        return listaPaciente;
    }

    public void setListaPaciente(List<Paciente> listaPaciente) {
        this.listaPaciente = listaPaciente;
    }
  
    public PieChartModel getModeloResultadosMedicas() {
        return modeloResultadosMedicas;
    }

    public void setModeloResultadosMedicas(PieChartModel modeloResultadosMedicas) {
        this.modeloResultadosMedicas = modeloResultadosMedicas;
    }
        
    public List<Programas> getListaProgramas() {
        return listaProgramas;
    }

    public void setListaProgramas(List<Programas> listaProgramas) {
        this.listaProgramas = listaProgramas;
    }

   

    

   
    // de vuelve una lista con los diagnosticos que coinciden con el diagnostico del filtro
    
    public List<Diagnosticos> diagnosticoElegido()
    {
        listaDiagnosticos= ejbDiagnosticos.findAll();
        contadordiagnosticosmedicas=0;
        List<Diagnosticos> diagnosticosfiltro=new ArrayList<>();   //lista que almacena los diagnosticos iguales al seleccionado en el filtro
        System.out.println("hola1");
        
        for(int i=0;i<listaDiagnosticos.size();i++)
        {
            System.out.println("hola2");
                if(listaDiagnosticos.get(i).getDiagnosticosPK().getCodigoCie10().equals(reportesmedicos.getDiagnostico()))
                    {
                        diagnosticosfiltro.add(listaDiagnosticos.get(i));
                        System.out.println(diagnosticosfiltro.size());
                    }
        }
        return diagnosticosfiltro;
    }
    
    //devuelve una lista con las consultas de los diagnosticos seleccionados
    public List<ConsultaMedicaMed> filtroConsultaMedica(List<Diagnosticos> filtroDiagnosticos)
    {
        int compararfechadesde=0;
        int compararfechahasta=0;
        
        List<ConsultaMedicaMed> filtroConsultaMedicas= new ArrayList<>(); 
        for(int i=0; i<filtroDiagnosticos.size();i++)
        {
            for (int j=0;j<listaConsultaMedicaMed.size();j++)
            {
                int idConsultaMedicadeDiagnostico=filtroDiagnosticos.get(i).getDiagnosticosPK().getIdxConsulta();
                int idConsultaMedica=listaConsultaMedicaMed.get(j).getIdx();
                if(idConsultaMedicadeDiagnostico==idConsultaMedicadeDiagnostico)
                {
                     compararfechadesde=listaConsultaMedicaMed.get(j).getFecha().compareTo(reportesmedicos.getFechadesde());
                     compararfechahasta=listaConsultaMedicaMed.get(j).getFecha().compareTo(reportesmedicos.getFechahasta());
                     if(compararfechadesde>0 || compararfechadesde==0)
                        {
                            if(compararfechahasta<0 || compararfechahasta==0)
                            {
                                 filtroConsultaMedicas.add(listaConsultaMedicaMed.get(j));
                            }
                        }   
                }
            }
        }               
        return filtroConsultaMedicas;
    }
    
    //devuelve una lista de pacientes que estan en una lista de consulta
    public List<Paciente> filtroPaciente(List<ConsultaMedicaMed> filtroConsultas){
   
        List<Paciente> filtroPacientes=new ArrayList<>();     
        
        for(int i=0;i<filtroConsultas.size();i++)
        {
            for(int j=0;j<listaPaciente.size();j++)
            {
                if(filtroConsultas.get(i).getPacienteIdx().getId()==listaPaciente.get(j).getId())
                    filtroPacientes.add(listaPaciente.get(j));
            }
        }
    
    return filtroPacientes;
    }
    
    public List<Paciente> programaEstudiantes(List<Paciente> filtroPacientes)
    {
        List<Paciente> filtroPacientesPrograma=new ArrayList<>();
        for(int i=0;i<filtroPacientes.size();i++)
        {
            if(filtroPacientes.get(i).getPrograma().getNombre().equals(reportesmedicos.getPrograma()))
                filtroPacientesPrograma.add(filtroPacientes.get(i));
        }
        return filtroPacientesPrograma;
    }
    
    
    public void generoDelPaciente(List<Paciente> listaPaciente)
    {
    
        contadormujeres=0;
        contadorhombres=0;
        int idconsultapaciente=0;
        int idpaciente=0;
        String mujeres= "F";
        String hombres="M";
        String pacientes="";
        
      
            
            
            for(int j=0;j<listaPaciente.size();j++)
            {
                pacientes= listaPaciente.get(j).getSexo().toString();
                                 

                    if(pacientes.equals(hombres))
                    {

                        contadorhombres++;
                    }else if(pacientes.equals(mujeres))
                    {
                        contadormujeres++;
                    }
                

            }
            
            reportesmedicos.setContadorhombres(contadorhombres);
            reportesmedicos.setContadormujeres(contadormujeres);
            
        }
     
        
        
    
    
    
    
    
    
   
   
     
         private void createBarModels() {
        createBarModel();
      
        }
    
        public void createBarModel() {
        
        barModel = new BarChartModel();
        ChartSeries M = new ChartSeries();
        ChartSeries F = new ChartSeries();
        
         M.setLabel("Hombres");
         M.set("genero", 120);
         M.set("genq", 150);
         

         
         F.setLabel("Mujeres");
         F.set("genero", 125);
          F.set("genq", 135);
     
        barModel.addSeries(M);
  
        barModel.addSeries(F);
         
        barModel.setTitle("Bar Chart");
        barModel.setLegendPosition("ne");
         
        Axis xAxis = barModel.getAxis(AxisType.X);
        xAxis.setLabel("Hombres");
         
        Axis yAxis = barModel.getAxis(AxisType.Y);
        yAxis.setLabel("cantidad");
        yAxis.setMin(0);
        yAxis.setMax(200);
    }
    
    /**
     *
     * @param fecha
     * @return
     */
    public java.sql.Date convertirFecha(Date fecha)
    {
       long convertir=0;
       convertir = fecha.getTime();
       java.sql.Date sqlDate = new java.sql.Date(convertir);
       return sqlDate;
    }
    public void programaElegido()
    {
        reportesmedicos.getPrograma();
        System.out.println("programa" + reportesmedicos.getPrograma());
        
    }
    
    public double calcularPorcentajePacientesMedicas(int cantidadporgenero,int totalpacientes)
    {
        double porcentaje;
        porcentaje= (100 * cantidadporgenero) /totalpacientes;
        
        return porcentaje;
    }
    
    public void GenerarReporteMed()
    {
        
    List<Diagnosticos> filtroDiagnosticos=new ArrayList<>();    
    List<ConsultaMedicaMed> filtroConsultaMedicaMed=new ArrayList<>(); 
    List<Paciente> filtroPaciente=new ArrayList<>(); 
    List<Facultad>filtroFacultades=new ArrayList<>(); 
    List<Programas> filtroProgramas=new ArrayList<>(); 
        
    filtroDiagnosticos=this.diagnosticoElegido();
    filtroConsultaMedicaMed=this.filtroConsultaMedica(filtroDiagnosticos);
    filtroPaciente=this.filtroPaciente(filtroConsultaMedicaMed);
    filtroPaciente=this.programaEstudiantes(filtroPaciente);
    
    reportesmedicos.setCantidad(filtroPaciente.size());
    this.generoDelPaciente(filtroPaciente);
   // createPieModel2(reportesmedicos.getContadorhombres(),reportesmedicos.getContadormujeres());
      //  this.generoDelPaciente();
        //this.cargarModeloMedicas();
        //this.createBarModel();
    pieModel2.clear();
    pieModel2.set("Hombres", reportesmedicos.getContadorhombres());
    pieModel2.set("Mujeres",reportesmedicos.getContadormujeres());

    }

    private double calcularporcentaje(int totalpacientes, int dientes) {
        double resultado = (double) dientes / totalpacientes;

        return resultado * 100;
    }

    
    public void cargarModeloMedicas() {
        
        int hombres= reportesmedicos.getContadorhombres();
        int mujeres= reportesmedicos.getContadormujeres();
        int totalpacientes=reportesmedicos.getCantidad();
        modeloResultadosMedicas.set("Hombres",calcularPorcentajePacientesMedicas(hombres,totalpacientes));
        modeloResultadosMedicas.set("Mujeres",calcularPorcentajePacientesMedicas(mujeres,totalpacientes));

       
        modeloResultadosMedicas.setTitle("Gráfica de Resultados Médicos");
        modeloResultadosMedicas.setLegendPosition("e");
        modeloResultadosMedicas.setShowDataLabels(true);

       
    }
    
    private void createPieModel2(int hombres, int mujeres) {//segunda forma
        pieModel2 = new PieChartModel();
         
        pieModel2.set("Hombres", hombres);
        pieModel2.set("Mujeres", mujeres);
       
        
         
        pieModel2.setTitle("Resultados");
        pieModel2.setLegendPosition("e");
        pieModel2.setFill(true);
        pieModel2.setShowDataLabels(true);
        pieModel2.setDiameter(150);
    
    }

}
