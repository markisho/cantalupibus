using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ClientesCasuales
/// </summary>
public class ClientesCasuales
{
    private
       int dniSolicitante;
    string nombreSolicitante;
    string apellidoSolicitante;
    string telefonoSolicitante;
    string emailSolicitante;

    public int dni_Solicitante   // the Name property
    {
        get
        {
            return dniSolicitante ;
        }
        set
        {
            dniSolicitante  = value;
        }
    }
    public string nombre_Solictante   // the Name property
    {
        get
        {
            return nombreSolicitante ;
        }
        set
        {
            nombreSolicitante  = value;
        }
    }
    public string apellido_Solicitante  // the Name property
    {
        get
        {
            return apellidoSolicitante ;
        }
        set
        {
            apellidoSolicitante  = value;
        }
    }
    public string telefono_Solicitante   // the Name property
    {
        get
        {
            return telefonoSolicitante ;
        }
        set
        {
            telefonoSolicitante  = value;
        }
    }
    public string email_Solicitante   // the Name property
    {
        get
        {
            return emailSolicitante ;
        }
        set
        {
            emailSolicitante = value;
        }
    }
	public ClientesCasuales()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    ~ClientesCasuales()  // destructor
    {
        ((IDisposable)this).Dispose();

    }
}