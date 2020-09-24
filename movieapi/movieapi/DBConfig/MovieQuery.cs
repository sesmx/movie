using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Threading.Tasks;
using MySqlConnector;

namespace movieapi
{
    public class MovieQuery
    {
        public AppDb Db { get; }

        public MovieQuery(AppDb db)
        {
            Db = db;
        }

        private async Task<List<MovieMaster>> ReadAllAsync(DbDataReader reader)
        {
            var movies = new List<MovieMaster>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var movie = new MovieMaster(Db)
                    {
                        Id = reader.GetInt32(0),
                        MovieTitle = reader.GetString(1),
                        Plot = reader.GetString(2),
                        PosterUrl = reader.GetString(3),
                        ImdbId = reader.GetString(4),
                        ImdbRating = reader.GetDouble(5),
                        ScreeningStatusId = reader.GetInt32(6),
                        LocationId = reader.GetInt32(7),
                        LanguageId = reader.GetInt32(8)
                    };
                    movies.Add(movie);
                }
            }
            return movies;
        }

        public async Task<List<MovieMaster>> GetAllMoviesAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `Id`, `MovieTitle`, `Plot`, `PosterUrl`, `ImdbId`, `ImdbRating`, `ScreeningStatusId`, `LocationId`, `LanguageId` FROM `movie`.`MovieMaster`;";
            return await ReadAllAsync(await cmd.ExecuteReaderAsync());
        }
    }
}
