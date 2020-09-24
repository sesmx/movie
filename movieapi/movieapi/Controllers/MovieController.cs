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
            var result = await query.GetAllMoviesAsync();
            return new OkObjectResult(result);
        }
    }
}
