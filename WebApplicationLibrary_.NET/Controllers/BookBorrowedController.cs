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
    public class BookBorrowedController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        public BookBorrowedController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        // GET: api/<BookBorrowedController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        // GET api/<BookBorrowedController>/5
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<Book>> Get(int id)
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT [dbo].[tblBook].* " +
                                   "FROM [dbo].[tblBook], [dbo].[tblRequisition] " +
                                   "where " +
                                   "[dbo].[tblBook].[bookId]=[dbo].[tblRequisition].bookid and " +
                                   "[dbo].[tblRequisition].memberId = @memberId and " +
                                   "[devolutionDate] is null";

                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@memberId",
                    Value = id
                };

                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(param);

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

        //// POST api/<BookBorrowedController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<BookBorrowedController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<BookBorrowedController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
