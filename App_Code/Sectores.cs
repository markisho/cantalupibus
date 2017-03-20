using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Sectores
/// </summary>
public class Sectores
{
 private
     int codSector;
     string descripcion;


    public int cod_Sector   // the Name property
    {
        get
        {
            return codSector ;
        }
        set
        {
            codSector  = value;
        }
    }

    public string Descripcion   // the Name property
    {
        get
        {
            return descripcion;
        }
        set
        {
            descripcion= value;
        }
    }
	public Sectores()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    
        ~Sectores()  // destructor
        {
            ((IDisposable)this).Dispose(); // cleanup statements...
        }
        
}