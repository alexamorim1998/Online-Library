using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using WebApplicationLibrary.Models;
using System.Data;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApplicationLibrary.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public AuthorController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/<AuthorController>
        [HttpGet]
        public ActionResult<IEnumerable<Author>> Get()
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT * " +
                    "  FROM [tblAuthor] ";
                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                using SqlDataReader dataReader = command.ExecuteReader();
                List<Author> list = new List<Author>();
                while (dataReader.Read())
                {
                    list.Add(new Author(
                        int.Parse(dataReader.GetValue("authorId").ToString()),
                        dataReader.GetValue("firstName").ToString(),
                        dataReader.GetValue("lastName").ToString()));
                }
                return Ok(list);
            }
            catch (Exception e)
            {
                return Problem(e.StackTrace);
            }
        }

        // GET api/<AuthorController>/5
        [HttpGet("{id}")]
        public ActionResult<Author> Get(int id)
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT Top 1 * " +
                    "  FROM [tblAuthor]" +
                    "  WHERE " +
                    "  authorId = @authorID";

                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@authorID",
                    Value = id
                };


                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(param);

                using SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    return Ok(new Author(
                        int.Parse(dataReader.GetValue("authorId").ToString()),
                        dataReader.GetValue("firstName").ToString(),
                        dataReader.GetValue("lastName").ToString()));
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception e)
            {
                return Problem(e.StackTrace);
            }
        }

        // POST api/<AuthorController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<AuthorController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<AuthorController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
