using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Prestaciones
/// </summary>
public class Prestaciones
{
    private
    int codPrestacion;    // codigo de prestacion
    string elemento;

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
    public string Elementos  // the Name property
    {
        get
        {
            return elemento ;
        }
        set
        {
            elemento  = value;
        }
    }
	public Prestaciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}


 ~Prestaciones()  // destructor
        {
            ((IDisposable)this).Dispose(); // cleanup statements...
        }    


}