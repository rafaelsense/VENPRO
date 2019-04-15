using System;
using System.Collections.Generic;
using System.Windows.Forms;
using Microsoft.VisualBasic.ApplicationServices;

namespace VENPRO
{
    static class Program
    {
        /// <summary>
        /// Punto de entrada principal para la aplicación.
        /// </summary>
        [STAThread]

        //static void Main()
        //{
            static void Main(string[] args)
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            //Application.Run(new Form1());
            new MyApp().Run(args);
        }

    }

        class MyApp : WindowsFormsApplicationBase
        {
            //Creamos el constructor y especificamos que la forma en que 
            //la aplicacion inicializara el objeto My.User de VisualBasic
            public MyApp()
                : base(AuthenticationMode.ApplicationDefined)
            {
                //Especificamos que solo queremos que se ejecute una solo instancia de la aplicación
                IsSingleInstance = true;
                ShutdownStyle = ShutdownMode.AfterMainFormCloses;
            }

            protected override void OnCreateMainForm()
            {
                //Indicamos cual será el formulario principal de la aplicación
                MainForm = new Form1();
            }

            protected override bool OnStartup(StartupEventArgs eventArgs)
            {
                //Hacer algo con los parámetros recibidos eventArgs.CommandLine
                return base.OnStartup(eventArgs);
            }

            protected override void OnStartupNextInstance(StartupNextInstanceEventArgs eventArgs)
            {
                //Hacer algo con los parámetros recibidos eventArgs.CommandLine
                base.OnStartupNextInstance(eventArgs);
            }
        }

    
}
