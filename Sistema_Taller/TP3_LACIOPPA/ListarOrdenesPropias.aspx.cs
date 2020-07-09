using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DOMINIO;
using NEGOCIO;

namespace TP3_LACIOPPA
{
    public partial class ListarOrdenesPropias : System.Web.UI.Page
    {
        public List<Reparaciones> lista1 { get; set; }
        public List<Reparaciones> lista2 { get; set; }
        public List<Reparaciones> lista4 { get; set; }
        public List<Reparaciones> lista5 { get; set; }
        string validacion1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            validacion1 = (string)Session["UsuarioTecnico"];
            if (validacion1 == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('PRIMERO LOGUEATE');window.location ='login.aspx';", true);
            }
            else
            {
                ReparacionesNegocio rpn = new ReparacionesNegocio();
                lblidtecnico.Visible = false;
                lblidtecnico.Text = (string)Session["IDTecnico"].ToString();

                //EN REPARACION
                lista1 = rpn.listarRep1(lblidtecnico.Text);
                //FINALIZADO A TIEMPO
                lista2 = rpn.listarRep2(lblidtecnico.Text);
                //FINALIZADO CON DEMORA
                lista4 = rpn.listarRep4(lblidtecnico.Text);
                //FINALIZADO SIN REPARACION
                lista5 = rpn.listarRep5(lblidtecnico.Text);
            }
        }
    }
}