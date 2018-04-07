using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Expenses.DataAccess
{
    public class PlaceDA : BaseDA
    {
        public Place Get(int id)
        {
            const string query =
                @"select
                    nId
                    ,sName
                    ,sAddress
                from
                    api.v_dicPlaces
                where
                	nId = @pnId;";
            var result = new Place();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    reader.Read();
                    result = new Place
                    {
                        Id = reader.GetInt16(reader.GetOrdinal("nId")),
                        Name = reader.GetString(reader.GetOrdinal("sName")),
                        Address = reader.GetString(reader.GetOrdinal("sAddress")),
                    };
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения места [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public IEnumerable<Place> GetAll()
        {
            const string query =
                @"select
                    nId
                    ,sName
                    ,sAddress
                from
                    api.v_dicPlaces;";

            var result = new List<Place>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        result.Add(new Place
                        {
                            Id = reader.GetInt16(reader.GetOrdinal("nId")),
                            Name = reader.GetString(reader.GetOrdinal("sName")),
                            Address = reader.GetString(reader.GetOrdinal("sAddress")),
                        });
                    }
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения списка мест [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }
        public void Insert(Place entity)
        {
            const string query = @"exec api.usp_PlaceInsert @psName, @psAddress;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@psName", SqlDbType.NVarChar).Value = entity.Name;
                command.Parameters.Add("@psAddress", SqlDbType.NVarChar).Value = entity.Address;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка добавления места [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

        public void Delete(Place entity)
        {
            const string query = @"exec api.usp_PlaceDelete @pnId;";

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
                    throw new Exception(string.Format("Ошибка удаления места [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

    }
}
