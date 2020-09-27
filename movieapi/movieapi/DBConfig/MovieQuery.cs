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

        private async Task<List<MovieMaster>> ReadAllMoviesAsync(DbDataReader reader)
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
                        ScreeningStatus = reader.GetString(7),
                        LocationId = reader.GetInt32(8),
                        LocationName = reader.GetString(9),
                        LanguageId = reader.GetInt32(10),
                        MovieLanguage = reader.GetString(11)
                    };
                    movies.Add(movie);
                }
            }
            return movies;
        }

        private async Task<List<MovieSoundEffectDetails>> ReadAllMovieSoundEffectsAsync(DbDataReader reader)
        {
            var soundeffects = new List<MovieSoundEffectDetails>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var soundeffect = new MovieSoundEffectDetails(Db)
                    {
                        Id = reader.GetInt32(0),
                        MovieId = reader.GetInt32(1),
                        SoundEffectId = reader.GetInt32(2),
                        SoundEffect = reader.GetString(3)
                    };
                    soundeffects.Add(soundeffect);
                }
            }
            return soundeffects;
        }

        private async Task<List<MovieStillDetails>> ReadAllMovieStillsAsync(DbDataReader reader)
        {
            var moviestills = new List<MovieStillDetails>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var moviestill = new MovieStillDetails(Db)
                    {
                        Id = reader.GetInt32(0),
                        MovieId = reader.GetInt32(1),
                        MovieStillUrl = reader.GetString(2)
                    };
                    moviestills.Add(moviestill);
                }
            }
            return moviestills;
        }

        private async Task<List<LanguageMaster>> ReadAllLanguageAsync(DbDataReader reader)
        {
            var langs = new List<LanguageMaster>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var lang = new LanguageMaster(Db)
                    {
                        Id = reader.GetInt32(0),
                        MovieLanguage = reader.GetString(1)
                    };
                    langs.Add(lang);
                }
            }
            return langs;
        }

        private async Task<List<LocationMaster>> ReadAllLocationsAsync(DbDataReader reader)
        {
            var locations = new List<LocationMaster>();
            using (reader)
            {
                while (await reader.ReadAsync())
                {
                    var loc = new LocationMaster(Db)
                    {
                        Id = reader.GetInt32(0),
                        LocationName = reader.GetString(1)
                    };
                    locations.Add(loc);
                }
            }
            return locations;
        }

        public async Task<List<MovieMaster>> GetAllMoviesAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `m`.`Id`, `m`.`MovieTitle`, `m`.`Plot`, `m`.`PosterUrl`, `m`.`ImdbId`, `m`.`ImdbRating`, `m`.`ScreeningStatusId`, `sm`.`ScreeningStatus`, `m`.`LocationId`, `lom`.`LocationName`, `m`.`LanguageId`, `lm`.`MovieLanguage` FROM `movie`.`MovieMaster` `m` INNER JOIN `movie`.`LanguageMaster` `lm` ON `m`.`LanguageId` = `lm`.`Id` INNER JOIN `movie`.`LocationMaster` `lom` ON `m`.`LocationId` = `lom`.`Id` INNER JOIN `movie`.`ScreeningStatusMaster` `sm` ON `m`.`ScreeningStatusId` = `sm`.`Id`;";
            return await ReadAllMoviesAsync(await cmd.ExecuteReaderAsync());
        }

        public async Task<MovieMaster> FindMovieByIdAsync(int id)
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `m`.`Id`, `m`.`MovieTitle`, `m`.`Plot`, `m`.`PosterUrl`, `m`.`ImdbId`, `m`.`ImdbRating`, `m`.`ScreeningStatusId`, `sm`.`ScreeningStatus`, `m`.`LocationId`, `lom`.`LocationName`, `m`.`LanguageId`, `lm`.`MovieLanguage` FROM `movie`.`MovieMaster` `m` INNER JOIN `movie`.`LanguageMaster` `lm` ON `m`.`LanguageId` = `lm`.`Id` INNER JOIN `movie`.`LocationMaster` `lom` ON `m`.`LocationId` = `lom`.`Id` INNER JOIN `movie`.`ScreeningStatusMaster` `sm` ON `m`.`ScreeningStatusId` = `sm`.`Id` WHERE `m`.`Id` = @id;";
            cmd.Parameters.Add(new MySqlParameter
             {
                 ParameterName = "@id",
                 DbType = DbType.Int32,
                 Value = id,
             });
            var result = await ReadAllMoviesAsync(await cmd.ExecuteReaderAsync());
            return result.Count > 0 ? result[0] : null;
        }

        public async Task<List<MovieSoundEffectDetails>> GetAllSoundEffectDetailsAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `me`.`Id`, `me`.`MovieId`, `me`.`SoundEffectId`, `sm`.`SoundEffect` FROM `movie`.`MovieSoundEffectDetails` `me` INNER JOIN `movie`.`SoundEffectMaster` `sm` ON `me`.`SoundEffectId` = `sm`.`Id`;";
            return await ReadAllMovieSoundEffectsAsync(await cmd.ExecuteReaderAsync());
        }

        public async Task<List<MovieStillDetails>> GetAllMovieStillsAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `Id`, `MovieId`, `MovieStillUrl` FROM `movie`.`MovieStillDetails`;";
            return await ReadAllMovieStillsAsync(await cmd.ExecuteReaderAsync());
        }

        public async Task<List<LanguageMaster>> GetAllMovieLanguageAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `Id`, `MovieLanguage` FROM `movie`.`LanguageMaster`;";
            return await ReadAllLanguageAsync(await cmd.ExecuteReaderAsync());
        }

        public async Task<List<LocationMaster>> GetAllMovieLocationsAsync()
        {
            using var cmd = Db.Connection.CreateCommand();
            cmd.CommandText = @"SELECT `Id`, `LocationName` FROM `movie`.`LocationMaster` ORDER BY `LocationName`;";
            return await ReadAllLocationsAsync(await cmd.ExecuteReaderAsync());
        }
    }
}