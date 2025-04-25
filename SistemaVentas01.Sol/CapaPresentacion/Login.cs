using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btncancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btningresar_Click(object sender, EventArgs e)
        {
            Inicio formInicio = new Inicio();
            this.Hide();
            formInicio.Show();
            formInicio.FormClosing += frm_closing;
            
        }

        private void frm_closing(object sender, FormClosingEventArgs e)
        {
            txtcontrasenia.Text = "";
            txtdocumento.Text = "";
            this.Show();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
