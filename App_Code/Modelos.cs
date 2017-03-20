using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Modelos
/// </summary>
public class Modelos
{
    private
    int idMarcaModelo;
    int idModelo;
    string modelo;
    DateTime fechaFabricacion;
    string pais;
    int capAsientos;            //capacidad de asientos

    public int id_MarcaModelo   // the Name property
    {
        get
        {
            return idMarcaModelo ;
        }
        set
        {
            idMarcaModelo  = value;
        }
    }
    public int id_Modelo   // the Name property
    {
        get
        {
            return idModelo ;
        }
        set
        {
            idModelo  = value;
        }
    }
    public string modeloVehiculo   // the Name property
    {
        get
        {
            return modelo ;
        }
        set
        {
           modelo  = value;
        }
    }
    public DateTime  fecha_Fabricacion   // the Name property
    {
        get
        {
            return fechaFabricacion ;
        }
        set
        {
            fechaFabricacion  = value;
        }
    }
    public string PaisFabricacion   // the Name property
    {
        get
        {
            return pais ;
        }
        set
        {
            pais  = value;
        }
    }

    public int cantidadAsientos   // the Name property
    {
        get
        {
            return capAsientos ;
        }
        set
        {
            capAsientos  = value;
        }
    }
	public Modelos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    
        ~Modelos()  // destructor
        {
            ((IDisposable)this).Dispose(); // cleanup statements...
        }
}