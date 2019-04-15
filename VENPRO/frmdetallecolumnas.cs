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
    public partial class frmdetallecolumnas : Form
    {
        public frmdetallecolumnas()
        {
            InitializeComponent();
        }

        public bool rs = false;
        public int g_codigo = 0;
        public string g_nombre = "";

        private void frmdetallecolumnas_Load(object sender, EventArgs e)
        {
          


        }

        private void btnaceptar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dtg_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

            try
            {
                if (dtg.RowCount > 0)
                {
                    string t_codigo = dtg.Rows[e.RowIndex].Cells[0].Value.ToString();
                    string t_nombre = dtg.Rows[e.RowIndex].Cells[1].Value.ToString();
                    //string t_nombrexml = dtg.Rows[e.RowIndex].Cells[2].Value.ToString();
                                        
                    g_codigo = Convert.ToInt32(t_codigo);
                    rs = true;
                    this.Close();
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Volver a intentar ocurrio un error." + ex.Message);

            }

        }
    }
}
