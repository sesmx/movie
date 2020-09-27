using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace movieapi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        public AppDb Db { get; }

        public MovieController(AppDb db)
        {
            Db = db;
        }

        [HttpGet("GetAll")]
        [ActionName("GetAll")]
        public async Task<IActionResult> GetAll()
        {
            await Db.Connection.OpenAsync();
            var query = new MovieQuery(Db);
            var movies = await query.GetAllMoviesAsync();
            var allSoundEffects = await query.GetAllSoundEffectDetailsAsync();
            var allMovieStills = await query.GetAllMovieStillsAsync();
            movies.ForEach(m =>
            {
                m.soundEffects = allSoundEffects.Where(se => se.MovieId == m.Id).ToList();
                m.movieStills = allMovieStills.Where(st => st.MovieId == m.Id).ToList();
            });
            await Db.Connection.CloseAsync();
            return new OkObjectResult(movies);
        }

        [HttpGet("GetOne")]
        [ActionName("GetOne")]
        public async Task<IActionResult> GetOne(int id)
        {
            await Db.Connection.OpenAsync();
            var query = new MovieQuery(Db);
            var movie = await query.FindMovieByIdAsync(id);
            var allSoundEffects = await query.GetAllSoundEffectDetailsAsync();
            var allMovieStills = await query.GetAllMovieStillsAsync();
            if (movie != null && movie.Id > default(int))
            {
                movie.soundEffects = allSoundEffects.Where(se => se.MovieId == movie.Id).ToList();
                movie.movieStills = allMovieStills.Where(st => st.MovieId == movie.Id).ToList();
            }
            await Db.Connection.CloseAsync();
            return new OkObjectResult(movie);
        }

        [HttpGet("Languages")]
        [ActionName("Languages")]
        public async Task<IActionResult> Languages()
        {
            await Db.Connection.OpenAsync();
            var query = new MovieQuery(Db);
            var langs = await query.GetAllMovieLanguageAsync();
            await Db.Connection.CloseAsync();
            return new OkObjectResult(langs);
        }

        [HttpGet("Locations")]
        [ActionName("Locations")]
        public async Task<IActionResult> Locations()
        {
            await Db.Connection.OpenAsync();
            var query = new MovieQuery(Db);
            var langs = await query.GetAllMovieLocationsAsync();
            await Db.Connection.CloseAsync();
            return new OkObjectResult(langs);
        }
    }
}
