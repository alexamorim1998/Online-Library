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
    public class RarityController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        public RarityController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/<RarityController>
        [HttpGet]
        public ActionResult<IEnumerable<Rarity>> Get()
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT * " +
                    "  FROM [tblRarity] ";
                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                using SqlDataReader dataReader = command.ExecuteReader();
                List<Rarity> list = new List<Rarity>();
                while (dataReader.Read())
                {
                    list.Add(new Rarity(
                        int.Parse(dataReader.GetValue("rarityId").ToString()),
                        int.Parse(dataReader.GetValue("points").ToString()),
                        dataReader.GetValue("description").ToString()));
                }
                return Ok(list);
            }
            catch (Exception e)
            {
                return Problem(e.StackTrace);
            }
        }

        // GET api/<RarityController>/5
        [HttpGet("{id}")]
        public ActionResult<Rarity> Get(int id)
        {
            try
            {
                string connetionString = _configuration.GetConnectionString("library");

                const string sql = "SELECT TOP (1) * " +
                    "  FROM [tblRarity] " +
                    "  WHERE " +
                    "  rarityId = @rarityID";
                
                SqlParameter param = new SqlParameter
                {
                    ParameterName = "@rarityID",
                    Value = id
                };

                using SqlConnection connection = new SqlConnection(connetionString);
                connection.Open();
                using SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.Add(param);

                using SqlDataReader dataReader = command.ExecuteReader();

                if (dataReader.Read())
                {
                    return Ok(new Rarity(
                         int.Parse(dataReader.GetValue("rarityId").ToString()),
                         int.Parse(dataReader.GetValue("points").ToString()),
                         dataReader.GetValue("description").ToString()));
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

        // POST api/<RarityController>
        [HttpPost]
        public ActionResult Post([FromBody] Rarity value)
        {
            try
            {
                //codigo para criar o Author...
                return Ok();
            }
            catch (Exception e)
            {
                return Problem(e.StackTrace);
            }
        }

        // PUT api/<RarityController>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] Rarity value)
        {
            if (id != value.rarityId)
            {
                return BadRequest();
            }
            //update
              //validate if exist
                 ///return NotFound();
              // Update
            return NoContent();
        }

        // DELETE api/<RarityController>/5
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            //validate if exist
                //return NotFound();
            
            //DELETE

            //return Ok(authorDelete);
            return Ok();
        }
    }
}
