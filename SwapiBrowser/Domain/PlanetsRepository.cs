using System.Collections.Generic;
using System.Linq;
using Dapper;

namespace SwapiBrowser.Domain
{
    public class PlanetsRepository
    {
        public List<Planet> Load(int page, string orderBy = "Id")
        {
            using var sql = Sql.Connect();
            return sql.Query<Planet>($@"select * from PlanetsRaw order by {orderBy} offset @offset rows fetch next @pageSize rows only", new
            {
                offset = (page - 1) * 10,
                pageSize = 10
            }).ToList();
        }

        public Planet Get(int id)
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<Planet>("select * from dbo.PlanetsRaw where Id = @id", new {id});
        }

        public int GetTotal()
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<int>("select count(*) from dbo.PlanetsRaw");
        }
    }

    public class Planet
    {
        public int Id { get; set; }
        public string Climate { get; set; }
        public string SurfaceWater { get; set; }
        public string Name { get; set; }
        public string Diameter { get; set; }
        public string RotationPeriod { get; set; }
        public string Terrain { get; set; }
        public string Gravity { get; set; }
        public string OrbitalPeriod { get; set; }
        public string Population { get; set; }

    }
}
