using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Expenses.DataAccess
{
    public class CategoryDA : BaseDA
    {
        public Category Get(int id)
        {
            const string query =
                @"select
                    nId
                    ,sName
                    ,nParentId
                from
                    api.v_dicCategories  
                where
                	nId = @pnId;";
            var result = new Category();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    reader.Read();
                    result = new Category
                    {
                        Id = reader.GetInt16(reader.GetOrdinal("nId")),
                        Name = reader.GetString(reader.GetOrdinal("sName")),
                        ParentId = reader.IsDBNull(reader.GetOrdinal("nParentId")) ? (int?)null : reader.GetInt16(reader.GetOrdinal("nParentId")),
                    };
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения категории [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public IEnumerable<Category> GetAll()
        {
            const string query =
                @"select
                    nId
                    ,sName
                    ,nParentId
                from
                    api.v_dicCategories;";

            var result = new List<Category>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        result.Add(new Category
                        {
                            Id = reader.GetInt16(reader.GetOrdinal("nId")),
                            Name = reader.GetString(reader.GetOrdinal("sName")),
                            ParentId = reader.IsDBNull(reader.GetOrdinal("nParentId")) ? (int?)null : reader.GetInt16(reader.GetOrdinal("nParentId")),
                        });
                    }
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения списка категорий [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public void Insert(Category entity)
        {
            const string query = @"exec api.usp_CategoryInsert @psName, @pnParentId;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@psName", SqlDbType.NVarChar).Value = entity.Name;
                command.Parameters.Add("@pnParentId", SqlDbType.SmallInt).Value = entity.ParentId;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка добавления категории [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

        public void Delete(Category entity)
        {
            const string query = @"exec api.usp_CategoryDelete @pnId;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@pnId", SqlDbType.SmallInt).Value = entity.Id;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка удаления категории [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

    }
}
