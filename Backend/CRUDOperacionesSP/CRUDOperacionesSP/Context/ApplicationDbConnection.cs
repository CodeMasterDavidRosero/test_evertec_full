using CRUDOperacionesSP.Models;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;

namespace CRUDOperacionesSP.Context
{
    public class ApplicationDbConnection
    {
        readonly string connectionString = "Data Source = DESKTOP-CERQ8B5; Initial Catalog=almacenados; Integrated Security=True";

        //Obtenemos la conección y el listado de las personas con su data!!!
        public IEnumerable<Persona> MostrarPesonas()
        {
           var personaList = new List<Persona>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("personasMostrar", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var persona = new Persona();
                    {
                        persona.Id = Convert.ToInt32(dr["Id"].ToString());
                        persona.Nombre = dr["Nombre"].ToString();
                        persona.Telefono = dr["Telefono"].ToString();
                        persona.Fecha_Nacimiento = dr["Fecha_Nacimiento"].ToString();
                    };

                    personaList.Add(persona);

                }
                con.Close();

            }
            return personaList; 

        }

        //Obtenemos la conección y la Inserción de los datos de las personas!!!
        public void InsetarPersona (Persona persona)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("personasInsertar", con)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Nombre", persona.Nombre);
                cmd.Parameters.AddWithValue("@Telefono", persona.Telefono);
                cmd.Parameters.AddWithValue("@Fecha_Nacimiento", persona.Fecha_Nacimiento);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        //Obtenemos la conección y la Actualización de los datos de las personas!!!
        public void ActulizarPersona (Persona persona)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("personasActualizar", con)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", persona.Id);
                cmd.Parameters.AddWithValue("@Nombre", persona.Nombre);
                cmd.Parameters.AddWithValue("@Telefono", persona.Telefono);
                cmd.Parameters.AddWithValue("@Fecha_Nacimiento", persona.Fecha_Nacimiento);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        //Obtenemos la conección y el Borrado de los datos de las personas!!!
        public void BorrarPersona(int? Id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("personasBorrar", con)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", Id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        //Obtenemos la conección y buscamos una persona por su ID!!!
        public Persona Persona_Id(int? Id)
        {
            var persona = new Persona();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("persona_ID", con)
                {
                    CommandType = CommandType.StoredProcedure
                };

                cmd.Parameters.AddWithValue("@Id", Id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader(); 
                while (dr.Read())
                {
                    persona.Id = Convert.ToInt32(dr["Id"].ToString());
                    persona.Nombre = dr["Nombre"].ToString();
                    persona.Telefono = dr["Telefono"].ToString();
                    persona.Fecha_Nacimiento = dr["Fecha_Nacimiento"].ToString();
                }
                con.Close();

            }
            return persona;

        }
    }
}
