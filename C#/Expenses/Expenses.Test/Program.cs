using System;
using Expenses.DataAccess;

namespace Expenses.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            var da = new PlaceDA();
            var entities = da.GetAll();

            foreach (var entity in entities)
            {
                Console.WriteLine(entity.Name);
            }
            Console.ReadLine();
        }
    }
}
