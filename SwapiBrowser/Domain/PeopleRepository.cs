using Dapper;
using System.Collections.Generic;
using System.Linq;

namespace SwapiBrowser.Domain
{
    public class PeopleRepository
    {
        private const int pageSize = 10;
        public List<Person> Load(int page, string orderBy = "Id")
        {
            using var sql = Sql.Connect();
            return sql.Query<Person>($"select * from PeopleRaw order by {orderBy} offset @offset rows fetch next @pageSize rows only", new
            {
                pageSize,
                offset = (page - 1) * pageSize,
                orderBy
            }).ToList();
        }

        public Person Get(in int id)
        {
            using var sql = Sql.Connect();
            return sql.QueryFirst<Person>("select * from PeopleRaw where Id = @id", new {id});
        }

        public int GetTotal()
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<int>("select count(*) from PeopleRaw");
        }

        public List<int> LoadByHomeworldTree()
        {
            using var sql = Sql.Connect();
            return sql.Query<int>("select distinct Homeworld from dbo.PeopleRaw").ToList();
        }

        public List<PersonHomeworldIndexRow> LoadByHomeworld(int? homeworld, int page)
        {
            using var sql = Sql.Connect();
            return sql.Query<PersonHomeworldIndexRow>(@"
select Id, Homeworld
from dbo.PeopleRaw 
where PeopleRaw.Homeworld = @homeworld or @homeworld is null
order by Homeworld, Id
offset @offset rows 
fetch next @pageSize rows only", new
            {
                offset = (page - 1) * 10,
                pageSize = 10,
                homeworld
            }).ToList();
        }

        public int GetTotalByHomeworld(int? homeworld)
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<int>("select count(*) from PeopleRaw where PeopleRaw.Homeworld = @homeworld or @homeworld is null",
                new {homeworld});
        }

        public List<string> LoadByGenderAndBirthYearTree()
        {
            using var sql = Sql.Connect();
            return sql.Query<string>("select distinct Gender from PeopleRaw where PeopleRaw.BirthYearParsed is not null").ToList();
        }

        public List<PersonByGenderAndBirthYearIndexRow> LoadByGenderAndBirthYear(string gender, int page = 1)
        {
            using var sql = Sql.Connect();
            var query = @"
select
    Id,
    BirthYearParsed as BirthYear,
    Gender
from PeopleRaw
where BirthYearParsed is not null
    and (Gender = @gender or @gender is null)
order by Gender, BirthYearParsed desc
offset @offset rows
fetch next @pageSize rows only";

            return sql.Query<PersonByGenderAndBirthYearIndexRow>(query, new
            {
                gender,
                offset = (page - 1) * 10,
                pageSize = 10
            }).ToList();
        }

        public List<string> LoadByGenderAndBirthYearCoveringTree()
        {
            using var sql = Sql.Connect();
            return sql.Query<string>("select distinct Gender from PeopleRaw where PeopleRaw.BirthYearParsed is not null").ToList();
        }

        public int GetTotalByGenderAndBirthYear(string gender)
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<int>("select count(*) from PeopleRaw where BirthYearParsed is not null and (Gender = @gender or @gender is null)",
                new {gender});
        }

        public List<PersonByGenderAndBirthYearCoveringIndexRow> LoadByGenderAndBirthYearCovering(string gender, int page = 1)
        {
            using var sql = Sql.Connect();
            var query = @"
select
    Id,
    BirthYearParsed as BirthYear,
    Gender,
    Name,
    MassParsed
from PeopleRaw
where BirthYearParsed is not null
    and (Gender = @gender or @gender is null)
order by Gender, BirthYearParsed desc
offset @offset rows
fetch next @pageSize rows only";

            return sql.Query<PersonByGenderAndBirthYearCoveringIndexRow>(query, new
            {
                gender,
                offset = (page - 1) * 10,
                pageSize = 10
            }).ToList();
        }

        public int GetTotalByGenderAndBirthYearCovering(string gender)
        {
            using var sql = Sql.Connect();
            return sql.QueryFirstOrDefault<int>("select count(*) from PeopleRaw where BirthYearParsed is not null and (Gender = @gender or @gender is null)",
                new {gender});
        }
    }

    public class Person
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string SkinColor { get; set; }
        public string HairColor { get; set; }
        public string EyeColor { get; set; }
        public string Mass { get; set; }
        public string Height { get; set; }
        public string BirthYear { get; set; }
        public int Homeworld { get; set; }
    }

    public class PersonHomeworldIndexRow
    {
        public int Id { get; set; }
        public int Homeworld { get; set; }
    }

    public class PersonByGenderAndBirthYearIndexRow
    {
        public int Id { get; set; }
        public string Gender { get; set; }
        public double BirthYear { get; set; }
    }

    public class PersonByGenderAndBirthYearCoveringIndexRow
    {
        public int Id { get; set; }
        public string Gender { get; set; }
        public double BirthYear { get; set; }
        public string Name { get; set; }
        public double Mass { get; set; }
    }
}
