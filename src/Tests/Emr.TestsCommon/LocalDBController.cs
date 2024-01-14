using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace Emr.TestsCommon
{
    public static class LocalDBController
    {
        //TODO: need to expand this method to allow the possibility of one instance with multiple databases
        public static string DbName = "patientData";
        public static void Start(string databaseName)
        {
            // make sure any previous instances are shut down
            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                WindowStyle = ProcessWindowStyle.Hidden,
                FileName = "cmd.exe",
                Arguments = "/c sqllocaldb stop \"" + databaseName + "testinstance\"",
            };

            Process process = new Process { StartInfo = startInfo };
            process.Start();
            process.WaitForExit();

            // delete any previous instance
            startInfo.Arguments = "/c sqllocaldb delete \"" + databaseName + "testinstance\"";
            process.Start();
            process.WaitForExit();

            // check to see if the database files exist, if so, then delete them
            if (File.Exists(databaseName + ".mdf"))
            {
                File.Delete(databaseName + ".mdf");
            }

            if (File.Exists(databaseName + "_log.ldf"))
            {
                File.Delete(databaseName + "_log.ldf");
            }

            // create a new localdb sql server instance
            startInfo = new ProcessStartInfo
            {
                WindowStyle = ProcessWindowStyle.Hidden,
                FileName = "cmd.exe",
                Arguments = "/c sqllocaldb create \"" + databaseName + "testinstance\" -s",
            };

            process = new Process { StartInfo = startInfo };
            process.Start();
            process.WaitForExit();

            CreateDatabase(databaseName);
        }

        public static void End(string databaseName)
        {
            // shut down the instance
            ProcessStartInfo startInfo = new ProcessStartInfo
            {
                WindowStyle = ProcessWindowStyle.Hidden,
                FileName = "cmd.exe",
                Arguments = "/c sqllocaldb stop \"" + databaseName + "testinstance\""
            };

            Process process = new Process { StartInfo = startInfo };
            process.Start();
            process.WaitForExit();

            // delete the instance
            startInfo.Arguments = "/c sqllocaldb delete \"" + databaseName + "testinstance\"";
            process.Start();
            process.WaitForExit();

            if (File.Exists(databaseName + ".mdf"))
            {
                File.Delete(databaseName + ".mdf");
            }

            if (File.Exists(databaseName + "_log.ldf"))
            {
                File.Delete(databaseName + "_log.ldf");
            }
        }

        public static IDbConnection GetLocalDbConnection(string databaseName)
        {
            var dbConnection = new SqlConnection(
                "server=(localdb)\\" + databaseName + "testinstance;" +
                "Trusted_Connection=yes;" +
                "database=" + databaseName + "; " +
                "Integrated Security=true; " +
                "connection timeout=30");
            return dbConnection;
        }

        public static void ApplySproc(string databaseName, string filePath)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection(databaseName);

            StringBuilder sql = new StringBuilder();
            foreach (string fileName in Directory.GetFiles(filePath, "*.sql"))
            {
                sql.Append(File.ReadAllText(fileName));
            }
            ExecuteBatchNonQuery(sql.ToString(), db);
        }

        public static void CreateTables(string databaseName, string filePath)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection(databaseName);

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
            SqlConnection db = (SqlConnection)GetLocalDbConnection(databaseName);
            ExecuteBatchNonQuery(File.ReadAllText(tablePath), db);
        }

        public static void TruncateData(string databaseName, string[] tableList)
        {
            SqlConnection db = (SqlConnection)GetLocalDbConnection(databaseName);
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
            string databaseDirectory = Environment.CurrentDirectory;

            SqlConnection db = new SqlConnection(
                "server=(localdb)\\" + databaseName + "testinstance;" +
                "Trusted_Connection=yes;" +
                "database=master; " +
                "Integrated Security=true; " +
                "connection timeout=30");

            db.Open();

            try
            {
                SqlCommand myCommand = new SqlCommand(@"CREATE DATABASE [" + databaseName + @"]
                  CONTAINMENT = NONE
                  ON  PRIMARY 
                  ( NAME = N'" + databaseName + @"', FILENAME = N'" + databaseDirectory + @"\" + databaseName +
                                                              @".mdf' , SIZE = 8096KB , FILEGROWTH = 1024KB )
                  LOG ON 
                  ( NAME = N'" + databaseName + @"_log', FILENAME = N'" + databaseDirectory + @"\" + databaseName +
                                                              @"_log.ldf' , SIZE = 8096KB , FILEGROWTH = 10%)
                  ", db);

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
