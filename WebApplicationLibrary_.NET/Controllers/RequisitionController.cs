using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using WebApplicationLibrary.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApplicationLibrary.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RequisitionController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public RequisitionController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/<RequisitionController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        //// GET api/<RequisitionController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST api/<RequisitionController>
        [HttpPost]
        public ActionResult<ResultRequisition> Post([FromBody] RequisitionModel value)
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand
                {
                    Connection = connection,
                    CommandType = CommandType.StoredProcedure,
                    CommandText = "RequisicaoLivroMembro"
                };

                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@memberId",
                    Value = value.memberId,
                    Direction = ParameterDirection.Input,
                    SqlDbType=SqlDbType.Int
                };
                command.Parameters.Add(param);
                param = new SqlParameter
                {
                    ParameterName = "@bookId",
                    Value = value.bookId,
                    Direction = ParameterDirection.Input,
                    SqlDbType = SqlDbType.Int
                };
                command.Parameters.Add(param);
                param = new SqlParameter
                {
                    ParameterName = "@success",
                    Direction = ParameterDirection.Output,
                    SqlDbType = SqlDbType.Bit
                };
                command.Parameters.Add(param);
                param = new SqlParameter
                {
                    ParameterName = "@Detalhe",
                    Direction = ParameterDirection.Output,
                    Size=50,
                    SqlDbType=SqlDbType.VarChar
                };
                command.Parameters.Add(param);
                
                int i = command.ExecuteNonQuery();
                //Storing the output parameters value in 3 different variables.  
                bool sucesso = Convert.ToBoolean(command.Parameters["@success"].Value);
                string detalhe = Convert.ToString(command.Parameters["@Detalhe"].Value);

                return Ok(new ResultRequisition()
                {
                    Sucesso = sucesso,
                    Detalhe = detalhe
                });
            }
            catch (Exception e)
            {
                return Problem(e.StackTrace);
            }

        }

        // PUT api/<RequisitionController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<RequisitionController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
