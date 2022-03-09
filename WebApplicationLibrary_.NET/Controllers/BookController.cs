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
    public class BookController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public BookController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/<BookController>
        [HttpGet]
        public ActionResult<IEnumerable<Book>> Get()
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT * " +
                    "  FROM [tblBook] ";
                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                using SqlDataReader dataReader = command.ExecuteReader();
                
                List<Book> list = new List<Book>();
                while (dataReader.Read())
                {
                    list.Add(new Book(
                        int.Parse(dataReader.GetValue("bookId").ToString()),
                        int.Parse(dataReader.GetValue("authorId").ToString()),
                        dataReader.GetValue("ISBN").ToString(),
                        int.Parse(dataReader.GetValue("rarityId").ToString()),
                        dataReader.GetValue("title").ToString(),
                        bool.Parse(dataReader.GetValue("isBorrowed").ToString())
                        ));
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
        public ActionResult<Book> Get(int id)
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT Top 1 * " +
                    "  FROM [tblBook]" +
                    "  WHERE " +
                    "  bookId = @bookID";

                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@bookID",
                    Value = id
                };


                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(param);

                using SqlDataReader dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    return Ok(new Book(
                        int.Parse(dataReader.GetValue("bookId").ToString()),
                        int.Parse(dataReader.GetValue("authorId").ToString()),
                        dataReader.GetValue("ISBN").ToString(),
                        int.Parse(dataReader.GetValue("rarityId").ToString()),
                        dataReader.GetValue("title").ToString(),
                        bool.Parse(dataReader.GetValue("isBorrowed").ToString())));
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
