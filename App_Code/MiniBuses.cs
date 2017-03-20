using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de MiniBuses
/// </summary>
public class MiniBuses
{
    private
       int idMiniBus;
    int idMarcaBus;
    int idModeloBus;
    string color;
    string patente;
    int codPrestacion;   //codigo de prestacion del bus
    bool busActivo;

    public int id_miniBus  // the Name property
    {
        get
        {
            return idMiniBus ;
        }
        set
        {
            idMiniBus  = value;
        }
    }
    public int id_marcaBus  // the Name property
    {
        get
        {
            return idMarcaBus ;
        }
        set
        {
            idMarcaBus  = value;
        }
    }
    public int id_modeloBus  // the Name property
    {
        get
        {
            return idModeloBus ;
        }
        set
        {
            idModeloBus  = value;
        }
    }
    public string Patente_Bus   // the Name property
    {
        get
        {
            return patente ;
        }
        set
        {
            patente  = value;
        }
    }
    public int codigo_Prestacion  // the Name property
    {
        get
        {
            return codPrestacion ;
        }
        set
        {
            codPrestacion  = value;
        }
    }
    public bool  Bus_Activo   // the Name property
    {
        get
        {
            return busActivo  ;
        }
        set
        {
            busActivo   = value;
        }
    }
   


	public MiniBuses()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}


    
        ~MiniBuses()  // destructor
        {
            ((IDisposable)this).Dispose();// cleanup statements...
        }
}