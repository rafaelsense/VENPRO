using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace VENPRO
{
    public partial class frmcreararchivo : Form
    {
        public frmcreararchivo()
        {
            InitializeComponent();
        }

        public string g_datoformat = "";
        public bool rs = false;
        private void frmcreararchivo_Load(object sender, EventArgs e)
        {

            if (g_datoformat.Trim() != "")
            {
                this.txtdato.Text = globales.formatdata(g_datoformat);
                this.txtformato.Text = g_datoformat;

            }

        }


        private void btnagregafecha_Click(object sender, EventArgs e)
        {
            if (this.cbofechaformat.SelectedIndex == -1) {
                MessageBox.Show("Debe ingresar una Formato de Fecha");
                this.cbofechaformat.Focus();
                return;
            }
            //Fecha:   |f=-3=yyy-MM-dd|
            string textoformato = "";
            textoformato = "f=" + this.numdia.Value.ToString() + "=" + this.cbofechaformat.SelectedItem.ToString() + "|";
            this.txtformato.Text = this.txtformato.Text+ textoformato;
            this.txtdato.Text = globales.formatdata(this.txtformato.Text);

            this.cbofechaformat.SelectedIndex = -1;

        }

        private void btnagregatexto_Click(object sender, EventArgs e)
        {
            if (this.txttexto.Text == "")
            {
                MessageBox.Show("Debe ingresar un texto");
                this.txttexto.Focus();
                return;
            }
            //Texto:   |t=valor texto ingresado|
            string textoformato = "";
            textoformato = "t=" + this.txttexto.Text + "|";
            this.txtformato.Text = this.txtformato.Text + textoformato;
            this.txtdato.Text = globales.formatdata(this.txtformato.Text);

            this.txttexto.Text = "";
        }

        private void btnagregarsemana_Click(object sender, EventArgs e)
        {
            //semana:   |s=-1|
            string textoformato = "";
            textoformato = "s=" + this.numdiasemana.Value.ToString() + "|";
            this.txtformato.Text = this.txtformato.Text + textoformato;
            this.txtdato.Text = globales.formatdata(this.txtformato.Text);

            this.numdiasemana.Value = 0;
        }

        private void btnagregarmescomer_Click(object sender, EventArgs e)
        {
            //Mes comercial:   |mc=-5|
            string textoformato = "";
            textoformato = "mc=" + this.numdiamescomer.Value.ToString() + "|";
            this.txtformato.Text = this.txtformato.Text + textoformato;
            this.txtdato.Text = globales.formatdata(this.txtformato.Text);

            this.numdiamescomer.Value = 0;
        }

        private void btnaceptar_Click(object sender, EventArgs e)
        {
            rs = true;
            g_datoformat = this.txtformato.Text;
            this.Close();
        }

        private void txtformato_MouseDoubleClick(object sender, MouseEventArgs e)
        {

            if (this.txtformato.ReadOnly)
            {
                this.txtformato.ReadOnly = false;
            }
            else {
                this.txtformato.ReadOnly = true;
            }

        }

        private void btnlimpiar_Click(object sender, EventArgs e)
        {
            g_datoformat = "";
            this.txtformato.Text = "";
            this.txtdato.Text = "";
        }

        

    }
}
