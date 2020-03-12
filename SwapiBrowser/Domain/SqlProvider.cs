using Microsoft.Data.SqlClient;

namespace SwapiBrowser.Domain
{
    public static class Sql
    {
        const string ConnectionString = "Server=localhost;Database=StarWars;User Id=starwars;Password=starwars;";

        public static SqlConnection Connect()
        {
            return new SqlConnection(ConnectionString);
        }
    }
}
