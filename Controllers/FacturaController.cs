using CRUD.Model.Dao;
using CRUD.Model.Dto;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace CRUD.Controllers
{
    [ApiController]
    [Route("Facturas")]
    public class FacturaController : ControllerBase
    {
        private readonly FacturaDao dao;
        private readonly IValidator<FacturaDto> _validator;

        public FacturaController(IValidator<FacturaDto> validator)
        {
            dao = new FacturaDao();
            _validator = validator;
        }

        [HttpGet("list")]
        public async Task<ActionResult<List<FacturaDto>>> Get()
        {
            return Ok(await dao.GetAllFacturas());
        }

        [HttpPost("Get")]
        public async Task<ActionResult<List<FacturaDto>>> Get([FromBody] JsonElement parametros)
        {
            try
            {
                int idIN = parametros.GetProperty("id").GetInt32();
                var result = await dao.GetFactura(idIN);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al procesar la solicitud: {ex.Message}" });
            }
        }

        // Crear Factura
        [HttpPost("Add")]
        public async Task<ActionResult> Post([FromBody] FacturaDto factura)
        {
            var validationResult = await _validator.ValidateAsync(factura);
            if (!validationResult.IsValid)
            {
                return BadRequest(validationResult.Errors);
            }

            await dao.CreateFactura(factura);
            return Ok(new { message = "Factura Creada" });
        }

        // Update Factura
        [HttpPut("Update")]
        public async Task<ActionResult> Put([FromBody] FacturaDto factura)
        {
            var validationResult = await _validator.ValidateAsync(factura);
            if (!validationResult.IsValid)
            {
                return BadRequest(validationResult.Errors);
            }

            await dao.UpdateFactura(factura);
            return Ok(new { message = "Factura Actualizada" });
        }

        // Eliminar Factura
        [HttpDelete("Delete")]
        public async Task<ActionResult> Delete([FromBody] JsonElement parametros)
        {
            try
            {
                int id = parametros.GetProperty("id").GetInt32();
                await dao.DeleteFactura(id);
                return Ok(new { message = "Factura Eliminada" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al procesar la solicitud: {ex.Message}" });
            }
        }
    }
}
