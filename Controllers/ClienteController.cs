using CRUD.Context;
using CRUD.Model;
using CRUD.Model.Dto;
using FluentValidation;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;

namespace CRUD.Controllers
{
    [ApiController]
    [Route("Clientes")]
    public class ClienteController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        private readonly IValidator<ClienteDto> _validator;

        public ClienteController(ApplicationDbContext context, IValidator<ClienteDto> validator)
        {
            _context = context;
            _validator = validator;
        }

        [HttpGet("list")]
        public async Task<ActionResult<List<ClienteDto>>> Get()
        {
            var clientes = await _context.Clientes.Where(c => c.estado == "activo").ToListAsync();
            return Ok(clientes);
        }

        [HttpPost("Get")]
        public async Task<ActionResult<ClienteDto>> Get([FromBody] JsonElement parametros)
        {
            try
            {
                int idIN = parametros.GetProperty("id").GetInt32();
                var cliente = await _context.Clientes.FindAsync(idIN);

                if (cliente == null || cliente.estado != "activo")
                {
                    return NotFound(new { message = "Cliente no encontrado o inactivo" });
                }

                return Ok(cliente);
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al procesar la solicitud: {ex.Message}" });
            }
        }

        // Crear Cliente
        [HttpPost("Add")]
        public async Task<ActionResult> Post([FromBody] ClienteDto cliente)
        {
            var validationResult = await _validator.ValidateAsync(cliente);
            if (!validationResult.IsValid)
            {
                return BadRequest(validationResult.Errors);
            }

            cliente.estado = "activo"; // Por defecto, establecer el estado como activo al crear un cliente

            _context.Clientes.Add(cliente);
            await _context.SaveChangesAsync();

            return Ok(new { message = "Cliente Creado" });
        }

        // Update Cliente
        [HttpPut("Update")]
        public async Task<ActionResult> Put([FromBody] ClienteDto cliente)
        {
            var validationResult = await _validator.ValidateAsync(cliente);
            if (!validationResult.IsValid)
            {
                return BadRequest(validationResult.Errors);
            }

            var existingCliente = await _context.Clientes.FindAsync(cliente.id);
            if (existingCliente == null)
            {
                return NotFound(new { message = "Cliente no encontrado" });
            }

            existingCliente.id_banco = cliente.id_banco;
            existingCliente.nombre = cliente.nombre;
            existingCliente.apellido = cliente.apellido;
            existingCliente.documento = cliente.documento;
            existingCliente.direccion = cliente.direccion;
            existingCliente.mail = cliente.mail;
            existingCliente.celular = cliente.celular;

            await _context.SaveChangesAsync();

            return Ok(new { message = "Cliente Actualizado" });
        }

        // Eliminar Cliente
        [HttpDelete("Delete")]
        public async Task<ActionResult> Delete([FromBody] JsonElement parametros)
        {
            try
            {
                int id = parametros.GetProperty("id").GetInt32();

                var cliente = await _context.Clientes.FindAsync(id);
                if (cliente == null)
                {
                    return NotFound(new { message = "Cliente no encontrado" });
                }

                _context.Clientes.Remove(cliente);
                await _context.SaveChangesAsync();

                return Ok(new { message = "Cliente Eliminado" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { message = $"Error al procesar la solicitud: {ex.Message}" });
            }
        }
    }
}
