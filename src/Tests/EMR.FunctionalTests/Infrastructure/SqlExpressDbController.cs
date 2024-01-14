using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace EMR.FunctionalTests.Infrastructure
{
    public static class SqlExpressDbController
    {
        //TODO: need to expand this method to allow the possibility of one instance with multiple databases
        public static string DbName = "FunctionalData";
        public static void Start(string databaseName)
        {
            DropDatabase();
            CreateDatabase(databaseName);
        }
        public static void DropDatabase()
        {
            System.Data.Entity.Database.Delete(GetLocalDbConnection("Default").ConnectionString);
        }

        public static void End(string databaseName)
        {

        }

        public static IDbConnection GetLocalDbConnection(string connectionName)
        {
            var connectString = ConfigurationManager.ConnectionStrings[connectionName];
            var factory = DbProviderFactories.GetFactory(connectString.ProviderName);
            IDbConnection connection = factory.CreateConnection();
            connection.ConnectionString = connectString.ConnectionString;
            return connection;
        }

        public static void ApplySproc(string databaseName, string filePath)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection("Default");

            StringBuilder sql = new StringBuilder();
            foreach (string fileName in Directory.GetFiles(filePath, "*.sql"))
            {
                sql.Append(File.ReadAllText(fileName));
            }
            ExecuteBatchNonQuery(sql.ToString(), db);
        }

        public static void CreateTables(string databaseName, string filePath)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection("Default");

            foreach (string file in Directory.GetFiles(filePath, "*.sql"))
            {
                var content = File.ReadAllText(file);
                if (content.Length > 1)
                {
                    ExecuteBatchNonQuery(content, db);
                }
            }
        }
        public static void CreateData(string databaseName, string tablePath)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection("Default");
            ExecuteBatchNonQuery(File.ReadAllText(tablePath), db);
        }


        public static void TruncateData(string databaseName, string[] tableList)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection("Default");
            db.Open();

            foreach (var item in tableList)
            {
                SqlCommand myCommand = new SqlCommand(@"TRUNCATE TABLE " + databaseName + ".." + item, db);
                myCommand.ExecuteNonQuery();
            }
            db.Close();
        }

        private static void CreateDatabase(string databaseName)
        {

            var db = (SqlConnection)GetLocalDbConnection("Master");

            db.Open();

            try
            {
                SqlCommand myCommand = new SqlCommand(@"CREATE DATABASE [" + databaseName + @"]", db);

                myCommand.ExecuteNonQuery();
                db.Close();
            }
            catch (Exception ex)
            {
                string temp = ex.Message;
                throw;
            }
        }

        private static void ExecuteBatchNonQuery(string sql, SqlConnection conn)
        {
            string sqlBatch = string.Empty;
            SqlCommand cmd = new SqlCommand(string.Empty, conn);
            conn.Open();
            sql += "\nGO";   // make sure last batch is executed.
            try
            {
                foreach (string line in sql.Split(new string[2] { "\n", "\r" }, StringSplitOptions.RemoveEmptyEntries))
                {
                    if (line.ToUpperInvariant().Trim() == "GO")
                    {
                        cmd.CommandText = sqlBatch;
                        cmd.ExecuteNonQuery();
                        sqlBatch = string.Empty;
                    }
                    else
                    {
                        sqlBatch += line + "\n";
                    }
                }
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
