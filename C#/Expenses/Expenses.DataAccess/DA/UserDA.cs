using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Expenses.DataAccess
{
    public class UserDA : BaseDA
    {
        public User Get(int id)
        {
            const string query =
                @"select
                    nId
                    ,sSurname
                    ,sName
                    ,dtBirthday
                    ,sSex
                    ,sPhone
                    ,sEmail
                from
                    api.v_dicUsers  
                where
                	nId = @pnId;";
            var result = new User();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    reader.Read();
                    result = new User
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("nId")),
                        Surname = reader.GetString(reader.GetOrdinal("sSurname")),
                        Name = reader.GetString(reader.GetOrdinal("sName")),
                        Birthday = reader.GetDateTime(reader.GetOrdinal("dtBirthday")),
                        Sex = reader.GetString(reader.GetOrdinal("sSex")),
                        Email = reader.GetString(reader.GetOrdinal("sEmail")),
                        Phone = reader.GetString(reader.GetOrdinal("sPhone")),
                    };
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения пользователя [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public IEnumerable<User> GetAll()
        {
            const string query =
                @"select
                    nId
                    ,sSurname
                    ,sName
                    ,dtBirthday
                    ,sSex
                    ,sEmail
                    ,sPhone
                from
                    api.v_dicUsers;";

            var result = new List<User>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        result.Add(new User
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("nId")),
                            Surname = reader.GetString(reader.GetOrdinal("sSurname")),
                            Name = reader.GetString(reader.GetOrdinal("sName")),
                            Birthday = reader.GetDateTime(reader.GetOrdinal("dtBirthday")),
                            Sex = reader.GetString(reader.GetOrdinal("sSex")),
                            Email = reader.GetString(reader.GetOrdinal("sEmail")),
                            Phone = reader.GetString(reader.GetOrdinal("sPhone")),
                        });
                    }
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения списка пользователей [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public void Insert(User entity)
        {
            const string query = @"exec api.usp_UserInsert @psSurname, @psName, @pdtBirthday, @psSex, @psPhone, @psEmail;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@psSurname", SqlDbType.NVarChar).Value = entity.Surname;
                command.Parameters.Add("@psName", SqlDbType.NVarChar).Value = entity.Name;
                command.Parameters.Add("@pdtBirthday", SqlDbType.Date).Value = entity.Birthday;
                command.Parameters.Add("@psSex", SqlDbType.Char).Value = entity.Sex;
                command.Parameters.Add("@psPhone", SqlDbType.VarChar).Value = entity.Phone;
                command.Parameters.Add("@psEmail", SqlDbType.VarChar).Value = entity.Email;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка добавления пользователя [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

        public void Delete(User entity)
        {
            const string query = @"exec api.usp_UserDelete @pnId;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@pnId", SqlDbType.Int).Value = entity.Id;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка удаления пользователя [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

        public void Update(User entity)
        {
            const string query = @"exec api.usp_UserUpdate @pnId, @psSurname, @psName, @pdtBirthday, @psSex, @psPhone, @psEmail;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@pnId", SqlDbType.NVarChar).Value = entity.Id; ;
                command.Parameters.Add("@psSurname", SqlDbType.NVarChar).Value = entity.Surname;
                command.Parameters.Add("@psName", SqlDbType.NVarChar).Value = entity.Name;
                command.Parameters.Add("@pdtBirthday", SqlDbType.Date).Value = entity.Birthday;
                command.Parameters.Add("@psSex", SqlDbType.Char).Value = entity.Sex;
                command.Parameters.Add("@psPhone", SqlDbType.VarChar).Value = entity.Phone;
                command.Parameters.Add("@psEmail", SqlDbType.VarChar).Value = entity.Email;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка изменения пользователя [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }
    }
}