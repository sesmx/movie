using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace movieapi
{
    public class MovieMaster
    {
        internal AppDb Db { get; set; }

        public MovieMaster() { }

        internal MovieMaster(AppDb db)
        {
            Db = db;
        }

        public int Id { get; set; }
        public string MovieTitle { get; set; }
        public string Plot { get; set; }
        public string PosterUrl { get; set; }
        public string ImdbId { get; set; }
        public double ImdbRating { get; set; }
        public int ScreeningStatusId { get; set; }
        public int LocationId { get; set; }
        public int LanguageId { get; set; }
    }

    public class LocationMaster
    {
        public int Id { get; set; }
        public string LocationName { get; set; }
    }

    public class LanguageMaster
    {
        public int Id { get; set; }
        public string MovieLanguage { get; set; }
    }

    public class ScreeningStatusMaster
    {
        public int Id { get; set; }
        public string ScreeningStatus { get; set; }
    }

    public class SoundEffectMaster
    {
        public int Id { get; set; }
        public string SoundEffect { get; set; }
    }

    public class MovieStillDetails
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public string MovieStillUrl { get; set; }
    }

    public class MovieSoundEffectDetails
    {
        public int Id { get; set; }
        public int MovieId { get; set; }
        public int SoundEffectId { get; set; }
    }
}