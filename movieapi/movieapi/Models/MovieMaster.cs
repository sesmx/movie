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
        public string ScreeningStatus { get; set; }
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public int LanguageId { get; set; }
        public string MovieLanguage { get; set; }
        public List<MovieSoundEffectDetails> soundEffects { get; set; }
        public List<MovieStillDetails> movieStills { get; set; }
    }

    public class LocationMaster
    {
        internal AppDb Db { get; set; }

        public LocationMaster() { }

        internal LocationMaster(AppDb db)
        {
            Db = db;
        }

        public int Id { get; set; }
        public string LocationName { get; set; }
    }

    public class LanguageMaster
    {
        internal AppDb Db { get; set; }

        public LanguageMaster() { }

        internal LanguageMaster(AppDb db)
        {
            Db = db;
        }

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
        internal AppDb Db { get; set; }

        public SoundEffectMaster() { }

        internal SoundEffectMaster(AppDb db)
        {
            Db = db;
        }

        public int Id { get; set; }
        public string SoundEffect { get; set; }
    }

    public class MovieStillDetails
    {
        internal AppDb Db { get; set; }

        public MovieStillDetails() { }

        internal MovieStillDetails(AppDb db)
        {
            Db = db;
        }

        public int Id { get; set; }
        public int MovieId { get; set; }
        public string MovieStillUrl { get; set; }
    }

    public class MovieSoundEffectDetails
    {
        internal AppDb Db { get; set; }

        public MovieSoundEffectDetails() { }

        internal MovieSoundEffectDetails(AppDb db)
        {
            Db = db;
        }

        public int Id { get; set; }
        public int MovieId { get; set; }
        public int SoundEffectId { get; set; }
        public string SoundEffect { get; set; }
    }
}