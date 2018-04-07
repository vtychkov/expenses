using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Expenses.DataAccess
{
    public class PaymentTypeDA : BaseDA
    {
        public PaymentType Get(int id)
        {
            const string query =
                @"select
                    nId
                    ,sName
                from
                    api.v_dicPaymentTypes  
                where
                	nId = @pnId;";
            var result = new PaymentType();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    reader.Read();
                    result = new PaymentType
                    {
                        Id = reader.GetByte(reader.GetOrdinal("nId")),
                        Name = reader.GetString(reader.GetOrdinal("sName")),
                    };
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения типа оплаты [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public IEnumerable<PaymentType> GetAll()
        {
            const string query =
                @"select
                    nId
                    ,sName
                from
                    api.v_dicPaymentTypes;";

            var result = new List<PaymentType>();

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                try
                {
                    connection.Open();
                    var reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        result.Add(new PaymentType
                        {
                            Id = reader.GetByte(reader.GetOrdinal("nId")),
                            Name = reader.GetString(reader.GetOrdinal("sName")),
                        });
                    }
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка получения списка типов оплаты [{0}, {1}]", e.Message, e.InnerException));
                }
            }

            return result;
        }

        public void Insert(PaymentType entity)
        {
            const string query = @"exec api.usp_PaymentTypeInsert @psName;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@psName", SqlDbType.NVarChar).Value = entity.Name;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка добавления типа оплаты [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

        public void Delete(PaymentType entity)
        {
            const string query = @"exec api.usp_PaymentTypeDelete @pnId;";

            using (var connection = new SqlConnection(ConnectionString))
            {
                var command = new SqlCommand(query, connection);
                command.Parameters.Add("@pnId", SqlDbType.TinyInt).Value = entity.Id;
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception(string.Format("Ошибка удаления типа оплаты [{0}, {1}]", e.Message, e.InnerException));
                }
            }
        }

    }
}
